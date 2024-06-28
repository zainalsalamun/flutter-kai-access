import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PageListJadwalKereta extends StatelessWidget {
  const PageListJadwalKereta({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Column(
            children: [
              Text(
                'PASAR SENEN (PSE) ➜ YOGYAKARTA (YK)',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              Text(
                'Rab, 26 Jun 2024 • 1 Dewasa',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pushNamed(context, '/antar-kota');
            },
          ),
          bottom: const TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.blue,
            tabs: [
              Tab(text: 'Rab, 26'),
              Tab(text: 'Kam, 27'),
              Tab(text: 'Jum, 28'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            TrainListView(),
             Center(child: Text('Kam, 27')),
             Center(child: Text('Jum, 28')),
          ],
        ),
      ),
    );
  }
}

class TrainListView extends StatelessWidget {
  const TrainListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        _buildTrainCard(
          context,
          trainName: 'SENJA UTAMA YK (140)',
          price: 'Rp 310.000',
          departureTime: '19:05',
          arrivalTime: '02:35',
          duration: '07j 30m',
          isAvailable: true,
          classes: [
            {'className': 'Ekonomi', 'price': 'Rp 310.000'},
            {'className': 'Bisnis', 'price': 'Rp 450.000'},
            {'className': 'Eksekutif', 'price': 'Rp 650.000'},
          ],
        ),
       const  SizedBox(height: 16),
        _buildTrainCard(
          context,
          trainName: 'SENJA UTAMA YK PRIORITY (140P)',
          price: 'Rp 650.000',
          departureTime: '19:05',
          arrivalTime: '02:35',
          duration: '07j 30m',
          isAvailable: true,
          classes: [
            {'className': 'Priority', 'price': 'Rp 650.000'},
          ],
        ),
        const SizedBox(height: 16),
        _buildTrainCard(
          context,
          trainName: 'BANGUNKARTA (124)',
          price: 'Habis',
          departureTime: '12:25',
          arrivalTime: '19:59',
          duration: '07j 34m',
          isAvailable: false,
        ),
        const SizedBox(height: 16),
        _buildTrainCard(
          context,
          trainName: 'BOGOWONTO (136)',
          price: 'Habis',
          departureTime: '14:10',
          arrivalTime: '21:44',
          duration: '07j 34m',
          isAvailable: false,
        ),
      ],
    );
  }

  Widget _buildTrainCard(
    BuildContext context, {
    required String trainName,
    required String price,
    required String departureTime,
    required String arrivalTime,
    required String duration,
    required bool isAvailable,
    List<Map<String, String>>? classes,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/pesan-tiket');
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ExpansionTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      trainName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isAvailable ? Colors.black : Colors.grey,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    price,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isAvailable ? Colors.black : Colors.red,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(FontAwesomeIcons.train, color: Colors.blue),
                  const  SizedBox(width: 8),
                  Text(
                    departureTime,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 8),
                  const Flexible(
                    child: Text(
                      'PASARSENEN (PSE)',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(FontAwesomeIcons.mapMarkerAlt, color: Colors.blue),
                  const SizedBox(width: 8),
                  Text(
                    arrivalTime,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 8),
                  const Flexible(
                    child: Text(
                      'YOGYAKARTA (YK)',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(FontAwesomeIcons.clock, color: Colors.blue),
                  const SizedBox(width: 8),
                  Text(duration),
                ],
              ),
            ],
          ),
          children: classes != null
              ? classes.map((classInfo) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(classInfo['className']!),
                        Text(classInfo['price']!),
                      ],
                    ),
                  );
                }).toList()
              : [],
        ),
      ),
    );
  }
}
