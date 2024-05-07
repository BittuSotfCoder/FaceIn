import 'package:facein/widgets/widgetText.dart';
import 'package:flutter/material.dart' show BuildContext, CircleAvatar, Color, Colors, EdgeInsets, Icons, Material, StatelessWidget, Text, TextStyle, VoidCallback, Widget;
import 'package:flutter/widgets.dart';
class whatMind extends StatelessWidget{
  final String IdName;
  final String? IconImg;



  whatMind({super.key,
    required this.IdName,
    required this.IconImg,
  }
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Container(
        height: 55,
        color: Colors.cyan,
        width: double.infinity,
        child: Material(
            elevation: 4.0, // Add elevation if needed
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration:  BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(IconImg!),
                          fit: BoxFit.fill),
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    // width: 200,
                    height: 60,
                    decoration: BoxDecoration(
                      color: const Color(0xffebefee),
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                        width: 1.0,
                        color: Colors
                            .black, // Adjust the color of the border as needed
                      ),
                      // Adjust the value to change the circle size
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                        child:
                          Row(
                            children: [
                              widgetText(TxtName: 'Dear ',Txtfontweight:FontWeight.w500,Txtsize: 11,),
                              widgetText(TxtName: ' ${IdName}',Txtfontweight:FontWeight.w600,Txtsize: 11,TxtColor: Color.fromRGBO(24, 119, 242, 1),),
                              widgetText(TxtName: ', What\'s on your mind?',Txtfontweight:FontWeight.w500,Txtsize: 11,),

                            ],
                          )
                     ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right:20.0),
                  child: Icon(
                    Icons.image_rounded,
                    size: 35,
                    color: Colors.green,
                  ),
                ),
              ],
            )),
      ),
    );
  }





}