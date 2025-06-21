import 'dart:convert';
import '../../../3rd_party/lib_getx.dart';
import '../../../3rd_party/lib_stomp.dart';
import '../../../3rd_party/lib_uuid.dart';
import '../wtoolbox_connector_service.dart';
import '../../../helper/logger/wtoolbox_logger.dart';
import '../../../observable/wtoolbox_observable.dart';

class WTConnectorServiceImpl extends WTConnectorService {

  @override
  Future<void> connect() async {
    StompConfig stompConfig = StompConfig(
      url:                     wsAddress!,
      reconnectDelay:          const Duration(seconds: 5),
      heartbeatIncoming:       const Duration(seconds: 5),
      heartbeatOutgoing:       const Duration(seconds: 10),
      stompConnectHeaders:     clientHeaders,
      webSocketConnectHeaders: clientHeaders,
      onConnect:               onConnectCallback,
      onStompError:            (StompFrame sF) => WTLogger.write('WTConnectorService.connect onStompError: headers: ${sF.headers}, body: ${sF.body}'),
      onDisconnect:            (StompFrame sF) => WTLogger.write('WTConnectorService.connect onDisconnect: headers: ${sF.headers}, body: ${sF.body}'),
      onUnhandledFrame:        (StompFrame sF) => WTLogger.write('WTConnectorService.connect onUnhandledFrame: headers: ${sF.headers}, body: ${sF.body}'),
      onUnhandledMessage:      (StompFrame sF) => WTLogger.write('WTConnectorService.connect onUnhandledMessage: headers: ${sF.headers}, body: ${sF.body}'),
      onUnhandledReceipt:      (StompFrame sF) => WTLogger.write('WTConnectorService.connect onUnhandledReceipt: headers: ${sF.headers}, body: ${sF.body}'),
      onWebSocketError:        (dynamic e) => WTLogger.write('WTConnectorService.connect onWebSocketError: ${e.toString()}'),
      onDebugMessage:          onDebugMessage,
    );

    client = StompClient(config: stompConfig);
    client!.activate();
  }

  @override
  void disconnect() {
    client!.deactivate();
    client = null;
    isConnected(false);
  }

  @override
  Future<void> restart() async {
    disconnect();
    await connect();
  }

  @override
  void onDebugMessage(String? e) {
    if(e!.contains('<<< TOKEN_MISSING')) {
      isConnected(false);
      setErrorMessage(show: true, message: '${'stompError1'.tr}. ${'errorTitle'.tr}: $e');
    }else if(e.contains('<<< TOKEN_INVALID')) {
      isConnected(false);
      setErrorMessage(show: true, message: '${'stompError2'.tr}. ${'errorTitle'.tr}: $e');
    }else if(e.contains('Unknown connection error')) {
      isConnected(false);
      setErrorMessage(show: true, message: '${'stompError3'.tr}. ${'errorTitle'.tr}: $e');
    }else if(e.contains('Connection error')) {
      isConnected(false);
      setErrorMessage(show: true, message: '${'stompError4'.tr}. ${'errorTitle'.tr}: $e');
    }else {
      if(!connected!) {
        isConnected(true);
      }
      if(connected! && errorMessage!.isNotEmpty) {
        setErrorMessage(show: false, message: '');
      }
    }
  }

  @override
  void onConnectCallback(StompFrame sF) async {
    WTLogger.write('WTConnectorService.onConnectCallback successfully connected to: $wsAddress.');
    isConnected(true);

    client!.subscribe(
      destination: subscribeDestination!, 
      headers: clientHeaders, 
      callback: (f) async => await receive(f)
    );
  }

  @override
  Future<void> receive(StompFrame sF) async {
    Map<String, String> headers = sF.headers;
    String? body                = String.fromCharCodes(sF.binaryBody!);
    
    if(body.isNotEmpty && body.contains('transportId')) {
      WTLogger.write('WTConnectorService.receive(): Message received successfully.');
    }

    if(body.isNotEmpty && !body.contains('transportId')) {
      Get.find<WTObservable>().notifySubscriber({ 'headers': headers, 'body': body });
    }
  }

  @override
  void send({ Map<String, String>? headers, String? body }) {
    Map<String, String>? msgHeaders = headers!.isEmpty ? <String, String>{} : headers;
    if(msgHeaders.isNotEmpty && !headers.containsKey('transportId')) { msgHeaders['transportId'] = uuid.v4(); }
    
    String? msgBody = jsonEncode(body);
    
    connected == true
      ? client!.send(destination: messageSendAddress!, headers: msgHeaders, body: msgBody)
      : WTLogger.write('WTConnectorService.send() error: Internet connection error.');
  }

}