// ignore_for_file: unused_shown_name
import 'package:flutter/material.dart' show Border, BorderRadius, BoxDecoration, BuildContext, Color, Colors, EdgeInsets, ElevatedButton, Icon, Icons, RoundedRectangleBorder, StatelessWidget, Text, TextStyle, VoidCallback, Widget;

class ElevButton extends StatelessWidget{
  final String btnName;
  final Color? bgColor;
  final TextStyle? textStyle;
  final VoidCallback? callback;

  const ElevButton({super.key, required this.btnName,
    this.bgColor,
    this.textStyle,
    this.callback,});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        callback!();
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: const Color(0xffa8edea), // Text color
        backgroundColor:bgColor ,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
      ), // Icon to display
     child: Text(btnName,), // Text to display
    );
  }


}