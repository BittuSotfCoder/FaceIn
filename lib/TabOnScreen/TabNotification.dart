import 'package:facein/widgets/NotificationCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TabNotification extends StatelessWidget {
  TabNotification({super.key});
  var arrName = [
    'Rajababu',
    'Raman Sah',
    'Bittu Kumar',
    'ramesh',
    'suresh',
    'byte',
    'Pintu',
    'Saho',
    'Piyush',
    'Swati Singh',
  ];
  var PostImg = [
    'lib/assets/images/asus.jpg',
    'lib/assets/images/bittuScotter.jpg',
    'lib/assets/images/gogle.png',
    'lib/assets/images/th2.jpeg',
    'lib/assets/images/bittu.jpg',
    'lib/assets/images/bittuScotter.jpg',
    'lib/assets/images/gogle.png',
    'lib/assets/images/sc.jpg',
    'lib/assets/images/th.jpeg',
    'lib/assets/images/th1.jpeg',
    'lib/assets/images/th2.jpeg',
    'lib/assets/images/bittu.jpg',
    'lib/assets/images/sc.jpg',
    'lib/assets/images/th.jpeg',
    'lib/assets/images/th1.jpeg',
    'lib/assets/images/bittuScotter.jpg',
    'lib/assets/images/th3.jpeg',
    'lib/assets/images/th5.jpeg'
  ];
  var IconImg = [
    'lib/assets/images/bittu.jpg',
    'lib/assets/images/bittuScotter.jpg',
    'lib/assets/images/gogle.png',
    'lib/assets/images/sc.jpg',
    'lib/assets/images/th.jpeg',
    'lib/assets/images/th1.jpeg',
    'lib/assets/images/th2.jpeg',
    'lib/assets/images/bittu.jpg',
    'lib/assets/images/bittuScotter.jpg',
    'lib/assets/images/bittuScotter.jpg',
    'lib/assets/images/th3.jpeg',
    'lib/assets/images/th5.jpeg',
    'lib/assets/images/asus.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [Color(0xffa8edea), Color(0xfffed6e3)],
      )),
      child: Material(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Friends',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        // Add your search functionality here
                      },
                    ),
                  ],
                ),
              ),
              Divider(),
              ...List.generate(
                  arrName.length,
                  (index) => NotificationCard(
                        avatarUrl:
                            'https://icon-library.com/images/url-icon-png/url-icon-png-13.jpg',
                        notificationText: '${arrName[index]} sent you a friend request.',
                        timeAgo: '2 hour ago',
                      )
                      ),
            ],
          ),
        ),
      ),
    );
  }
}
