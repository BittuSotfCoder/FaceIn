import 'package:flutter/material.dart';
class logobtn extends StatelessWidget{
  final String btnName;
  final Icon? icon;
  final Color? bgColor;
  final TextStyle? textStyle;
  final VoidCallback? callback;

  const logobtn({super.key, required this.btnName,
    this.bgColor=Colors.deepPurple,
    this.textStyle,
    this.callback, this.icon,});









@override
Widget build(BuildContext context) {
    return
      Container(

        width: 160,
        height: 40,
        decoration: BoxDecoration(
          color: bgColor,
          // color: Color(0xffa8edea),
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
            width: 1.0,
            color: Colors.black, // Adjust the color of the border as needed
          ),
          // Adjust the value to change the circle size

        ),
        child: ElevatedButton(onPressed: (){
             callback!();
            },
            style: ElevatedButton.styleFrom(

          backgroundColor: bgColor,
        shadowColor: bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),

        )
            ),
            child:icon!=null ? Row(
        children: [
          icon!,
          Padding(
            padding: const EdgeInsets.only(left:8),
            child: Text(btnName,style: textStyle,),
          ),

        ],
            ) : Text(btnName,style: textStyle,),
            ),
      );
}

}