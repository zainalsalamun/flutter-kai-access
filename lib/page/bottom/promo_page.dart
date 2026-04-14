import 'package:flutter/material.dart';
import '../../theme/theme.dart';

class PromoPage extends StatelessWidget {
  const PromoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Promo',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
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
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Lihat Semua',
                      style: TextStyle(color: primaryColor),
                    ),
                  ),
                ],
              ),
              _buildPromoCard(
                'assets/promo/hotel/hotelhorizon.png',
                'Rp 450.000',
                'Hotel Horison Kota Lama Semarang',
                'Diskon 25%',
              ),
              const SizedBox(height: 12),
              _buildPromoCard(
                'assets/promo/hotel/questhotel.png',
                '15% OFF',
                'Quest Hotel Semarang',
                'Exclusive',
              ),
              const SizedBox(height: 12),
              _buildPromoCard(
                'assets/promo/hotel/favehotelmadiun.png',
                '15% OFF',
                'Fave Hotel Madiun',
                'Best Seller',
              ),
              const SizedBox(height: 12),
              _buildPromoCard(
                'assets/promo/hotel/nexthotel.png',
                '20% OFF',
                'Next Hotel Yogyakarta',
                'Promo Minggu Ini',
              ),
              const SizedBox(height: 12),
              _buildPromoCard(
                'assets/promo/hotel/thesunanhotel.png',
                '18% OFF',
                'The Sunan Hotel Solo',
                'Harga Spesial',
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
          style: TextStyle(
            color: selected ? Colors.white : Colors.grey[700],
            fontWeight: FontWeight.w500,
          ),
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
            color: Colors.grey.withOpacity(0.2),
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
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
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
            color: Colors.grey.withOpacity(0.1),
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
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
