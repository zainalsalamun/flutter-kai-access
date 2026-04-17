import 'package:flutter/material.dart';
import '../../theme/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selamat Siang',
              style: AppTextStyles.bodyMediumWhite70,
            ),
            Text(
              'ZAINAL',
              style: AppTextStyles.h5White,
            ),
            const SizedBox(height: 8)
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: colorWhite),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Action Row
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/kai-pay');
                  },
                  child: Image.asset(
                    'assets/kai_pay.png',
                    height: 35,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.qr_code_scanner, color: primaryColor),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.account_balance_wallet,
                      color: primaryColor),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.history, color: primaryColor),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 16),

            // RailPoin & Premium Row
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [primaryColor, primaryColor.withOpacity(0.7)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '0 RailPoin',
                              style: AppTextStyles.h6White,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Tukarkan poin',
                              style: AppTextStyles.bodySmallWhite70,
                            ),
                          ],
                        ),
                        const Icon(Icons.star, color: Colors.amber, size: 28),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: cardBackground,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.amber, width: 1.5),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Premium',
                              style: AppTextStyles.premiumMember,
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Member Gold',
                              style: AppTextStyles.caption,
                            ),
                          ],
                        ),
                        Icon(Icons.verified_user,
                            color: Colors.amber, size: 28),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Services Horizontal Scroll
            const Text(
              'Layanan',
              style: AppTextStyles.h6,
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildServiceIcon(
                    context,
                    Icons.train,
                    'Antar Kota',
                    antarKotaColor,
                    onTap: () {
                      Navigator.pushNamed(context, '/antar-kota');
                    },
                  ),
                  const SizedBox(width: 16),
                  _buildServiceIcon(
                    context,
                    Icons.train_outlined,
                    'Lokal',
                    lokalColor,
                  ),
                  const SizedBox(width: 16),
                  _buildServiceIcon(
                    context,
                    Icons.directions_railway,
                    'Commuter',
                    commuterColor,
                  ),
                  const SizedBox(width: 16),
                  _buildServiceIcon(
                    context,
                    Icons.tram,
                    'LRT',
                    lrtColor,
                  ),
                  const SizedBox(width: 16),
                  _buildServiceIcon(
                    context,
                    Icons.airport_shuttle,
                    'Bandara',
                    bandaraColor,
                  ),
                  const SizedBox(width: 16),
                  _buildServiceIcon(
                    context,
                    Icons.train,
                    'Whoosh',
                    whooshColor,
                    onTap: () {
                      // Navigasi ke layanan Whoosh
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (context) => Container(
                          padding: const EdgeInsets.all(20),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(20)),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 40,
                                height: 4,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: whooshColor.withOpacity(0.1),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.train,
                                      color: whooshColor,
                                      size: 24,
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  const Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Kereta Bandara Whoosh',
                                          style: AppTextStyles.h5,
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          'Layanan kereta bandara cepat Jakarta-Bandung',
                                          style: AppTextStyles.bodyMedium,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    // TODO: Navigasi ke halaman Whoosh
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'Halaman Kereta Bandara Whoosh sedang dalam pengembangan'),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: whooshColor,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 14),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: const Text(
                                    'Pesan Tiket Whoosh',
                                    style: AppTextStyles.button,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 12),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 16),
                  _buildServiceIcon(
                    context,
                    Icons.hotel,
                    'Hotel',
                    hotelColor,
                  ),
                  const SizedBox(width: 16),
                  _buildServiceIcon(
                    context,
                    Icons.local_shipping,
                    'KAI Logistik',
                    kaiLogistikColor,
                  ),
                  const SizedBox(width: 16),
                  _buildServiceIcon(
                    context,
                    Icons.phone_android,
                    'Pulsa',
                    pulsaColor,
                  ),
                  const SizedBox(width: 16),
                  _buildServiceIcon(
                    context,
                    Icons.videogame_asset,
                    'Games',
                    gamesColor,
                  ),
                  const SizedBox(width: 16),
                  _buildServiceIcon(
                    context,
                    Icons.bolt,
                    'PLN',
                    plnColor,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Trip Planner Card
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [primaryColor, promoGradientStart],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: primaryColor.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Image.asset(
                    'assets/logo_kai.png',
                    height: 70,
                    width: 100,
                    fit: BoxFit.fill,
                  ),
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Trip Planner',
                        style: AppTextStyles.h5White,
                      ),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'Coba Sekarang',
                          style: AppTextStyles.bodySmallWhite,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Promo Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Promo',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: textPrimary),
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
            const SizedBox(height: 8),
            SizedBox(
              height: 160,
              child: ListView.builder(
                padding: const EdgeInsets.only(right: 8),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    width: 260,
                    margin: const EdgeInsets.only(right: 12),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Stack(
                        children: [
                          // Gambar placeholder dari picsum
                          Image.network(
                            'https://picsum.photos/260/160?random=$index',
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Container(
                                color: Colors.grey[200],
                                child: Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                                  ),
                                ),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) =>
                                Container(
                              color: Colors.grey[300],
                              child: const Center(
                                  child: Text('Gambar tidak tersedia')),
                            ),
                          ),
                          // Overlay gradient untuk memastikan teks terbaca
                          Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [promoOverlay, Colors.transparent],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Promo Spesial',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Diskon up to 50%',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white70),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 8,
                            right: 8,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: warningColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Text(
                                'HOT',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),

            // Tujuan Populer Section
            const Row(
              children: [
                Text(
                  'Tujuan Populer',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: textPrimary),
                ),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildDestinationCard('Yogyakarta', 'Mulai Rp 150rb',
                      'https://images.unsplash.com/photo-1582510003544-4d00b7f74220?w=320&h=200&fit=crop'),
                  const SizedBox(width: 12),
                  _buildDestinationCard('Bandung', 'Mulai Rp 120rb',
                      'https://images.unsplash.com/photo-1596402184320-417e7178b2cd?w=320&h=200&fit=crop'),
                  const SizedBox(width: 12),
                  _buildDestinationCard('Semarang', 'Mulai Rp 130rb',
                      'https://images.unsplash.com/photo-1585543805890-6051f7829f98?w=320&h=200&fit=crop'),
                  const SizedBox(width: 12),
                  _buildDestinationCard('Surabaya', 'Mulai Rp 180rb',
                      'https://images.unsplash.com/photo-1555899434-94d1368aa7af?w=320&h=200&fit=crop'),
                  const SizedBox(width: 12),
                  _buildDestinationCard('Jakarta', 'Mulai Rp 100rb',
                      'https://images.unsplash.com/photo-1555899434-94d1368aa7af?w=320&h=200&fit=crop'),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // RailPoin Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Tukarkan RailPoin',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: textPrimary),
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
            const SizedBox(height: 12),
            SizedBox(
              height: 140,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildVoucherCard('https://picsum.photos/160/140?random=10',
                      'Voucher Hotel', '500 Poin'),
                  const SizedBox(width: 12),
                  _buildVoucherCard('https://picsum.photos/160/140?random=11',
                      'Voucher Makan', '300 Poin'),
                  const SizedBox(width: 12),
                  _buildVoucherCard('https://picsum.photos/160/140?random=12',
                      'Voucher Tiket', '1000 Poin'),
                  const SizedBox(width: 12),
                  _buildVoucherCard('https://picsum.photos/160/140?random=13',
                      'Voucher Belanja', '750 Poin'),
                  const SizedBox(width: 12),
                  _buildVoucherCard('https://picsum.photos/160/140?random=14',
                      'Voucher Ojek', '200 Poin'),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceIcon(
      BuildContext context, IconData icon, String label, Color color,
      {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white, size: 24),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: textSecondary),
          ),
        ],
      ),
    );
  }

  Widget _buildDestinationCard(String city, String price, String imageUrl) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        color: cardBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                imageUrl,
                width: double.infinity,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    color: Colors.grey[200],
                    child: Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey[300],
                  child: const Center(child: Text('Gambar tidak tersedia')),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  city,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: textPrimary,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  price,
                  style: TextStyle(fontSize: 12, color: textSecondary),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVoucherCard(String imageUrl, String title, String points) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: cardBorder),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                imageUrl,
                width: double.infinity,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    color: Colors.grey[200],
                    child: Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey[300],
                  child: const Center(child: Text('Gambar tidak tersedia')),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: textPrimary,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  points,
                  style: TextStyle(fontSize: 12, color: textSecondary),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
