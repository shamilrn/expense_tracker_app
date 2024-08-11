import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServices{
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  NotificationServices(this.flutterLocalNotificationsPlugin);

  Future<void> init() async{
   const AndroidInitializationSettings initializationSettingsAndroid =
   AndroidInitializationSettings('@mipmap/ic_launcher');

   const InitializationSettings initializationSettings =
   InitializationSettings(android: initializationSettingsAndroid);

   await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> showNotification({required String title, required String body}) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails('expense_channel', 'Expense Notifications',
        importance: Importance.max,
        priority: Priority.high,
        showWhen: false);

    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
      payload: 'Expense Notification',
    );
  }

}