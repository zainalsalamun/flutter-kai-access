import 'package:flutter/material.dart';
import '../../theme/theme.dart';

class BusPage extends StatelessWidget {
  const BusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorWhite,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Bus',
          style: AppTextStyles.appBarTitle,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    busEksekutifColor,
                    busEksekutifColor.withOpacity(0.7)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.directions_bus,
                    color: colorWhite,
                    size: 48,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Pesan Bus',
                    style: AppTextStyles.h3White,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Layanan bus antar kota dan pariwisata',
                    style: AppTextStyles.bodyMediumWhite90,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Bus Types
            const Text(
              'Jenis Bus',
              style: AppTextStyles.h5,
            ),
            const SizedBox(height: 12),
            _buildBusType(
              'Bus Eksekutif',
              'Rp 200.000',
              'AC, kursi reclining, toilet',
              Icons.airline_seat_recline_extra,
              busEksekutifColor,
            ),
            const SizedBox(height: 12),
            _buildBusType(
              'Bus Bisnis',
              'Rp 150.000',
              'AC, kursi reclining',
              Icons.airline_seat_recline_normal,
              busBisnisColor,
            ),
            const SizedBox(height: 12),
            _buildBusType(
              'Bus Ekonomi',
              'Rp 100.000',
              'Kipas angin, kursi standar',
              Icons.airline_seat_legroom_extra,
              busEkonomiColor,
            ),
            const SizedBox(height: 24),

            // Route Input
            const Text(
              'Rute Perjalanan',
              style: AppTextStyles.h5,
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
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
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.circle, color: busEksekutifColor, size: 12),
                      const SizedBox(width: 12),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Kota keberangkatan',
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Colors.grey[400]),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: dangerColor, size: 12),
                      const SizedBox(width: 12),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Kota tujuan',
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Colors.grey[400]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Book Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: busEksekutifColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Cari Bus',
                  style: AppTextStyles.buttonLargeWhite,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBusType(
    String title,
    String price,
    String description,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
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
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.cardTitle,
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: AppTextStyles.cardSubtitle,
                ),
              ],
            ),
          ),
          Text(
            price,
            style: AppTextStyles.priceSmall,
          ),
        ],
      ),
    );
  }
}
