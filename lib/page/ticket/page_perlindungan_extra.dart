import 'package:flutter/material.dart';

class PagePerlindunganExtra extends StatelessWidget {
  const PagePerlindunganExtra({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: const Text(
          'Pesan Tiket',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child:const Row(
              children: [
                Icon(Icons.timer, color: Colors.black),
                SizedBox(width: 4),
                Text(
                  '00 : 06 : 35',
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               const Text('Perlindungan Ekstra', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Switch(
                  value: false,
                  onChanged: (bool value) {},
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  ProtectionCard(
                    title: 'Perlindungan Kecelakaan Diri',
                    provider: 'PT Sompo Insuranc...',
                    description: 'Kompensasi kecelakaan perjalanan hingga Rp.10.000.000',
                    price: 'Rp4.500/Pax',
                    checked: true,
                  ),
                  ProtectionCard(
                    title: 'Jaminan Refund 100%',
                    provider: 'PT Mitra Jasa Prata...',
                    description: 'Kompensasi Pembatalan perjalanan 100%',
                    price: 'Rp12.400/Pax',
                    checked: true,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: const Column(
                children: [
                  Text('Total Harga', style: TextStyle(fontSize: 16)),
                  Text('Rp 310.000', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                Navigator.pushNamed(context, '/pilih-makanan');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:const EdgeInsets.symmetric(vertical: 16),
                ),
                
                  child:const Center(
                    child: Text(
                      'LANJUTKAN',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class ProtectionCard extends StatelessWidget {
  final String title;
  final String provider;
  final String description;
  final String price;
  final bool checked;

   ProtectionCard({
    required this.title,
    required this.provider,
    required this.description,
    required this.price,
    this.checked = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey.shade200,
                child: const Icon(Icons.shield, color: Colors.grey),
              ),
              title: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              subtitle: Text('powered by $provider'),
              trailing: Switch(
                value: checked,
                onChanged: (bool value) {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(description),
                  const SizedBox(height: 8.0),
                  const Text('Lihat semua benefit', style: TextStyle(color: Colors.blue)),
                  const SizedBox(height: 8.0),
                  Text('Harga mulai dari : $price'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}