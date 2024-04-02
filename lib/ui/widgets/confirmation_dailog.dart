import 'package:flutter/material.dart';

class ConfirmationDailog {
  Future<void> _dailogBuilder(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text('Confirm Booking'),
              content: Column(
                children: [
                  Row(
                    children: [
                      Text('Desk Id:'),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text('Desk:')
                    ],
                  ),
                  Text('Slot:'),
                  SizedBox(
                    height: 10.0,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'history');
                      },
                      child: Text('Confirm'))
                ],
              ));
        });
  }
}
