import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(24.0),
          margin: const EdgeInsets.only(left: 3.0, top: 13.0),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 22.0,
                    width: 22.0,
                    child: Image.asset(
                      'images/main.png',
                      fit: BoxFit.cover,
                    ),
                    alignment: Alignment.topLeft,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    'Co-working',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    width: 80.0,
                  ),
                  Container(
                    height: 30.0,
                    decoration: BoxDecoration(
                        color: Color(0xFF4D60D1),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'history');
                        },
                        child: Text(
                          'Booking History',
                          style: TextStyle(color: Colors.white),
                        )),
                  )
                ],
              ),
              SizedBox(
                height: 100.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 147.0,
                    width: 147.0,
                    decoration: BoxDecoration(
                        color: Color(0xFF4D60D1),
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Image.asset('images/workstation.PNG',
                        fit: BoxFit.scaleDown),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xFF4D60D1),
                        borderRadius: BorderRadius.circular(15.0)),
                    height: 147.0,
                    width: 147.0,
                    child: Image.asset('images/meeting.PNG',
                        fit: BoxFit.scaleDown),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
