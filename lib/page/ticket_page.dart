import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../theme/theme.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({super.key});
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title:const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tiket Saya',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.receipt_long, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF6D6AFF), Color(0xFFB443F3)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Semua tiket kereta yang sudah aktif dan menunggu pembayaran',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildServiceIcon('RailFood', Icons.fastfood, Colors.pink),
                      _buildServiceIcon('Taksi', Icons.local_taxi, Colors.blue),
                      _buildServiceIcon('Bus', Icons.directions_bus, Colors.teal),
                      _buildServiceIcon('Hotel', Icons.hotel, Colors.purple),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Tiket & Layanan Saya'),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildCategoryChip('Semua', true),
                      _buildCategoryChip('Antar Kota', false),
                      _buildCategoryChip('Bandara', false),
                      _buildCategoryChip('Lokal', false),
                    ],
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'CEK & TAMBAH TIKET',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  _buildTicketCard ( 
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
          ],
        ),
      ),
     
    );
  }

  Widget _buildServiceIcon(String title, IconData icon, Color color) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: color,
          child: Icon(icon, color: Colors.white),
        ),
        SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildCategoryChip(String label, bool selected) {
    return ChoiceChip(
      label: Text(label),
      selected: selected,
      onSelected: (bool selected) {},
      selectedColor: Colors.blue.shade100,
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