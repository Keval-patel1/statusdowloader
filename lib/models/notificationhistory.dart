import 'package:flutter/services.dart';

class NotificationHistory {
  static const MethodChannel _channel =
  const MethodChannel('notification_history');

  static Future<List<dynamic>> getNotificationHistory() async {
    try {
      return await _channel.invokeMethod('getNotificationHistory');
    } on PlatformException catch (e) {
      print("Error: ${e.message}");
      return [];
    }
  }
}
