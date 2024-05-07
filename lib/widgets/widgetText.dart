import 'dart:ui';
import 'package:flutter/material.dart' show BuildContext, Color, StatelessWidget, Text, TextStyle, VoidCallback, Widget;
class widgetText extends StatelessWidget{
  final String TxtName;
  final double? Txtsize;
  final Color? TxtColor;
  final String? TxtFamily;
  final VoidCallback? Txtcallback;
  final FontWeight? Txtfontweight;
  final FontStyle? TxtfontStyle;
  const widgetText(
      {super.key,
        required this.TxtName,
         this.Txtsize,
        this.TxtColor,
        this.TxtFamily='RobotSlab',
        this.Txtcallback,
        this.Txtfontweight,
        this.TxtfontStyle,});

  @override
  Widget build(BuildContext context) {
    return  Text(TxtName,
      style:
      TextStyle(fontFamily: TxtFamily,fontSize: Txtsize,fontWeight:Txtfontweight,fontStyle:TxtfontStyle ,color: TxtColor),
    );
  }





}