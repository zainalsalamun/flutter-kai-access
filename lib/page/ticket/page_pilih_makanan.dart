import 'package:flutter/material.dart';

class PagePilihMakanan extends StatelessWidget {
  const PagePilihMakanan({super.key});

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: Text(
          'Pesan Tiket',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Icon(Icons.timer, color: Colors.black),
                SizedBox(width: 4),
                Text(
                  '00 : 06 : 29',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(Icons.check_circle, color: Colors.green),
                    SizedBox(width: 4),
                    Text('Kursi', style: TextStyle(fontSize: 16)),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.check_circle, color: Colors.green),
                    SizedBox(width: 4),
                    Text('Perlindungan Ekstra', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.fastfood, size: 100, color: Colors.grey),
                  SizedBox(height: 16.0),
                  Text(
                    'Langsung pesan makanan & minuman untuk dikonsumsi dalam kereta agar perjalanan kamu lebih nyaman.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              
              onPressed: () {},
              child: Text('PILIH MAKANAN & MINUMAN', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16),
                minimumSize: Size(double.infinity, 50),
              ),
            ),
            SizedBox(height: 8.0),
            OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/layanan-transportasi');
              },
              child: Text('LEWATI'),
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(vertical: 16),
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}