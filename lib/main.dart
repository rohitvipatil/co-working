import 'package:coworking/ui/screens/available_desk.dart';
import 'package:coworking/ui/screens/booking_history.dart';
import 'package:coworking/ui/screens/date_slot.dart';
import 'package:coworking/ui/screens/home.dart';
import 'package:coworking/ui/screens/login.dart';
import 'package:coworking/ui/screens/register.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Register(),
        'login': (context) => const Login(),
        'dateSlot': (context) => const DateSlot(),
        'home': (context) => const HomeScreen(),
        'availableDesk': (context) => const AvailableDesk(),
        'history': (context) => const BookingHistory()
      },
    );
  }
}
