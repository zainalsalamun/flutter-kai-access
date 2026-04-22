import 'package:flutter/material.dart';
import 'package:myapp/core/widgets/bottom_navbar.dart';
import 'package:myapp/features/payment/presentation/pages/kai_pay_page.dart';
import 'package:myapp/features/services/presentation/pages/bus_page.dart';
import 'package:myapp/features/services/presentation/pages/hotel_page.dart';
import 'package:myapp/features/services/presentation/pages/railfood_page.dart';
import 'package:myapp/features/services/presentation/pages/taksi_page.dart';
import 'package:myapp/features/services/presentation/pages/trip_planner_page.dart';
import 'package:myapp/features/ticket/presentation/pages/page_antar_kota.dart';
import 'package:myapp/features/ticket/presentation/pages/page_bayar.dart';
import 'package:myapp/features/ticket/presentation/pages/page_layanan_transportasi.dart';
import 'package:myapp/features/ticket/presentation/pages/page_list_jadwal_kereta.dart';
import 'package:myapp/features/ticket/presentation/pages/page_list_tujuan.dart';
import 'package:myapp/features/ticket/presentation/pages/page_perlindungan_extra.dart';
import 'package:myapp/features/ticket/presentation/pages/page_pesan_ticket.dart';
import 'package:myapp/features/ticket/presentation/pages/page_pesan_ticket_lanjutan.dart';
import 'package:myapp/features/ticket/presentation/pages/page_pilih_kursi.dart';
import 'package:myapp/features/ticket/presentation/pages/page_pilih_makanan.dart';

class AppRoutes {
  AppRoutes._();

  static Map<String, WidgetBuilder> get routes => {
        '/home': (context) => BottomNavbar(),
        '/kai-pay': (context) => const KaiPayPage(),
        '/antar-kota': (context) => const AntarKotaPage(),
        '/jadwal-kereta': (context) => const PageListJadwalKereta(),
        '/list-tujuan': (context) => PageListTujuan(),
        '/pesan-tiket': (context) => const PagePesanTicket(),
        '/pesan-tiket-lanjutkan': (context) => const PagePesanTicketLanjutkan(),
        '/pilih-kursi': (context) => const PagePilihKursi(),
        '/perlindungan': (context) => const PagePerlindunganExtra(),
        '/pilih-makanan': (context) => const PagePilihMakanan(),
        '/layanan-transportasi': (context) => const PageLayananTransportasi(),
        '/bayar': (context) => const PageBayar(),
        '/railfood': (context) => const RailFoodPage(),
        '/taksi': (context) => const TaksiPage(),
        '/bus': (context) => const BusPage(),
        '/hotel': (context) => const HotelPage(),
        '/trip-planner': (context) => const TripPlannerPage(),
      };
}
