import 'package:flutter/material.dart';
import '../../theme/theme.dart';

class TaksiPage extends StatelessWidget {
  const TaksiPage({super.key});

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
          'Taksi',
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
                  colors: [taksiColor, taksiColor.withOpacity(0.7)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.local_taxi,
                    color: colorWhite,
                    size: 48,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Pesan Taksi',
                    style: AppTextStyles.h3White,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Layanan taksi untuk perjalanan dari/ke stasiun',
                    style: AppTextStyles.bodyMediumWhite90,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Ride Options
            const Text(
              'Pilih Layanan',
              style: AppTextStyles.h5,
            ),
            const SizedBox(height: 12),
            _buildRideOption(
              'Taksi Reguler',
              'Rp 15.000/km',
              'Kendaraan standar',
              Icons.local_taxi,
              taksiColor,
            ),
            const SizedBox(height: 12),
            _buildRideOption(
              'Taksi Premium',
              'Rp 25.000/km',
              'Kendaraan mewah',
              Icons.directions_car,
              taksiPremiumColor,
            ),
            const SizedBox(height: 12),
            _buildRideOption(
              'GrabCar',
              'Rp 12.000/km',
              'Mobil pribadi',
              Icons.car_rental,
              grabCarColor,
            ),
            const SizedBox(height: 24),

            // Location Input
            const Text(
              'Lokasi Penjemputan',
              style: AppTextStyles.h5,
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: colorWhite,
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
                      Icon(Icons.circle, color: taksiColor, size: 12),
                      const SizedBox(width: 12),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Lokasi menjemput',
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
                            hintText: 'Lokasi tujuan',
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
                  backgroundColor: taksiColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Pesan Sekarang',
                  style: AppTextStyles.buttonLargeWhite,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRideOption(
    String title,
    String price,
    String description,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorWhite,
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
