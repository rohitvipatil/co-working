import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:coworking/ui/widgets/textfield.dart';
import 'package:coworking/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:coworking/services/registration.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late String name;
  late String email;
  late String mobileNum;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(24.0),
            margin: const EdgeInsets.only(left: 3.0, top: 13.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Create an Account',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Text(
                      'Full Name',
                      textAlign: TextAlign.left,
                      style: kTextStyle,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    EmptyTextField(
                      onChanged: (value) {
                        name = value;
                      },
                    ),
                    SizedBox(
                      height: 24.0,
                    ),
                    Text(
                      'Mobile Number',
                      textAlign: TextAlign.left,
                      style: kTextStyle,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    EmptyTextField(
                      onChanged: (value) {
                        mobileNum = value;
                      },
                    ),
                    SizedBox(
                      height: 24.0,
                    ),
                    Text(
                      'Email ID',
                      textAlign: TextAlign.left,
                      style: kTextStyle,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    EmptyTextField(
                      onChanged: (value) {
                        email = value;
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 350.0,
                ),
                Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  height: 56.0,
                  child: ElevatedButton(
                    onPressed: () {
                      Registration.registerUser(context, email, name);
                      Navigator.pushNamed(context, 'home');
                    },
                    child: Text(
                      'Create an account',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18.0),
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.blue),
                        elevation: MaterialStatePropertyAll(10.0)),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'Existing User? ',
                      style: kTextStyle,
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Log In',
                          style: TextStyle(
                            color: Color(0xFF4D60D1),
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context, 'login');
                            },
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
