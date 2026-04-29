import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/core/theme/app_theme.dart';

class PromoPage extends StatefulWidget {
  const PromoPage({super.key});

  @override
  State<PromoPage> createState() => _PromoPageState();
}

class _PromoPageState extends State<PromoPage> {
  late final Future<List<Map<String, dynamic>>> _promoHotelsFuture =
      _loadPromoHotels();

  Future<List<Map<String, dynamic>>> _loadPromoHotels() async {
    final jsonString =
        await rootBundle.loadString('assets/promo_hotel_data.json');
    final List<dynamic> jsonData = json.decode(jsonString);

    return jsonData
        .map(
          (item) => {
            'image_path': item['image_path'] as String,
            'price': item['price'] as String,
            'title': item['title'] as String,
            'badge': item['badge'] as String,
          },
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorWhite,
        elevation: 0,
        title: const Text(
          'Promo',
          style: AppTextStyles.appBarTitle,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Promo Category Chips
              SizedBox(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildCategoryChip('Semua', true),
                    const SizedBox(width: 8),
                    _buildCategoryChip('Wisata', false),
                    const SizedBox(width: 8),
                    _buildCategoryChip('Hotel', false),
                    const SizedBox(width: 8),
                    _buildCategoryChip('Transportasi', false),
                    const SizedBox(width: 8),
                    _buildCategoryChip('Makanan', false),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Featured Promo Section
              const Text(
                'Promo Spesial',
                style: AppTextStyles.h5,
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 180,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildFeaturedPromo(
                      'assets/promo/wisata/dusunsemilir.png',
                      'DUSUN SEMILIR',
                      'Diskon 30%',
                    ),
                    const SizedBox(width: 12),
                    _buildFeaturedPromo(
                      'assets/promo/wisata/ancol.png',
                      'ANCOL',
                      'Diskon 25%',
                    ),
                    const SizedBox(width: 12),
                    _buildFeaturedPromo(
                      'assets/promo/wisata/prambanan.png',
                      'PRAMBANAN',
                      'Diskon 20%',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Hotel Promo Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Promo Hotel',
                    style: AppTextStyles.h5,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Lihat Semua',
                      style: AppTextStyles.bodyMedium
                          .copyWith(color: primaryColor),
                    ),
                  ),
                ],
              ),
              FutureBuilder<List<Map<String, dynamic>>>(
                future: _promoHotelsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: Center(
                        child: CircularProgressIndicator(color: primaryColor),
                      ),
                    );
                  }

                  if (snapshot.hasError || !snapshot.hasData) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      child: Center(
                        child: Text(
                          'Promo hotel belum tersedia',
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: grey700,
                          ),
                        ),
                      ),
                    );
                  }

                  final promoHotels = snapshot.data!;

                  return Column(
                    children: promoHotels.asMap().entries.map((entry) {
                      final index = entry.key;
                      final promo = entry.value;

                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: index == promoHotels.length - 1 ? 0 : 12,
                        ),
                        child: _buildPromoCard(
                          promo['image_path'] as String,
                          promo['price'] as String,
                          promo['title'] as String,
                          promo['badge'] as String,
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String label, bool selected) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? primaryColor : Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: selected
              ? AppTextStyles.bodyMediumWhite
              : AppTextStyles.bodyMedium.copyWith(color: grey700),
        ),
      ),
    );
  }

  Widget _buildFeaturedPromo(String imagePath, String title, String discount) {
    return Container(
      width: 280,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                discount,
                style: AppTextStyles.badgeMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPromoCard(
      String imagePath, String price, String title, String badge) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.asset(
                  imagePath,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    badge,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  price,
                  style: AppTextStyles.price,
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: AppTextStyles.bodyMedium.copyWith(color: grey700),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
