import 'package:flutter/services.dart';

class NotificationService {
  static const platform = MethodChannel('your.channel.name');

  static Future<void> startForegroundService() async {
    try {
      await platform.invokeMethod('startForegroundService');
    } on PlatformException catch (e) {
      print("Failed to start foreground service: '${e.message}'.");
    }
  }
}