import 'package:flutter/material.dart';
import '../../theme/theme.dart';

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
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Cari stasiun atau kota',
              prefixIcon: Icon(Icons.search, color: Colors.grey[400]),
              filled: true,
              fillColor: Colors.grey[100],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Terakhir Dicari',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          ...recentSearches.map((station) {
            return Container(
              margin: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ListTile(
                leading: Icon(
                  Icons.train,
                  color: primaryColor,
                ),
                title: Text(
                  station['name']!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                subtitle: Text(
                  station['location']!,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
                trailing: Icon(
                  Icons.star_border,
                  color: Colors.amber,
                ),
                onTap: () {},
              ),
            );
          }),
        ],
      ),
    );
  }
}
