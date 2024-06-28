import 'package:flutter/material.dart';

class PageLayananTransportasi extends StatelessWidget {
  const PageLayananTransportasi({super.key});
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pesan Tiket'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ExtraProtectionWidget(),
                const SizedBox(height: 16),
                TicketInfoCard(),
                const SizedBox(height: 16),
                TransportationServiceWidget(),
                const SizedBox(height: 80), // Ensure there's space for the button
              ],
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: TotalPriceWidget(),
          ),
        ],
      ),
    );
  }
}

class ExtraProtectionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(Icons.check_circle, color: Colors.green),
        SizedBox(width: 8),
        Text('Perlindungan Ekxtra'),
        Spacer(),
        Icon(Icons.check_circle, color: Colors.green),
        SizedBox(width: 8),
        Text('RailFan'),
      ],
    );
  }
}

class TicketInfoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.train, color: Colors.orange, size: 40),
                SizedBox(width: 8),
                Text(
                  'KAI',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
             Row(
              children: [
               const Text('12 Juli 2024'),
                const Text(' - '),
                const Text('13 Juli 2024', style: TextStyle(color: Colors.orange)),
                const SizedBox(width: 4),
                Chip(
                  label:const Text('+1 hari'),
                  backgroundColor: Colors.orange.shade100,
                ),
              ],
            ),
           const SizedBox(height: 8),
            const Row(
              children: [
                Text('PASARSENEN'),
                Icon(Icons.arrow_forward, size: 16),
                Text('YOGYAKARTA'),
              ],
            ),
            const SizedBox(height: 8),
            const Text('1 Dewasa'),
          ],
        ),
      ),
    );
  }
}

class TransportationServiceWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Layanan Transportasi', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Pilih jenis layanan transportasi untuk perjalanan Anda'),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TransportationOption(icon: Icons.local_taxi, label: 'Taksi'),
                TransportationOption(icon: Icons.directions_bus, label: 'Bus'),
               
              ],
            ),
          ],
        ),
        
      ),

    );
  }
}

class TransportationOption extends StatelessWidget {
  final IconData icon;
  final String label;

  const TransportationOption({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.blue,
          child: Icon(icon, size: 30, color: Colors.white),
        ),
       const SizedBox(height: 8),
        Text(label),
               

      ],
    );
  }
}

class TotalPriceWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 1, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           const Column(
              
              children: [
                Text('Total Harga', style: TextStyle(fontSize: 18)),
                 Text(
              'Rp 310.000',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
              ],
            ),
            ElevatedButton(              
              onPressed: () {
                Navigator.pushNamed(context, '/bayar');
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: Colors.blue,
                padding:const EdgeInsets.symmetric(horizontal:  30, vertical: 12),
              ),
              child: const Text('LANJUTKAN', style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}