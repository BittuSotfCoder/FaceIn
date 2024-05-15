import 'dart:convert';
import 'package:facein/ClassesLibrary/Res.dart';
import 'package:facein/Page/Home.dart';
import 'package:facein/widgets/CustomToast.dart';
import 'package:flutter/material.dart';
import '../widgets/Rounded_btn.dart';
import 'dart:math';
import 'LoginPage.dart';
import 'package:http/http.dart' as http;

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key, required this.title});

  final String title;

  @override
  State<SignUpPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SignUpPage> {
  var TextName = TextEditingController();
  var TextEmail = TextEditingController();
  var TextPasswordShow = TextEditingController();
  var TextPasswordHide = TextEditingController();
  var HidePass = true;
  bool _obscureText = true;
  final Icon _visibilityIconOn = const Icon(Icons.visibility);
  final Icon _visibilityIconOff = const Icon(Icons.visibility_off);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [Color(0xffa8edea), Color(0xfffed6e3)],
        )),
        child: Center(
          child: SizedBox(
            width: 350,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'SignUp',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 51,
                        fontFamily: 'RobotSlab',
                        color: Color(0xff3d1635)),
                  ),
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
                      prefixIcon:
                          const Icon(Icons.email_sharp, color: Colors.black),
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
                        icon: _obscureText
                            ? _visibilityIconOn
                            : _visibilityIconOff,
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
                    child: RoundButton(
                      btnName: 'SignUp',
                      callback: () {
                        if (TextName.text.isEmpty &&
                            TextEmail.text.isEmpty &&
                            TextPasswordHide.text.isEmpty &&
                            TextPasswordShow.text.isEmpty) {
                          CustomToast.showToast(
                              message:
                                  'Required \'Name,email,password,Re-Enter password\'');
                        } else if (TextName.text.isEmpty &&
                            TextEmail.text.isEmpty &&
                            TextPasswordHide.text.isEmpty) {
                          CustomToast.showToast(
                              message:
                                  'Required \'Name,email,Re-Enter password\'');
                        } else if (TextName.text.isEmpty &&
                            TextEmail.text.isEmpty &&
                            TextPasswordShow.text.isEmpty) {
                          CustomToast.showToast(
                              message: 'Required \'Name,email,password\'');
                        } else if (TextName.text.isEmpty &&
                            TextEmail.text.isEmpty) {
                          CustomToast.showToast(
                              message: 'Required \'Name,email\'');
                        } else if (TextName.text.isEmpty &&
                            TextPasswordHide.text.isEmpty &&
                            TextPasswordShow.text.isEmpty) {
                          print("name,hide,show");
                          CustomToast.showToast(
                              message:
                                  'Required \'Name,password,Re-Enter password\'');
                        } else if (TextName.text.isEmpty &&
                            TextPasswordHide.text.isEmpty) {
                          print("name,hide");
                          CustomToast.showToast(
                              message: 'Required \'Name,Re-Enter password\'');
                        } else if (TextName.text.isEmpty &&
                            TextPasswordShow.text.isEmpty) {
                          CustomToast.showToast(
                              message: 'Required \'Name,password\'');
                        } else if (TextName.text.isEmpty) {
                          CustomToast.showToast(message: 'Required \'Name\'');
                        } else if (TextEmail.text.isEmpty &&
                            TextPasswordHide.text.isEmpty &&
                            TextPasswordShow.text.isEmpty) {
                          CustomToast.showToast(
                              message:
                                  'Required \'email,password,Re-Enter password\'');
                        } else if (TextEmail.text.isEmpty &&
                            TextPasswordHide.text.isEmpty) {
                          CustomToast.showToast(
                              message: 'Required \'email,Re-Enter password\'');
                        } else if (TextEmail.text.isEmpty &&
                            TextPasswordShow.text.isEmpty) {
                          CustomToast.showToast(
                              message: 'Required \'email,password\'');
                        } else if (TextEmail.text.isEmpty) {
                          CustomToast.showToast(message: 'Required \'email\'');
                        } else if (TextPasswordHide.text.isEmpty &&
                            TextPasswordShow.text.isEmpty) {
                          ;
                          CustomToast.showToast(
                              message:
                                  'Required \'password,Re-Enter password\'');
                        } else if (TextPasswordHide.text.isEmpty) {
                          CustomToast.showToast(
                              message: 'Required \'Re-Enter password\'');
                        } else if (TextPasswordShow.text.isEmpty) {
                          CustomToast.showToast(
                              message: 'Required \'password\'');
                          print("show");
                        } else {
                          if (TextPasswordShow.text.toString() ==
                              TextPasswordHide.text.toString()) {
                            insertData();
                          } else {
                            CustomToast.showToast(
                                message: 'Password Not Match');
                          }
                        }
                      },
                      textStyle: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t Have An Account',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'RobotSlab'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                              builder: (context) => const LoginPage(
                                    title: 'LoginPages',
                                  )));
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor:
                                  Colors.black, // Optional: Set underline color
                              decorationThickness: 1,
                              fontFamily: 'RobotSlab',
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

  Future<void> insertData() async {
    final Map<String, dynamic> data = {
      // Your data to be inserted

      "faceid": generateUserId(10),
      "name": TextName.text.toString(),
      "email": TextEmail.text.toString(),
      "password": TextPasswordHide.text.toString()
    };

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'api-key': 'ndeweidjwekdiwwednddw'
    };

    try {
      var response = await http.post(
        Uri.parse(Res().getString('create-user')),
        headers: headers,
        body: jsonEncode(data),
      );
      final Map<String, dynamic> responseData = json.decode(response.body);
      if (response.statusCode == 200) {
        CustomToast.showToast(message: responseData['message']);
        if(responseData['status']){
           Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const Home(
                    title: 'Homepage',
                  )));
        TextName.clear();
        TextEmail.clear();
        TextPasswordHide.clear();
        TextPasswordShow.clear();
        }
      } else {
        CustomToast.showToast(
            message: responseData['message'] + "  " + response.statusCode);
        // ignore: avoid_print
        // print('Failed to insert data. Error: ${response.statusCode}');
      }
    } catch (e) {
      CustomToast.showToast(message: e.toString());
    }
  }

  String generateUserId(int length) {
    Random random = Random();
    String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    int timestampLength = timestamp.length;

    // Ensure that the generated ID is 10 digits long
    if (timestampLength >= length) {
      return timestamp.substring(timestampLength - length);
    } else {
      String randomDigits = '';
      for (int i = 0; i < length - timestampLength; i++) {
        randomDigits += random.nextInt(10).toString();
      }
      return timestamp + randomDigits;
    }
  }
}
