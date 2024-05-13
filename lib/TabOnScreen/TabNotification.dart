import 'package:flutter/widgets.dart';

class TabNotification extends StatelessWidget{
  const TabNotification({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration:  const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffa8edea), Color(0xfffed6e3)],
          )),

    );
  }





}