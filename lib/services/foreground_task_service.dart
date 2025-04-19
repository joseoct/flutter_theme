import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:flutter_theme/main.dart' show startCallback;

class ForegroundTaskService {
  static void initService() {
    FlutterForegroundTask.init(
      androidNotificationOptions: AndroidNotificationOptions(
        channelId: 'foreground_service',
        channelName: 'Foreground Service',
        channelDescription: 'Running in background',
      ),
      iosNotificationOptions: const IOSNotificationOptions(
        showNotification: false,
      ),
      foregroundTaskOptions: ForegroundTaskOptions(
        eventAction: ForegroundTaskEventAction.repeat(5000),
        autoRunOnBoot: true,
        autoRunOnMyPackageReplaced: true,
        allowWakeLock: true,
        allowWifiLock: true,
      ),
    );
  }

  static Future<void> startService() async {
    await FlutterForegroundTask.startService(
      serviceId: 256,
      notificationTitle: 'Serviço em execução',
      notificationText: 'Monitorando notificações',
      callback: startCallback,
    );
  }
}
