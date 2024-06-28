import 'package:flutter/material.dart';

class PagePesanTicketLanjutkan extends StatelessWidget {
  const PagePesanTicketLanjutkan({super.key});

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: const Text(
          'Pesan Tiket',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Jum, 12 Jul 2024 • 19.00 - 02.35',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Text('+1 hari', style: TextStyle(color: Colors.orange)),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('PASARSENEN'),
                        Icon(Icons.arrow_forward),
                        Text('YOGYAKARTA'),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text('SENJA UTAMA YK (140A) • EKONOMI (CA)'),
                    Text('1 Dewasa'),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Kereta Pergi',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const Text(
                          'Penumpang 1 (Dewasa)',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        ElevatedButton(
                          onPressed: () {
                        Navigator.pushNamed(context, '/pilih-kursi');

                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.blue, backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child:const  Text('Pilih Kursi'),
                        ),
                      ],
                    ),
                   const SizedBox(height: 8),
                    const Text('ZAINAL'),
                    const Text('Premium 1 / Kursi 1A'),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                                      Navigator.pushNamed(context, '/perlindungan');

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:const  EdgeInsets.symmetric(vertical: 16),
                ),
                
                  child: const Center(
                    child:  Text(
                      'LANJUTKAN',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}