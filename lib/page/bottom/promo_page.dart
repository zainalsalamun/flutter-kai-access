import 'package:flutter/material.dart';

class PromoPage extends StatelessWidget {
  const PromoPage({super.key});

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Promo',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Berbagai macam promo di Access',
                style: TextStyle(color: Colors.grey),
              ),
             const  SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildPromoThumbnail('assets/promo/wisata/dusunsemilir.png', 'DUSUN SEMILIR'),
                    const SizedBox(width: 8),
                    _buildPromoThumbnail('assets/promo/wisata/dagadujogja.png', 'DAGADU DJOKDJA'),
                    const SizedBox(width: 8),
                    _buildPromoThumbnail('assets/promo/wisata/kidsfun.png', 'KID FUN YOGYAKARTA'),
                    const SizedBox(width: 8),
                    _buildPromoThumbnail('assets/promo/wisata/ancol.png', 'ANCOL'),
                    const SizedBox(width: 8),
                    _buildPromoThumbnail('assets/promo/wisata/prambanan.png', 'PRAMBANAN'),
                    const SizedBox(width: 8),
                    _buildPromoThumbnail('assets/promo/wisata/seaworld.png', 'SWA WORLD'),
                    const SizedBox(width: 8),
                    _buildPromoThumbnail('assets/promo/wisata/jakfair.jpeg', 'JAKARTA FAIR'),
                    const SizedBox(width: 8),

                  ],
                ),
              ),
             const SizedBox(height: 16),
              _buildPromoCard(
                'assets/promo/hotel/hotelhorizon.png',
                'Rp 450.000',
                'HOTEL HORISON KOTA LAMA SEMARANG',
              ),
              const SizedBox(height: 8),
              _buildPromoCard(
                'assets/promo/hotel/questhotel.png',
                '15%',
                'QUEST HOTEL SEMARANG',
              ),
              const SizedBox(height: 8),
              _buildPromoCard(
                'assets/promo/hotel/favehotelmadiun.png',
                '15%',
                'Fave Hotel Madiun',
              ),
              const SizedBox(height: 8),
              _buildPromoCard(
                'assets/promo/hotel/hotelhorizon.png',
                'Rp 450.000',
                'HOTEL HORISON KOTA LAMA SEMARANG',
              ),
              const SizedBox(height: 8),
              _buildPromoCard(
                'assets/promo/hotel/nexthotel.png',
                '15%',
                'Next Hotel Jogja',
              ),
              const SizedBox(height: 8),
              _buildPromoCard(
                'assets/promo/hotel/thesunanhotel.png',
                '15%',
                'The Sunan Hotel Solo',
              ),
              const SizedBox(height: 8),
              _buildPromoCard(
                'assets/promo/hotel/allstayhotel.png',
                'Rp 450.000',
                'Alll Stay Hotel Jogja',
              ),
            ],
          ),
        ),
      ),
      
    );
  }

  Widget _buildPromoThumbnail(String imagePath, String title) {
    return SizedBox(
      width: 150,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath,
              height: 100,
              width: 150,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildPromoCard(String imagePath, String price, String title) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Image.asset(
              imagePath,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Harga Spesial Mulai Dari',
                    style: TextStyle(color: Colors.white, fontSize: 12, backgroundColor: Colors.black38),
                  ),
                  Text(
                    price,
                    style:const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold, backgroundColor: Colors.black38),
                  ),
                  const Text(
                    'Dengan menunjukkan Boarding Pass',
                    style: TextStyle(color: Colors.white, fontSize: 12, backgroundColor: Colors.black38),
                  ),
                 const SizedBox(height: 4),
                  Text(
                    title,
                    style:const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold, backgroundColor: Colors.black38),
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