import 'package:flutter/material.dart';
import '../../theme/theme.dart';

class PagePilihKursi extends StatelessWidget {
  const PagePilihKursi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Pilih Kursi',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.person, color: Colors.black),
          ),
        ],
      ),
      body: Column(
        children: [
          // Journey Info
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'PASARSENEN - YOGYAKARTA',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'SENJA UTAMA YK • Ekonomi (CA)',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Jum, 12 Jul 2024',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '1 Dewasa',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Premium Selection
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ChoiceChip(
                  label: const Text('Premium 1'),
                  selected: true,
                  selectedColor: primaryColor.withOpacity(0.2),
                  labelStyle: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                  onSelected: (selected) {},
                ),
                ChoiceChip(
                  label: const Text('Premium 2'),
                  selected: false,
                  selectedColor: primaryColor.withOpacity(0.2),
                  labelStyle: TextStyle(color: Colors.grey[700]),
                  onSelected: (selected) {},
                ),
                ChoiceChip(
                  label: const Text('Premium 3'),
                  selected: false,
                  selectedColor: primaryColor.withOpacity(0.2),
                  labelStyle: TextStyle(color: Colors.grey[700]),
                  onSelected: (selected) {},
                ),
              ],
            ),
          ),

          // Seat Selection
          Expanded(
            child: SeatSelectionGrid(),
          ),

          // Save Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/pesan-tiket-lanjutkan');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'SIMPAN',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SeatSelectionGrid extends StatelessWidget {
  const SeatSelectionGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Legend
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStatusIndicator(primaryColor, 'Aktif'),
              _buildStatusIndicator(Colors.grey, 'Terisi'),
              _buildStatusIndicator(Colors.blue.shade300, 'Dipilih'),
            ],
          ),
          const SizedBox(height: 16),

          // Seat Grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              itemCount: 20,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 1.5,
              ),
              itemBuilder: (context, index) {
                if (index == 0) {
                  return _buildSeatItem('Z', primaryColor);
                } else {
                  return _buildSeatItem(
                    '',
                    index % 2 == 0 ? Colors.grey.shade300 : Colors.white,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusIndicator(Color color, String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildSeatItem(String label, Color color) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: label.isNotEmpty ? Colors.white : Colors.grey,
          ),
        ),
      ),
    );
  }
}
