import 'dart:convert';
import 'package:facein/ClassesLibrary/Res.dart';
import 'package:facein/Listmodel.dart';
import 'package:facein/Page/Home.dart';
import 'package:facein/Page/splasg.dart';
import 'package:facein/widgets/CustomToast.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/Rounded_btn.dart';
import '../widgets/logobtn.dart';
import 'package:facein/Model/ModelUsers.dart';
import 'ForGotPage.dart';
import 'SignUpPage.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  static var mode;

  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<LoginPage> {
  List<ModelUsers> mode = [];
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  var TextEmail = TextEditingController();
  var TextPassword = TextEditingController();
  var HidePass = true;
  bool _obscureText = true;
  final Icon _visibilityIconOn = const Icon(
    Icons.visibility,
    color: Colors.black,
  );
  final Icon _visibilityIconOff = const Icon(
    Icons.visibility_off,
    color: Colors.black,
  );

  String? _Validatioemail(value) {
    if (value!.isEmpty) {
      return "Email Required";
    }
    RegExp emailRegExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!emailRegExp.hasMatch(value)) {
      return "Please Enter Valid Email";
    }
    return null;
  }

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
              child: Form(
                key: _globalKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Login',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 51,
                          fontFamily: 'RobotSlab',
                          color: Color(0xff3d1635)),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: _Validatioemail,
                      controller: TextEmail,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: 'Email Id',
                          labelStyle: const TextStyle(color: Colors.black),
                          prefixIcon:
                              const Icon(Icons.email, color: Colors.black),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(21.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(21.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(20),
                          )),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password Required";
                        } else {
                          return null;
                        }
                      },
                      controller: TextPassword,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: const TextStyle(color: Colors.black),
                          prefixIcon:
                              const Icon(Icons.lock, color: Colors.black),
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
                            borderSide:
                                const BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(21.0),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                      obscureText: _obscureText,
                      obscuringCharacter: '*',
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const ForgotPage(
                                      title: 'ForgotPage',
                                    )));
                          },
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationColor: Colors
                                    .black, // Optional: Set underline color
                                decorationThickness: 1,
                                fontFamily: 'RobotSlab',
                                fontWeight: FontWeight.w600
                                // Optional: Set underline thickness
                                ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      child: RoundButton(
                        btnName: 'LogIn',
                        callback: LogiFunc,
                        textStyle: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      // color: Colors.red,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 150,
                            height: 2,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xffd4fc79), Color(0xff96e6a1)],
                              ),
                              borderRadius: BorderRadius.circular(
                                  40.0), // Adjust the value to change the circle size
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  40.0), // Adjust the value to change the circle size
                              border: Border.all(
                                width: 1.0,
                                color: const Color(
                                    0xffd4fc79), // Adjust the color of the border as needed
                              ),
                            ),
                            child: const Text(
                              'OR',
                              style: TextStyle(
                                  fontSize: 10.0,
                                  fontFamily: 'RobotSlab',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff330867)),
                            ),
                          ),
                          Container(
                            width: 150,
                            height: 2,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xffd4fc79), Color(0xff96e6a1)],
                              ),
                              borderRadius: BorderRadius.circular(
                                  40.0), // Adjust the value to change the circle size
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          logobtn(
                            btnName: 'Facebook',
                            callback: faceBookFunc,
                            bgColor: const Color.fromRGBO(24, 119, 242, 1),
                            icon: const Icon(
                              Icons.facebook,
                              color: Colors.white,
                            ),
                            textStyle: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: googelFunc,
                              child: Container(
                                width: 160,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: const Color(0xffebefee),
                                  borderRadius: BorderRadius.circular(15.0),
                                  border: Border.all(
                                    width: 1.0,
                                    color: Colors
                                        .black, // Adjust the color of the border as needed
                                  ),
                                  // Adjust the value to change the circle size
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'lib/assets/images/gogle.png',
                                        width: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: RichText(
                                          text: const TextSpan(
                                            children: [
                                              TextSpan(
                                                text: 'G',
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors
                                                        .blue), // Color of 'G'
                                              ),
                                              TextSpan(
                                                text: 'o',
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors
                                                        .red), // Color of 'o'
                                              ),
                                              TextSpan(
                                                text: 'o',
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors
                                                        .yellow), // Color of 'o'
                                              ),
                                              TextSpan(
                                                  text: 'g',
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors
                                                          .blue) // Color of 'g'
                                                  ),
                                              TextSpan(
                                                text: 'l',
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors
                                                        .green), // Color of 'l'
                                              ),
                                              TextSpan(
                                                text: 'e',
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors
                                                        .red), // Color of 'e'
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
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
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                                    builder: (context) => const SignUpPage(
                                          title: 'SignUpPage',
                                        )));
                          },
                          child: const Text(
                            'SingnUp',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationColor: Colors
                                    .black, // Optional: Set underline color
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
      ),
    );
  }

  void faceBookFunc() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomeScreen()));
    CustomToast.showToast(message: "Details Found");
  }

  void googelFunc() {
    CustomToast.showToast(message: 'Gest Login');
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const Home(
              title: 'Homepage',
            )));
  }

// ignore: non_constant_identifier_names
  void LogiFunc() {
    if (_globalKey.currentState!.validate()) {
      login(TextEmail.text.toString(), TextPassword.text.toString());
    }
  }

  Future<void> login(String email, String password) async {
    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'api-key': 'ndeweidjwekdiwwednddw'
      };
      final Map<String, dynamic> data = {"email": email, "password": password};
      final http.Response response = await http.post(
        Uri.parse(Res().getString('login-user')),
        headers: headers,
        body: jsonEncode(data),
      );
      final Map<String, dynamic> responseData = json.decode(response.body);
      for (Map<String, dynamic> index in responseData['data']) {
        mode.add(ModelUsers.fromJson(index));
      }

      if (response.statusCode == 200) {
        if (password == mode[0].password) {
          if (password == mode[0].password && email == mode[0].email) {
            var sharedPref = await SharedPreferences.getInstance();
            sharedPref.setString(SplashScreenState.KEY_LOGIN, mode[0].userid);
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Home(title: 'Home')));
          }
        } else {
          CustomToast.showToast(message: 'Wrong Password');
        }
      } else {
        CustomToast.showToast(message: responseData['message']);
      }
    } catch (e) {
      CustomToast.showToast(message: "EMail not Register");
    }
  }
}
