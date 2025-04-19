import 'dart:io';

import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:notification_listener_service/notification_listener_service.dart';

class NotificationService {
  static Future<void> requestPermissions() async {
    if (await FlutterForegroundTask.checkNotificationPermission() !=
        NotificationPermission.granted) {
      await FlutterForegroundTask.requestNotificationPermission();
    }

    if (!await NotificationListenerService.isPermissionGranted()) {
      await NotificationListenerService.requestPermission();
    }

    if (Platform.isAndroid) {
      if (!await FlutterForegroundTask.isIgnoringBatteryOptimizations) {
        await FlutterForegroundTask.requestIgnoreBatteryOptimization();
      }

      // if (!await FlutterForegroundTask.canScheduleExactAlarms) {
      //   await FlutterForegroundTask.openAlarmsAndRemindersSettings();
      // }
    }
  }
}
