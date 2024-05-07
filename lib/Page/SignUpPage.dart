import 'package:flutter/material.dart';
import '../widgets/Rounded_btn.dart';
import 'LoginPage.dart';
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key, required this.title});

  final String title;

  @override
  State<SignUpPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SignUpPage> {
  var TextName=TextEditingController();
  var TextEmail=TextEditingController();
  var TextPasswordShow=TextEditingController();
  var TextPasswordHide=TextEditingController();
  var HidePass=true;
  bool _obscureText = true;
  final Icon _visibilityIconOn = const Icon(Icons.visibility);
  final Icon _visibilityIconOff = const Icon(Icons.visibility_off);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
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
                  const Text('SignUp',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 51,fontFamily: 'RobotSlab',color:Color(0xff3d1635)),),
                  const SizedBox(height: 20),
                  TextField(
                    controller: TextName,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: 'Full Name',
                      labelStyle: const TextStyle(color: Colors.black),
                      prefixIcon: const Icon(Icons.person, color: Colors.black),
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
                  TextField(
                    controller: TextPasswordShow,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: const TextStyle(color: Colors.black),
                      prefixIcon: const Icon(Icons.lock, color: Colors.black),
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
                  TextField(
                    controller: TextPasswordHide,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      labelText: 'Re-Enter Password',
                      labelStyle: const TextStyle(color: Colors.black),
                      prefixIcon: const Icon(Icons.lock, color: Colors.black),
                      suffixIcon: IconButton(
                        icon: _obscureText ? _visibilityIconOn : _visibilityIconOff,
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;

                          });
                        },
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.deepPurple),

                        borderRadius: BorderRadius.circular(21.0),
                      ),
                    ),
                    obscureText: _obscureText,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    child: RoundButton(btnName: 'SignUp',callback: (){
                      print('Addd');
                    // CollectionReference collref=FirebaseFirestore.instance.collection('Client');
                    // collref.add({
                    //   'name': TextName.text,
                    //   'email': TextEmail.text,
                    //   'password':TextPasswordShow,
                    //     });
                      print("add");
                    },textStyle: const TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.white), ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      const Text('Don\'t Have An Account',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300, fontFamily: 'RobotSlab'),),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const LoginPage(title: 'LoginPages',)));
                        },
                        child: const  Text('Login' ,
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.black, // Optional: Set underline color
                              decorationThickness: 1,
                              fontFamily: 'RobotSlab' ,
                              fontWeight: FontWeight.w600
                            // Optional: Set underline thickness
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),

    );
  }
}
