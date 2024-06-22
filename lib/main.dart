import 'package:flutter/material.dart';
import 'package:myapp/widget/bottom_navbar.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
// Suggested code may be subject to a license. Learn more: ~LicenseLog:563583596.
      debugShowCheckedModeBanner: false,
      title: 'Train Ticket App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BottomNavbar(),
    );
  }
}
