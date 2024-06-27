// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:myapp/page/bottom/home_page.dart';
import 'package:myapp/page/bottom/profile_page.dart';
import 'package:myapp/page/bottom/promo_page.dart';
import 'package:myapp/page/bottom/ticket_page.dart';
import 'package:myapp/page/bottom/train_page.dart';
import 'package:myapp/theme/theme.dart';

class BottomNavbar extends StatefulWidget {
  BottomNavbar({super.key});
  var currentIndex = 0;
  @override
  State<BottomNavbar> createState() => _BottomNavbar();
}

class _BottomNavbar extends State<BottomNavbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(     
      body: IndexedStack(
        index: widget.currentIndex,
        alignment: Alignment.topCenter,
        children: const [
          HomePage(),
          TrainPage(),
          TicketPage(),
          PromoPage(),
          ProfilePage(),
          ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.currentIndex,
        selectedItemColor: primaryColor,
        unselectedItemColor: secondaryColor,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            widget.currentIndex = index ;
          });
        },
        items: const <BottomNavigationBarItem>[ 
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.train),
            label: 'Kereta',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_travel),
            label: 'Tiket Saya',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.percent),
            label: 'Promo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Akun',
          ),
          
        ]
      )
    );
  }
}
