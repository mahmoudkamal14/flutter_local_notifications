import 'package:flutter/material.dart';
import 'package:local_notifications/notifications/local_notification_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Flutter Local Notifications'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 30,
          children: [
            GestureDetector(
              onTap: () {
                // Call the method to show a basic notification
                LocalNotificationService.showNotification();
              },
              child: Text(
                'Basic Notifications',
                style: TextStyle(fontSize: 24),
              ),
            ),
            GestureDetector(
              onTap: () {
                // Call the method to show a repeated notification
                LocalNotificationService.showRepeatedNotification();
              },
              child: Text(
                'Repeated Notifications',
                style: TextStyle(fontSize: 24),
              ),
            ),
            Text('Schedule Notifications', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
