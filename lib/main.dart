import 'package:flutter/material.dart';
import 'package:myapp/page/payment/kai_pay_page.dart';
import 'package:myapp/page/ticket/page_antar_kota.dart';
import 'package:myapp/page/ticket/page_perlindungan_extra.dart';
import 'package:myapp/widget/bottom_navbar.dart';
import 'page/ticket/page_bayar.dart';
import 'page/ticket/page_layanan_transportasi.dart';
import 'page/ticket/page_list_jadwal_kereta.dart';
import 'page/ticket/page_pesan_ticket_lanjutan.dart';
import 'page/ticket/page_list_tujuan.dart';
import 'page/ticket/page_pesan_ticket.dart';
import 'page/ticket/page_pilih_kursi.dart';
import 'page/ticket/page_pilih_makanan.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Train Ticket App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BottomNavbar(),
      routes: {
        '/home' :(context) => BottomNavbar(),
  '/kai-pay': (context)  => const KaiPayPage(),
  '/antar-kota' : (context) => const AntarKotaPage(),
  '/jadwal-kereta' :(context) => const PageListJadwalKereta(),
  '/list-tujuan' :(context) => PageListTujuan(),
  '/pesan-tiket' :(context) => const PagePesanTicket(),
  '/pesan-tiket-lanjutkan' :(context) => const PagePesanTicketLanjutkan(),
  '/pilih-kursi' :(context) => const PagePilihKursi(),
  '/perlindungan' : (context) => const PagePerlindunganExtra(),
  '/pilih-makanan' : (context) => const PagePilihMakanan(),
  '/layanan-transportasi' :(context) => const PageLayananTransportasi(),
  '/bayar' : (context) => const PageBayar(),

},


    );
  }
}
