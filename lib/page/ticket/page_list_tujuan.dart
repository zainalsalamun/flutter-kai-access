import 'package:flutter/material.dart';

class PageListTujuan extends StatelessWidget {
   PageListTujuan({super.key});


  final List<Map<String, String>> recentSearches = [
    {'name': 'WATES (WT)', 'location': 'KOTA YOGYAKARTA'},
    {'name': 'LEMPUYANGAN (LPN)', 'location': 'KOTA YOGYAKARTA'},
    {'name': 'PASAR SENEN (PSE)', 'location': 'JAKARTA PUSAT'},
    {'name': 'YOGYAKARTA (YK)', 'location': 'KOTA YOGYAKARTA'},
    {'name': 'KLATEN (KT)', 'location': 'KABUPATEN KLATEN'},
    {'name': 'GAMBIR (GMR)', 'location': 'JAKARTA'},
    {'name': 'BANDUNG (BD)', 'location': 'KOTA BANDUNG'},
    {'name': 'KOTA BANDUNG', 'location': 'SEMUA STASIUN DI KOTA BANDUNG'},
    {'name': 'KOTA SEMARANG', 'location': 'SEMUA STASIUN DI KOTA SEMARANG'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon:const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title:const  TextField(
          decoration: InputDecoration(
            hintText: 'Cari stasiun atau kota',
            border: InputBorder.none,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
           const Text(
              'Terakhir dicari',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ...recentSearches.map((station) {
              return Column(
                children: [
                  ListTile(
                    title: Text(
                      station['name']!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(station['location']!),
                    trailing: const Icon(Icons.star_border),
                    onTap: () {},
                  ),
                  const Divider(),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}

