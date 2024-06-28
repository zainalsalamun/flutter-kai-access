import 'package:flutter/material.dart';

class PageBayar extends StatelessWidget {
  const PageBayar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pesan Tiket'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ExtraProtectionWidget(),
              const SizedBox(height: 16),
              TrainInfoCard(),
              const SizedBox(height: 16),
              PriceDetailsCard(),
              const SizedBox(height: 16),
              TermsAndConditionsWidget(),
              const SizedBox(height: 16),
              ActionButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

class ExtraProtectionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green),
            SizedBox(width: 8),
            Text('Perlindungan Ekxtra'),
          ],
        ),
        Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green),
            SizedBox(width: 8),
            Text('RailFood'),
          ],
        ),
      ],
    );
  }
}

class TrainInfoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 3,
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Kereta Pergi', style: TextStyle(fontSize: 18)),
            SizedBox(height: 16),
            Row(
              children: [
               // Icon(Icons.train, color: Colors.orange, size: 40),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '12 Juli 2024 • 19:00 - 02:35 • +1 hari',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text('PASARSENEN'),
                          Icon(Icons.arrow_forward, size: 16),
                          Text('YOGYAKARTA'),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text('SENJA UTAMA YK (140A) • EKONOMI'),
                        SizedBox(height: 8),
               Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                
              children: [
                Text('Total Harga', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text('Rp310.000', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
       
                    ],
                  ),
                ),
                     ],
            ),
          ],
        ),
      ),
    );
  }
}

class PriceDetailsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 3,
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Rincian Harga', style: TextStyle(fontSize: 18)),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(child: Text('SENJA UTAMA YK (140A) - EKO Dewasa (x1)')),
                Text('Rp310.000'),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total Harga', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text('Rp310.000', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TermsAndConditionsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: true,
          onChanged: (bool? value) {},
        ),
        Expanded(
          child: RichText(
            text: const TextSpan(
              text: 'Saya telah membaca dan setuju terhadap ',
              style: TextStyle(color: Colors.black),
              children: [
                TextSpan(
                  text: 'Syarat dan ketentuan pembelian tiket',
                  style: TextStyle(color: Colors.blue),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child:const Text('BAYAR', style: TextStyle(color: Colors.white),),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              side: const BorderSide(color: Colors.blue),
            ),
            child: const Text('TAMBAH KE KERANJANG'),
          ),
        ),
      ],
    );
  }

}
