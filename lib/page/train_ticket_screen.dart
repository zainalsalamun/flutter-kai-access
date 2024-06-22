import 'package:flutter/material.dart';

class TrainTicketScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tiket Saya'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TicketCard(
              bookingCode: 'I2E7M8Z',
              trainName: 'SENJA UTAMA YK',
              className: 'EKONOMI (CB)',
              trainNumber: '140',
              departure: '19:05',
              departureStation: 'PASARSENEN (PSE)',
              departureDate: 'Jumat 28 Juni 2024',
              arrival: '02:35',
              arrivalStation: 'YOGYAKARTA (YK)',
              arrivalDate: 'Sabtu 29 Juni 2024',
            ),
            SizedBox(height: 16),
            TicketCard(
              bookingCode: 'O3H72FM',
              trainName: 'JAYAKARTA',
              className: 'EKONOMI (CA)',
              trainNumber: '217',
              departure: '19:03',
              departureStation: 'LEMPUYANGAN (LPN)',
              departureDate: 'Minggu 30 Juni 2024',
              arrival: '02:41',
              arrivalStation: 'PASARSENEN (PSE)',
              arrivalDate: 'Senin 01 Juli 2024',
            ),
          ],
        ),
      ),
    );
  }
}

class TicketCard extends StatelessWidget {
  final String bookingCode;
  final String trainName;
  final String className;
  final String trainNumber;
  final String departure;
  final String departureStation;
  final String departureDate;
  final String arrival;
  final String arrivalStation;
  final String arrivalDate;

  TicketCard({
    required this.bookingCode,
    required this.trainName,
    required this.className,
    required this.trainNumber,
    required this.departure,
    required this.departureStation,
    required this.departureDate,
    required this.arrival,
    required this.arrivalStation,
    required this.arrivalDate,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kode Pemesanan $bookingCode',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              trainName,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text('$className • No Kereta $trainNumber'),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('19:05'),
                    Text(departureStation),
                    Text(departureDate),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('02:35'),
                    Text(arrivalStation),
                    Text(arrivalDate),
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
