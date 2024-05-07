import 'package:flutter/material.dart';
import '../widgets/Rounded_btn.dart';
class ForgotPage extends StatefulWidget {
  const ForgotPage({super.key, required this.title});

  final String title;

  @override
  State<ForgotPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ForgotPage> {
  var TextEmail=TextEditingController();
  var HidePass=true;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffebefee),
        title: const Text(
          'ForgotPassword',
          style: TextStyle(
              fontSize: 35,
              fontFamily: 'Head2',
              color: Color.fromRGBO(24, 119, 242, 1)),
        ),
      ),
      body:  Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors:[
                Color(0xffa8edea),
                Color(0xfffed6e3)
              ],
            )
        ),

        child: Center(
          child: SizedBox(
            width: 350,
            child: SingleChildScrollView(
              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Forget Password',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 51,fontFamily: 'RobotSlab',color:Color(0xff3d1635)),),
                  const SizedBox(height: 20),
                  TextField(
                    controller: TextEmail,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email Id',
                      labelStyle: const TextStyle(color: Colors.black),
                      prefixIcon: const Icon(Icons.email_sharp, color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(21.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(height: 20),
                  SizedBox(
                    child: RoundButton(btnName: 'Send link Email',callback: (){
                      // print('hello');
                    },textStyle: const TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.white), ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

    );
  }
}
