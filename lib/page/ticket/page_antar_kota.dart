import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AntarKotaPage extends StatefulWidget {
  const AntarKotaPage({super.key});

  @override
  _AntarKotaPageState createState() => _AntarKotaPageState();
}

class _AntarKotaPageState extends State<AntarKotaPage> {
  bool isRoundTrip = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Kereta Antar Kota',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon:const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildLocationCard(context),
              const SizedBox(height: 16),
              _buildDateCard(),
              const SizedBox(height: 16),
              _buildPassengerCard(),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding:const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/jadwal-kereta');
                  },
                  child: const Center(
                    child: Text(
                      'CARI TIKET ANTAR KOTA',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLocationCard(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/list-tujuan');
              },
              child: _buildLocationRow('Dari', FontAwesomeIcons.train, 'Dari'),
            ),
            const Divider(),
            GestureDetector(
              onTap: () {
               Navigator.pushNamed(context, '/list-tujuan');
              },
              child: _buildLocationRow('Ke', FontAwesomeIcons.train, 'Ke'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationRow(String title, IconData icon, String placeholder) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.blue),
            const SizedBox(width: 8),
            Text(title, style:const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        Text(placeholder, style: TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget _buildDateCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildDateRow('Tanggal Pergi', FontAwesomeIcons.calendarAlt, 'Rab, 26 Jun 2024', true),
            const Divider(),
            _buildDateRow('Tanggal Pulang', FontAwesomeIcons.calendarAlt, 'Rab, 26 Jun 2024', isRoundTrip),
          ],
        ),
      ),
    );
  }

  Widget _buildDateRow(String title, IconData icon, String date, bool showToggle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.blue),
            const SizedBox(width: 8),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        showToggle
            ? Row(
                children: [
                  Text(date),
                  Switch(
                    value: isRoundTrip,
                    onChanged: (bool value) {
                      setState(() {
                        isRoundTrip = value;
                      });
                    },
                  ),
                ],
              )
            : Text(
                date,
                style: TextStyle(color: isRoundTrip ? Colors.black : Colors.grey),
              ),
      ],
    );
  }

  Widget _buildPassengerCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(FontAwesomeIcons.user, color: Colors.blue),
                SizedBox(width: 8),
                Text('Penumpang', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            Text('1 Dewasa', style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
