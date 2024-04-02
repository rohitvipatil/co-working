import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginAuth {
  String mobNumOrEmail;
  String password;

  LoginAuth({required this.mobNumOrEmail, required this.password});

  static void loginUser(
      BuildContext context, String mobNumOrEmail, String password) async {
    String url = 'https://demo0413095.mockable.io/digitalflake/api/login';
    try {
      var response = await http.post(Uri.parse(url),
          body: {'email': mobNumOrEmail, 'password': password});
      if (response.statusCode == 200) {
        Navigator.pushNamed(context, 'home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Registration failed'),
        ));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Network error'),
      ));
    }
  }
}
