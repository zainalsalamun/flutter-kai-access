import 'package:flutter/material.dart';
import 'package:myapp/app/routes/app_routes.dart';
import 'package:myapp/core/widgets/bottom_navbar.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Train Ticket App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BottomNavbar(),
      routes: AppRoutes.routes,
    );
  }
}
