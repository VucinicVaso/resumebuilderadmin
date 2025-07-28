import 'wt_notifier.dart';

abstract class WTNotifierService {

  // list of notifiers
  List<WTNotifier>? notifiers = List<WTNotifier>.empty(growable: true);

  // subscribe notifier
  void subscribe(WTNotifier? notifier);

  // unsubscribe notifier
  void unsubscribe(String? title);

  // notify notifier when new message is received
  void notifySubscriber(Map<String, dynamic>? message);

  // send message
  Future<void> send({ Map<String, String>? headers, Map<String, dynamic>? body });

  // receive message
  Future<void> receive({ Map<String, String>? headers, String? body });

}