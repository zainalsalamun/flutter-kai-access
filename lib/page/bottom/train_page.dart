import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../theme/theme.dart';

class TrainPage extends StatefulWidget {
  const TrainPage({super.key});

  @override
  State<TrainPage> createState() => _TrainPageState();
}

class _TrainPageState extends State<TrainPage> {
  List<dynamic> trainCategories = [];
  List<dynamic> destinations = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadTrainData();
  }

  Future<void> loadTrainData() async {
    try {
      final String jsonString =
          await rootBundle.loadString('assets/train_data.json');
      final jsonData = json.decode(jsonString);

      setState(() {
        trainCategories = jsonData['train_categories'];
        destinations = jsonData['destinations'];
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      debugPrint('Error loading train data: $e');
    }
  }

  Color _getColorFromHex(String hexColor) {
    hexColor = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hexColor', radix: 16));
  }

  IconData _getIconData(String iconName) {
    switch (iconName) {
      case 'train':
        return Icons.train;
      case 'airplanemode_active':
        return Icons.airplanemode_active;
      case 'bolt':
        return Icons.bolt;
      default:
        return Icons.train;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              const Text(
                'Kereta',
                style: AppTextStyles.h4,
              ),
              const SizedBox(height: 4),
              const Text(
                'Layanan Kereta KAI',
                style: AppTextStyles.bodyMedium,
              ),
              const SizedBox(height: 24),

              // Train Categories - Horizontal Layout
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: trainCategories.map((category) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: _buildTrainCategory(
                        category['title'],
                        _getIconData(category['icon']),
                        _getColorFromHex(category['color']),
                        () => _handleCategoryAction(category),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 32),

              const Text(
                'Tujuan Populer',
                style: AppTextStyles.h5,
              ),
              const SizedBox(height: 16),

              ...destinations.map((destination) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _buildDestinationCard(
                    destination['city'],
                    destination['image'],
                    () {},
                  ),
                );
              }),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  void _handleCategoryAction(Map<String, dynamic> category) {
    switch (category['action']) {
      case 'navigation':
        Navigator.pushNamed(context, category['route']);
        break;
      case 'snackbar':
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(category['message']),
          ),
        );
        break;
      case 'bottomsheet':
        _showWhooshBottomSheet(context);
        break;
    }
  }

  Widget _buildTrainCategory(
      String title, IconData icon, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: color.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Icon(
              icon,
              color: colorWhite,
              size: 30,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDestinationCard(
      String city, String imagePath, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 180,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.7),
              ],
            ),
          ),
          padding: const EdgeInsets.all(16),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              city,
              style: AppTextStyles.h4White,
            ),
          ),
        ),
      ),
    );
  }

  void _showWhooshBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: colorWhite,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: grey300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: whooshColor.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.bolt,
                    color: whooshColor,
                    size: 30,
                  ),
                ),
                const SizedBox(width: 16),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Kereta Bandara Whoosh',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Jakarta (Halim) - Bandung (Tegalluar)\nWaktu tempuh ± 40 menit',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      // TODO: Navigasi ke halaman pemesanan Whoosh
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                              'Halaman pemesanan Kereta Bandara Whoosh sedang dalam pengembangan'),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: whooshColor,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Pesan Sekarang',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      // TODO: Tampilkan jadwal Whoosh
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                              'Jadwal Kereta Bandara Whoosh sedang dalam pengembangan'),
                        ),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      side: const BorderSide(color: whooshColor),
                    ),
                    child: const Text(
                      'Lihat Jadwal',
                      style: TextStyle(
                        color: whooshColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Info row
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: whooshColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(Icons.info, color: whooshColor, size: 20),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text(
                      'Layanan kereta cepat penghubung bandara dan kota',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
