import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Registration {
  String email;
  String name;

  Registration({required this.email, required this.name});

  static void registerUser(
      BuildContext context, String email, String name) async {
    String url =
        'https://demo0413095.mockable.io/digitalflake/api/create_account';
    try {
      var response =
          await http.post(Uri.parse(url), body: {'email': email, 'name': name});
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
