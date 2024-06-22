import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TrainPage extends StatelessWidget {
  const TrainPage({super.key});
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Kereta',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Layanan Kereta dari KAI',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildServiceIcon(
                    FontAwesomeIcons.train,
                    'Antar Kota',
                    Colors.blue,
                  ),
                  _buildServiceIcon(
                    FontAwesomeIcons.subway,
                    'Lokal',
                    Colors.orange,
                  ),
                  _buildServiceIcon(
                    FontAwesomeIcons.trainSubway,
                    'Commuter Line',
                    Colors.red,
                  ),
                  _buildServiceIcon(
                    FontAwesomeIcons.trainTram,
                    'LRT',
                    Colors.purple,
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'Tujuan Populer',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              _buildDestinationCard('Jakarta', 'assets/jakarta.jpg'),
              SizedBox(height: 8),
              _buildDestinationCard('Bandung', 'assets/bandung.jpg'),
              SizedBox(height: 8),
              _buildDestinationCard('Yogyakarta', 'assets/yogyakarta.jpg'),
            ],
          ),
        ),
      ),
      
    );
  }

  Widget _buildServiceIcon(IconData icon, String label, Color color) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: color.withOpacity(0.1),
          child: Icon(
            icon,
            color: color,
            size: 30,
          ),
        ),
        SizedBox(height: 8),
        Text(label),
      ],
    );
  }

  Widget _buildDestinationCard(String city, String imagePath) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Image.asset(
              imagePath,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: Text(
                city,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  backgroundColor: Colors.black38,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




