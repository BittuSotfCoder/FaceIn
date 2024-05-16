import 'package:flutter/material.dart';
import '../widgets/Rounded_btn.dart';

class ForgotPage extends StatefulWidget {
  const ForgotPage({super.key, required this.title});

  final String title;

  @override
  State<ForgotPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ForgotPage> {
  var TextEmail = TextEditingController();
  var HidePass = true;
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
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
                      'Forget Password',
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
                            const Icon(Icons.email_sharp, color: Colors.black),
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
                          borderRadius: BorderRadius.circular(21.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const SizedBox(height: 20),
                    SizedBox(
                      child: RoundButton(
                        btnName: 'Send link Email',
                        callback: ForgotButton,
                        textStyle: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void ForgotButton() {
    if (_globalKey.currentState!.validate()) {
      // ignore: avoid_print
      print('Send Message');
    }
  }
}
