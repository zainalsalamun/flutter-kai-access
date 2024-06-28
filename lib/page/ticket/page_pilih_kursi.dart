import 'package:flutter/material.dart';

class PagePilihKursi extends StatelessWidget {
  const PagePilihKursi({super.key});
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: const Text(
          'Pilih Kursi',
          style: TextStyle(color: Colors.black),
        ),
        actions:const [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.person, color: Colors.black),
          ),
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('PASARSENEN - YOGYAKARTA'),
                    SizedBox(height: 4),
                    Text('SENJA UTAMA YK • Ekonomi (CA)'),
                    SizedBox(height: 4),
                    Text('Jum, 12 Jul 2024'),
                  ],
                ),
                Column(
                  children: [
                    Text('1 Dewasa'),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ChoiceChip(
                  label: const Text('Premium 1'),
                  selected: true,
                  selectedColor: Colors.lightBlue[50],
                  labelStyle: const TextStyle(color: Colors.blue),
                  onSelected: (selected) {},
                ),
                ChoiceChip(
                  label: const Text('Premium 2'),
                  selected: false,
                  selectedColor: Colors.lightBlue[50],
                  onSelected: (selected) {},
                ),
                ChoiceChip(
                  label:const  Text('Premium 3'),
                  selected: false,
                  selectedColor: Colors.lightBlue[50],
                  onSelected: (selected) {},
                ),
              ],
            ),
          ),
          Expanded(
            child: SeatSelectionGrid(),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/pesan-tiket-lanjutkan');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                minimumSize: const Size(double.infinity, 50), // Set width to full screen and height to 50
              ),
              child: const Text('SIMPAN', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}

class SeatSelectionGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              StatusIndicator(color: Colors.blue, label: 'Aktif'),
              StatusIndicator(color: Colors.grey, label: 'Terisi'),
              StatusIndicator(color: Colors.lightBlue, label: 'Dipilih'),
            ],
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              itemCount: 20,
              gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 1.5,
              ),
              itemBuilder: (context, index) {
                if (index == 0) {
                  return SeatItem(
                    label: 'Z',
                    color: Colors.blue,
                  );
                } else {
                  return SeatItem(
                    label: '',
                    color: index % 2 == 0 ? Colors.grey : Colors.white,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class StatusIndicator extends StatelessWidget {
  final Color color;
  final String label;

  StatusIndicator({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          color: color,
        ),
        SizedBox(width: 8),
        Text(label),
      ],
    );
  }
}

class SeatItem extends StatelessWidget {
  final String label;
  final Color color;

  SeatItem({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        child: Text(label),
      ),
    );
  }
}