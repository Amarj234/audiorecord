import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'main.dart';

class Shownotify {
  static progressnotification(double persentege, String fileName) async {
    await Future<void>.delayed(const Duration(seconds: 1), () async {
      final AndroidNotificationDetails androidPlatformChannelSpecifics =
          AndroidNotificationDetails('progress channel', 'progress channel',
              //'progress channel description',
              channelShowBadge: false,
              importance: Importance.max,
              priority: Priority.high,
              onlyAlertOnce: true,
              showProgress: true,
              maxProgress: 100,
              progress: (persentege * 100).toInt());
      final NotificationDetails platformChannelSpecifics =
          NotificationDetails(android: androidPlatformChannelSpecifics);
      // await flutterLocalNotificationsPlugin.show(0, fileName,
      //     'Download ${(persentege * 100).toInt()} %', platformChannelSpecifics,
      //     payload: fileName);
    });
  }

  static finisnotification(String fileName) async {
    Future.delayed(Duration(seconds: 5));
    //   Records().Start();
    final AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'progress channel', 'progress channel',
      //'progress channel description',
      channelShowBadge: false,
      importance: Importance.max,
      priority: Priority.high,
    );
    final NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    // await flutterLocalNotificationsPlugin.show(
    //     0, fileName, 'Download Completed', platformChannelSpecifics,
    //     payload: fileName);
  }
}
