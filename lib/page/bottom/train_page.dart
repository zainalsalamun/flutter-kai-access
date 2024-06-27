import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../widget/destination.dart';

class TrainPage extends StatelessWidget {
  const TrainPage({super.key});
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
              'Kereta',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             const  Text(
                'Layanan Kereta dari KAI',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/antar-kota');
                    },
                    child: _buildServiceIcon(
                      FontAwesomeIcons.train,
                      'Antar Kota',
                      Colors.blue,
                    ),
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
              DestinationCard(city: 'Jakarta', imagePath: 'assets/kota/jakarta.png',),
              SizedBox(height: 8),
              DestinationCard(city: 'Bandung', imagePath: 'assets/kota/bandung.png',),
              SizedBox(height: 8),
              DestinationCard(city: 'Yogyakarta', imagePath: 'assets/kota/yogyakarta.png',),
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
}




