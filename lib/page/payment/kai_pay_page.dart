import 'package:flutter/material.dart';
import '../../theme/theme.dart';

class KaiPayPage extends StatelessWidget {
  const KaiPayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'KAI Pay',
          style: AppTextStyles.appBarTitle,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Profile Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [primaryColor, const Color(0xFF9C27B0)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: primaryColor.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.orange,
                    child: const Text(
                      'Z',
                      style: AppTextStyles.h3White,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'ZAINAL',
                    style: AppTextStyles.h4White,
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.verified_user,
                          color: Colors.white,
                          size: 14,
                        ),
                        SizedBox(width: 4),
                        Text(
                          'Premium Member',
                          style: AppTextStyles.badgeMedium,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Co-Branding dengan KAI Travel',
                    style: AppTextStyles.bodySmallWhite70,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // History Header
            Row(
              children: [
                const Text(
                  'Riwayat KAI Pay',
                  style: AppTextStyles.h5,
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Category Chips
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildCategoryChip('Semua', true),
                const SizedBox(width: 8),
                _buildCategoryChip('Top Up', false),
                const SizedBox(width: 8),
                _buildCategoryChip('Pembayaran', false),
              ],
            ),
            const SizedBox(height: 32),

            // Empty State
            Container(
              padding: const EdgeInsets.all(32),
              child: Column(
                children: [
                  Icon(
                    Icons.menu_book_sharp,
                    color: primaryColor.withOpacity(0.3),
                    size: 100,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Belum Ada Transaksi Hari Ini',
                    style: AppTextStyles.h6,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Setelah melakukan transaksi menggunakan KAI Pay, kamu bisa melihat riwayat transaksimu di sini',
                    style: AppTextStyles.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String label, bool selected) {
    return Container(
      decoration: BoxDecoration(
        color: selected ? primaryColor : Colors.grey[100],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: selected ? AppTextStyles.button : AppTextStyles.labelMedium,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    );
  }
}
