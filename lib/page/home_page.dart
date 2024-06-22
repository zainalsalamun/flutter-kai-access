import 'package:flutter/material.dart';
import '../theme/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selamat Siang',
              style: TextStyle(fontSize: 14),
            ),
            Text(
              'ZAINAL',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8)
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/kai_pay.png',
                  height: 35,
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.qr_code_scanner),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.account_balance_wallet),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.history),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    color: Colors.amber,
                    child: const Column(
                      children: [
                        Text('0 RailPoin'),
                        Icon(Icons.star),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    color: Colors.grey[200],
                    child: const Column(
                      children: [
                        Text('Premium'),
                        Icon(Icons.verified_user),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            GridView.count(
              crossAxisCount: 4,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildServiceIcon(
                  context,
                  Icons.train,
                  'Antar Kota',
                  Colors.blue,
                ),
                _buildServiceIcon(
                  context,
                  Icons.train_outlined,
                  'Lokal',
                  Colors.orange,
                ),
                _buildServiceIcon(
                  context,
                  Icons.directions_railway,
                  'Commuter Line',
                  Colors.red,
                ),
                _buildServiceIcon(
                  context,
                  Icons.tram,
                  'LRT',
                  Colors.purple,
                ),
                _buildServiceIcon(
                  context,
                  Icons.hotel,
                  'Hotel',
                  Colors.blue,
                ),
                _buildServiceIcon(
                  context,
                  Icons.local_shipping,
                  'KAI Logistik',
                  Colors.blue,
                ),
                _buildServiceIcon(
                  context,
                  Icons.phone_android,
                  'Pulsa',
                  Colors.blue,
                ),
                _buildServiceIcon(
                  context,
                  Icons.videogame_asset,
                  'Games & Entertainment',
                  Colors.blue,
                ),
                _buildServiceIcon(
                  context,
                  Icons.flash_on,
                  'PLN',
                  Colors.blue,
                ),
              ],
            ),
            Container(
              height: 120,
              width: double.infinity,
              margin: const EdgeInsets.only(top: 16), 
              decoration: BoxDecoration(
                color: Colors.blueAccent[100],
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
               
              ),
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/logo_kai.png',
                    height: 80,
                    width: 120,
                    fit: BoxFit.fill,
                  ),
                   const Text(
                    'Trip Planner',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              
            ),
            const SizedBox(height: 16),
            const Row(
              children: [
                Text(
                  'Promo',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                SizedBox(height: 8),
                Column(
                  children: [
                    Text(
                      'Lihat Semua',
                      style: TextStyle(fontSize: 14, color: Colors.blue),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 150,
              width: double.infinity,
              child: ListView.builder(
                padding: const EdgeInsets.only(left: 8, right: 8),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    height: 150,
                    width: 250,
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 8),
                        Image.asset(
                          'assets/logo_kai.png',
                          height: 80,
                          width: 120,
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Promo',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 16),
                      ]
                    )
                    
                  );
                }
              )
            ),
            const SizedBox(height: 16),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text (
                  'Tujuan Populer',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 150,
              width: double.infinity,
              child: ListView.builder(
                padding: const EdgeInsets.only(left: 8, right: 8),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    height: 150,
                    width: 250,
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 8),
                        Image.asset(
                          'assets/logo_kai.png',
                          height: 80,
                          width: 120,
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Promo',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 16),
                      ]
                    )
                    
                  );
                }
              )
            ),
            const SizedBox(height: 8),
            const Row(
              children: [
                Text(
                  'Tukarkan Railpoin mu sekarang',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                SizedBox(height: 16),
                Column(
                  children: [
                    Text(
                      'Lihat Semua',
                      style: TextStyle(fontSize: 14, color: Colors.blue),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
             SizedBox(
              height: 150,
              width: double.infinity,
              child: ListView.builder(
                padding: const EdgeInsets.only(left: 8, right: 8),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    height: 150,
                    width: 250,
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 8),
                        Image.asset(
                          'assets/logo_kai.png',
                          height: 80,
                          width: 120,
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Promo',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 16),
                      ]
                    )
                    
                  );
                }
              )
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceIcon(BuildContext context, IconData icon, String label, Color color) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: color,
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 8),
        Text(label, textAlign: TextAlign.center, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}
