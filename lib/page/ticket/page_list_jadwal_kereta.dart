import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../theme/theme.dart';

class PageListJadwalKereta extends StatelessWidget {
  const PageListJadwalKereta({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Column(
            children: [
              Text(
                'PASAR SENEN (PSE) ➜ YOGYAKARTA (YK)',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                'Rab, 26 Jun 2024 • 1 Dewasa',
                style: TextStyle(color: Colors.grey, fontSize: 12),
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
          bottom: TabBar(
            labelColor: primaryColor,
            unselectedLabelColor: Colors.grey,
            indicatorColor: primaryColor,
            indicatorWeight: 3,
            tabs: const [
              Tab(text: 'Rab, 26'),
              Tab(text: 'Kam, 27'),
              Tab(text: 'Jum, 28'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            TrainListView(),
            const Center(child: Text('Kam, 27')),
            const Center(child: Text('Jum, 28')),
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
        const SizedBox(height: 12),
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
        const SizedBox(height: 12),
        _buildTrainCard(
          context,
          trainName: 'BANGUNKARTA (124)',
          price: 'Habis',
          departureTime: '12:25',
          arrivalTime: '19:59',
          duration: '07j 34m',
          isAvailable: false,
        ),
        const SizedBox(height: 12),
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
      onTap: isAvailable
          ? () {
              Navigator.pushNamed(context, '/pesan-tiket');
            }
          : null,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ExpansionTile(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
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
                        fontSize: 15,
                        color: isAvailable ? Colors.black : Colors.grey,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: isAvailable ? primaryColor : Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      price,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: isAvailable ? Colors.white : Colors.grey[600],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(FontAwesomeIcons.train, color: primaryColor, size: 16),
                  const SizedBox(width: 8),
                  Text(
                    departureTime,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'PASARSENEN (PSE)',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(FontAwesomeIcons.mapMarkerAlt,
                      color: Colors.orange, size: 16),
                  const SizedBox(width: 8),
                  Text(
                    arrivalTime,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'YOGYAKARTA (YK)',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(FontAwesomeIcons.clock,
                      color: Colors.grey[600], size: 16),
                  const SizedBox(width: 8),
                  Text(
                    duration,
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
          children: classes != null
              ? classes.map((classInfo) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 12.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      border: Border(
                        top: BorderSide(color: Colors.grey[200]!),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          classInfo['className']!,
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        Text(
                          classInfo['price']!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
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
