import 'package:flutter/material.dart';
import 'package:flutter_theme/services/foreground_task_service.dart';
import 'package:flutter_theme/services/notification_service.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await NotificationService.requestPermissions();
      await ForegroundTaskService.startService();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
