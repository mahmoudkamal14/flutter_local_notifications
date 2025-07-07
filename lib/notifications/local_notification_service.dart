import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  // Initialize the notification service
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static notificationTap(NotificationResponse notificationResponse) {}

  static Future<void> initialize() async {
    InitializationSettings initializationSettings =
        const InitializationSettings(
          android: AndroidInitializationSettings('@mipmap/ic_launcher'),
          iOS: DarwinInitializationSettings(),
        );

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: notificationTap,
      onDidReceiveBackgroundNotificationResponse: notificationTap,
    );
  }

  // Show a basic notification
  static Future<void> showNotification() async {
    NotificationDetails notificationDetails = const NotificationDetails(
      android: AndroidNotificationDetails(
        'channel_id',
        'channel_name',
        channelDescription: 'channel_description',
        importance: Importance.max,
        priority: Priority.high,
      ),
      iOS: DarwinNotificationDetails(),
    );

    await flutterLocalNotificationsPlugin.show(
      0,
      'Basic Notification',
      'This is a basic notification',
      notificationDetails,
    );
  }

  // Show a repeated notification
  static Future<void> showRepeatedNotification() async {
    NotificationDetails notificationDetails = const NotificationDetails(
      android: AndroidNotificationDetails(
        'repeated_channel_id',
        'repeated_channel_name',
        channelDescription: 'repeated_channel_description',
        importance: Importance.max,
        priority: Priority.high,
      ),
      iOS: DarwinNotificationDetails(),
    );

    await flutterLocalNotificationsPlugin.periodicallyShow(
      1,
      'Repeated Notification',
      'This notification repeats every minute',
      RepeatInterval.everyMinute,
      notificationDetails,
      androidScheduleMode: AndroidScheduleMode.alarmClock,
    );
  }
}


  // 1. Setup the notification service [Done]
  // 2. Show basic notification [Done]
  // 3. Show repeated notification [Done]
  // 4. Schedule a notification
  // 5. Handle notification tap
  // 6. Handle background notification tap
