import 'dart:convert';
import 'package:resumebuilderadmin/core/external/lib_getx.dart';
import 'package:resumebuilderadmin/core/external/lib_uuid.dart';
import 'package:resumebuilderadmin/core/logger/wtoolbox_logger.dart';
import 'package:resumebuilderadmin/core/socket/wtoolbox_socket.dart';
import 'package:resumebuilderadmin/core/entity/message/message.dart';
import 'package:resumebuilderadmin/core/repository/message/message_in/message_in_repository.dart';
import 'package:resumebuilderadmin/core/repository/message/message_out/message_out_repository.dart';
import '../wtoolbox_notifier_service.dart';
import '../wtoolbox_notifier.dart';

class WTNotifierServiceImpl extends WTNotifierService {

  @override
  void subscribe(WTNotifier? notifier) {
    if(notifiers!.where((o) => o.getTitle() == notifier!.getTitle()).isEmpty) {
      notifiers!.add(notifier!);
    }
  }

  @override
  void unsubscribe(String? title) {
    if(notifiers!.where((o) => o.getTitle() == title).isNotEmpty) {
      notifiers!.removeWhere((o) => o.getTitle() == title);
    }
  }

  @override
  void notifySubscriber(Map<String, dynamic>? message) async {
    if(notifiers!.where((o) => o.getTitle() == message!['header']['application']).isNotEmpty) {
      final notifier = notifiers!.firstWhere((o) => o.getTitle() == message!['header']['application']);
      notifier.notify(message);
    }
  }

  @override
  Future<void> checkForUnSendMessages() async {
    List<Message> list = await Get.find<MessageOutRepository>().getAll();

    if(list.isNotEmpty) {
      if(Get.find<WTSocket>().connected == false) {
        WTLogger.write('WTNotifierService.checkForUnSendMessages() error: Internet connection error.');
      }
      if(Get.find<WTSocket>().connected == true) {
        for(Message m in list) {
          Get.find<WTSocket>().send(headers: m.headers, body: m.body);
        }
      }
    }
  }

  @override
  Future<void> send({ Map<String, String>? headers, Map<String, dynamic>? body }) async {
    Message? message = Message()
      ..setId(uuid.v4())
      ..setRead(false)
      ..setHeaders(headers)
      ..setBody(jsonEncode(body));
    await Get.find<MessageOutRepository>().insert(message);
    
    headers!['transportId'] = message.id!;

    Get.find<WTSocket>().connected == true
      ? Get.find<WTSocket>().send(headers: headers, body: message.body)
      : WTLogger.write('WTNotifierService.send() error: Internet connection error.');
  }

  @override
  Future<void> receive({ Map<String, String>? headers, String? body }) async {
    if(!body!.contains('transportId')) {
      Message? m = Message()
        ..setKey(0)
        ..setDate('')
        ..setId('')
        ..setRead(false)
        ..setHeaders(headers)
        ..setBody(jsonEncode(body));

      bool? created = await Get.find<MessageInRepository>().insert(m);
      if(created) { notifySubscriber({ 'message': m }); }
    }
  }

}