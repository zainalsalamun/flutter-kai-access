import 'package:flutter/material.dart';

import '../theme/theme.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tiket Saya',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('Semua tiket kereta yang sudah aktif dan menunggu pembayaran'),
              SizedBox(height: 16),
              _buildServiceSection(),
              SizedBox(height: 16),
              _buildTicketTabSection(),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
               
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                ),
                child: Center(
                  child: Text(
                    'CEK & TAMBAH TIKET',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 16),
              _buildTicketCard(
                'I2E7M8Z',
                'SENJA UTAMA YK',
                'EKONOMI (CB)',
                'No Kereta 140',
                'PASARSENEN (PSE)',
                'Jumat 28 Juni 2024',
                'YOGYAKARTA (YK)',
                'Sabtu 29 Juni 2024',
                '19:05',
                '02:35',
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.train),
            label: 'Kereta',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.confirmation_number),
            label: 'Tiket Saya',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer),
            label: 'Promo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Akun',
          ),
        ],
      ),
    );
  }

  Widget _buildServiceSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Layanan Tambahan untuk perjalanan kamu',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
      ],
    );
  }

  Widget _buildTicketTabSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildTabItem('Semua', true),
        _buildTabItem('Antar Kota', false),
        _buildTabItem('Bandara', false),
        _buildTabItem('Lokal', false),
      ],
    );
  }

  Widget _buildTabItem(String title, bool isSelected) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isSelected ? Colors.blueAccent : Colors.white,
          border: Border.all(color: Colors.blueAccent),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.blueAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTicketCard(
    String kodePemesan,
    String namaKereta,
    String kelas,
    String noKereta,
    String stasiunAsal,
    String tanggalBerangkat,
    String stasiunTujuan,
    String tanggalSampai,
    String jamBerangkat,
    String jamSampai,
  ) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Kode Pemesanan $kodePemesan',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Antar Kota',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text(
                  namaKereta,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Spacer(),
                Image.asset(
                  'assets/logo_kai.png',
                  height: 24,
                ),
              ],
            ),
            SizedBox(height: 4),
            Text('$kelas • $noKereta'),
            Divider(height: 24),
            Row(
              children: [

                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Berangkat'),
                    Text(
                      '$stasiunAsal',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '$tanggalBerangkat, $jamBerangkat',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Tiba'),
                    Text(
                      '$stasiunTujuan',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '$tanggalSampai, $jamSampai',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}