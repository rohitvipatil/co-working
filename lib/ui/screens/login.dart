import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:coworking/ui/widgets/textfield.dart';
import 'package:coworking/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:coworking/services/login.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    late String mobNumOrEmail;
    late String password;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(24.0),
            margin: const EdgeInsets.only(left: 5.0, top: 13.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 44.0,
                  height: 44.0,
                  child: Image.asset(
                    'images/main.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Co-Working',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 90.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Mobile Number or Email',
                      textAlign: TextAlign.left,
                      style: kTextStyle,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    EmptyTextField(
                      onChanged: (value) {
                        mobNumOrEmail = value;
                      },
                    ),
                    SizedBox(
                      height: 24.0,
                    ),
                    Text(
                      'Password',
                      textAlign: TextAlign.left,
                      style: kTextStyle,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    EmptyTextField(
                      onChanged: (value) {
                        password = value;
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 350.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      height: 56.0,
                      child: ElevatedButton(
                        onPressed: () {
                          LoginAuth.loginUser(context, mobNumOrEmail, password);
                          Navigator.pushNamed(context, 'home');
                        },
                        child: Text(
                          'Log In',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 18.0),
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Color(0xFF4D60D1)),
                            elevation: MaterialStatePropertyAll(10.0)),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: 'New User? ',
                          style: kTextStyle,
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Create an Account',
                              style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(context, '/');
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
