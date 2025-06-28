import 'package:resumebuilderadmin/core/external/lib_stomp.dart';
import 'package:resumebuilderadmin/core/logger/wtoolbox_logger.dart';

abstract class WTSocket {

  StompClient? client;

  String? wsAddress;
  void setWebSocketAddress(String? value) { wsAddress = value; }

  String? subscribeDestination;
  void setSubscribeDestination(String? value) { subscribeDestination = value; }

  String? messageSendAddress;
  void setMessageSendAddress(String? value) { messageSendAddress = value!; }

  Map<String, String>? clientHeaders = <String, String>{};
  void setClientHeaders(Map<String, String>? headers) {
    clientHeaders!
      ..clear()
      ..addAll(headers!);
  }

  bool? connected = false;
  void isConnected(bool? value) { connected = value; }

  String? errorMessage = '';
  void setErrorMessage({ bool? show, String? message }) {
    WTLogger.write(message);
    errorMessage = show! ? message! : '';
  }

  Future<void> start();

  void stop();

  Future<void> restart();

  void onError(String? e);

  void onConnect(StompFrame sF);

  Future<void> receive(StompFrame sF);

  void send({ Map<String, String>? headers, String? body });

}