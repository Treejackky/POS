// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:food_cashier/views/dashboard.dart';
import 'package:food_cashier/views/login.dart';
import 'package:food_cashier/views/order.dart';
import 'package:food_cashier/views/test.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Kanit',
        primarySwatch: Colors.blue,
        // font size
        textTheme: TextTheme(
          bodyText2:
              TextStyle(fontSize: MediaQuery.of(context).size.height * 0.015),
        ),
      ),
      initialRoute: '/custom_container',
      routes: {
        '/': (context) => Login(),
        '/dashboard': (context) => Dashboard(),
        '/order': (context) => Order(),
        '/custom_container': (context) => CustomContainer(),
      },
    );
  }
}
