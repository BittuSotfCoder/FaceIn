import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final String avatarUrl;
  final String notificationText;
  final String timeAgo;

  NotificationCard({
    required this.avatarUrl,
    required this.notificationText,
    required this.timeAgo,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(avatarUrl),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: notificationText,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 5),
                Text(
                  timeAgo,
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}