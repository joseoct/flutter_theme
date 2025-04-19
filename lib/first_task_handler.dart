import 'dart:async';
import 'dart:developer';

import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:notification_listener_service/notification_listener_service.dart';

class MyTaskHandler extends TaskHandler {
  StreamSubscription? _notificationSubscription;
  final List<String> _notifications = [];

  @override
  Future<void> onStart(DateTime timestamp, TaskStarter taskStarter) async {
    _notificationSubscription = NotificationListenerService.notificationsStream
        .listen((event) {
          final text =
              "${event.packageName} - ${event.title}: ${event.content}";
          log("Notificação recebida: $text");
          _notifications.add(text);
        });
  }

  @override
  Future<void> onDestroy(DateTime timestamp, bool isTimeout) async {
    await _notificationSubscription?.cancel();
  }

  @override
  void onRepeatEvent(DateTime timestamp) {}
  @override
  void onReceiveData(Object data) {}
  @override
  void onNotificationButtonPressed(String id) {}
  @override
  void onNotificationPressed() {}
  @override
  void onNotificationDismissed() {}
}
