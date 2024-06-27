import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class KaiPayPage extends StatelessWidget {
  const KaiPayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Container(
         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          children: [
            const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Column(
                  children: [
                     CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.orange,
                      child: Text(
                        'Z',
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text('KaI Pay'),
                    SizedBox(height: 16),
                    Text('co-Branding dengan KaI Travel', style: TextStyle(color: Colors.grey)),
                    SizedBox(height: 16),
                  ],
                ),
                
              ],
            ),
            Column(
              children: [
                const Row(
                  children: [
                    Text('Riwayat KAIPay', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  ],
                ),
               const  SizedBox(height: 8),
                Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildCategoryChip('Semua', true, ),
                  _buildCategoryChip('Top Up', false),
                  _buildCategoryChip('Pembayaran', false), 
                ],
            ),
              const SizedBox(height: 16),
            const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
               
                  Center(
                    child: Icon(
                      Icons.menu_book_sharp,
                      color: Color.fromRGBO(180, 103, 222, 1),
                      size: 150,
                      
                    ),
                  ),
                  SizedBox(height: 16), 
                ]
               ),
               const SizedBox(height: 16),
               Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                const Text('Belum Ada Transaksi Hari Ini', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text('Setelah melakukan transaksi menggunakan KAIPay, kamu bisa melihat riwayat transaksimu disini', 
                style: TextStyle(color: Colors.black.withOpacity(0.5), 
                fontSize: 16, fontWeight: FontWeight.w400,),
                textAlign: TextAlign.center,
                )
               ],
               )
              ]
            ),
          ],
        ),
 
      )
    );
  }

   Widget _buildCategoryChip(String label, bool selected, {Color? color} ) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: ChoiceChip(
        side: const BorderSide(color: Colors.blueAccent),
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          label: Text(label),
          selected: selected,
          // onSelected: (bool selected) {
          //   if (selected) {
          //   } else {
          //   }
          // },
          selectedColor: Colors.blue.shade100,
        ),
      ),
    );
  }
}