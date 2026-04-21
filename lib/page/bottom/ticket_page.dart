import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../theme/theme.dart';

class TicketPage extends StatefulWidget {
  const TicketPage({super.key});

  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late final Future<List<Map<String, dynamic>>> _ticketListFuture =
      _loadTicketList();

  Future<List<Map<String, dynamic>>> _loadTicketList() async {
    final jsonString =
        await rootBundle.loadString('assets/ticket_list_data.json');
    final List<dynamic> jsonData = json.decode(jsonString);

    return jsonData
        .map(
          (item) => {
            'booking_code': item['booking_code'] as String,
            'train_name': item['train_name'] as String,
            'class_name': item['class_name'] as String,
            'train_number': item['train_number'] as String,
            'departure_station': item['departure_station'] as String,
            'departure_date': item['departure_date'] as String,
            'arrival_station': item['arrival_station'] as String,
            'arrival_date': item['arrival_date'] as String,
            'departure_time': item['departure_time'] as String,
            'arrival_time': item['arrival_time'] as String,
          },
        )
        .toList();
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorWhite,
        elevation: 0,
        title: const Text(
          'Tiket Saya',
          style: AppTextStyles.appBarTitle,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.receipt_long, color: Colors.black),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Container(
            color: colorWhite,
            child: TabBar(
              controller: _tabController,
              labelColor: primaryColor,
              unselectedLabelColor: Colors.grey,
              indicatorColor: primaryColor,
              indicatorWeight: 3,
              tabs: const [
                Tab(text: 'Semua'),
                Tab(text: 'Antar Kota'),
                Tab(text: 'Bandara'),
                Tab(text: 'Lokal'),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildTicketList(),
          _buildAntarKotaContent(),
          _buildBandaraContent(),
          _buildEmptyState(),
        ],
      ),
    );
  }

  Widget _buildTicketList() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Quick Services
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [primaryColor, Color(0xFF9C27B0)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Semua tiket kereta yang sudah aktif dan menunggu pembayaran',
                  style: AppTextStyles.bodyMediumWhite,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildQuickService(
                        'Antar Kota',
                        Icons.train,
                        antarKotaColor,
                        () => Navigator.pushNamed(context, '/antar-kota')),
                    _buildQuickService(
                        'RailFood',
                        Icons.fastfood,
                        railfoodColor,
                        () => Navigator.pushNamed(context, '/railfood')),
                    _buildQuickService('Taksi', Icons.local_taxi, taksiColor,
                        () => Navigator.pushNamed(context, '/taksi')),
                    _buildQuickService(
                        'Bus',
                        Icons.directions_bus,
                        busEksekutifColor,
                        () => Navigator.pushNamed(context, '/bus')),
                    _buildQuickService('Whoosh', Icons.train, whooshColor, () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (context) => Container(
                          padding: const EdgeInsets.all(20),
                          decoration: const BoxDecoration(
                            color: colorWhite,
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
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          'Layanan kereta bandara cepat Jakarta-Bandung',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey,
                                          ),
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
                                    // Navigasi ke tab Bandara
                                    _tabController.animateTo(
                                        2); // indeks 2 adalah tab Bandara
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
                                    'Lihat Layanan Whoosh',
                                    style: TextStyle(
                                      color: colorWhite,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 12),
                            ],
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Add Ticket Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add, color: colorWhite),
              label: const Text(
                'CEK & TAMBAH TIKET',
                style: TextStyle(
                  color: colorWhite,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),

          FutureBuilder<List<Map<String, dynamic>>>(
            future: _ticketListFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              if (snapshot.hasError || !snapshot.hasData) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Center(
                    child: Text('Data tiket tidak tersedia'),
                  ),
                );
              }

              final tickets = snapshot.data!;

              return Column(
                children: tickets
                    .map(
                      (ticket) => _buildTicketCard(
                        ticket['booking_code'] as String,
                        ticket['train_name'] as String,
                        ticket['class_name'] as String,
                        ticket['train_number'] as String,
                        ticket['departure_station'] as String,
                        ticket['departure_date'] as String,
                        ticket['arrival_station'] as String,
                        ticket['arrival_date'] as String,
                        ticket['departure_time'] as String,
                        ticket['arrival_time'] as String,
                      ),
                    )
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAntarKotaContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Antar Kota Service Card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [antarKotaColor, antarKotaColor.withOpacity(0.7)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: colorWhite.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.train,
                        color: colorWhite,
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Layanan Antar Kota',
                            style: AppTextStyles.h5White,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Pesan tiket kereta antar kota',
                            style: AppTextStyles.bodyMediumWhite70,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () =>
                        Navigator.pushNamed(context, '/antar-kota'),
                    icon:
                        const Icon(Icons.arrow_forward, color: antarKotaColor),
                    label: const Text(
                      'Pesan Sekarang',
                      style: TextStyle(
                        color: antarKotaColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorWhite,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Quick Services
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [antarKotaColor, Color(0xFF1565C0)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Layanan Terkait',
                  style: TextStyle(
                      color: colorWhite,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildQuickService(
                        'RailFood',
                        Icons.fastfood,
                        railfoodColor,
                        () => Navigator.pushNamed(context, '/railfood')),
                    _buildQuickService('Taksi', Icons.local_taxi, taksiColor,
                        () => Navigator.pushNamed(context, '/taksi')),
                    _buildQuickService(
                        'Bus',
                        Icons.directions_bus,
                        busEksekutifColor,
                        () => Navigator.pushNamed(context, '/bus')),
                    _buildQuickService('Hotel', Icons.hotel, hotelColor,
                        () => Navigator.pushNamed(context, '/hotel')),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Antar Kota Tickets Header
          const Text(
            'Tiket Antar Kota',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),

          // Sample Antar Kota Tickets
          _buildTicketCard(
            'A1B2C3D',
            'ARGO PARAHYANGA',
            'BISNIS (B)',
            'No Kereta 112',
            'GAMBIR (GMR)',
            'Senin, 1 Juli 2024',
            'BANDUNG (BD)',
            'Senin, 1 Juli 2024',
            '07:00',
            '10:30',
          ),
          const SizedBox(height: 12),
          _buildTicketCard(
            'E4F5G6H',
            'ARGO WILIS',
            'EKSEKUTIF (E)',
            'No Kereta 088',
            'SURABAYA GUBENG (SGU)',
            'Selasa, 2 Juli 2024',
            'BANDAR LAMPUNG (TLM)',
            'Selasa, 2 Juli 2024',
            '22:00',
            '06:00',
          ),
        ],
      ),
    );
  }

  Widget _buildBandaraContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Bandara Service Card - Whoosh
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [whooshColor, whooshColor.withOpacity(0.7)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: colorWhite.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.train,
                        color: colorWhite,
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Kereta Bandara Whoosh',
                            style: AppTextStyles.h5White,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Jakarta (Halim) - Bandung (Tegalluar)\nWaktu tempuh ± 40 menit',
                            style: AppTextStyles.bodyMediumWhite70,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // TODO: Navigasi ke halaman pemesanan Whoosh
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  'Halaman pemesanan Kereta Bandara Whoosh sedang dalam pengembangan'),
                            ),
                          );
                        },
                        icon:
                            const Icon(Icons.arrow_forward, color: whooshColor),
                        label: const Text(
                          'Pesan Sekarang',
                          style: TextStyle(
                            color: whooshColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colorWhite,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton.icon(
                      onPressed: () {
                        // TODO: Tampilkan jadwal Whoosh
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                'Jadwal Kereta Bandara Whoosh sedang dalam pengembangan'),
                          ),
                        );
                      },
                      icon: const Icon(Icons.schedule, color: colorWhite),
                      label: const Text(
                        'Jadwal',
                        style: TextStyle(
                          color: colorWhite,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorWhite.withOpacity(0.2),
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Whoosh Info Card
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: whooshColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: whooshColor.withOpacity(0.3)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.info, color: whooshColor),
                    const SizedBox(width: 8),
                    Text(
                      'Informasi Kereta Bandara Whoosh',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: whooshColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                _buildInfoRow('Rute', 'Jakarta (Halim) - Bandung (Tegalluar)'),
                _buildInfoRow('Waktu Tempuh', '± 40 menit'),
                _buildInfoRow('Frekuensi', 'Setiap jam'),
                _buildInfoRow('Kelas', 'Eksekutif'),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Quick Services
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [whooshColor, const Color(0xFF388E3C)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Layanan Terkait',
                  style: TextStyle(
                      color: colorWhite,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildQuickService(
                        'RailFood',
                        Icons.fastfood,
                        railfoodColor,
                        () => Navigator.pushNamed(context, '/railfood')),
                    _buildQuickService('Taksi', Icons.local_taxi, taksiColor,
                        () => Navigator.pushNamed(context, '/taksi')),
                    _buildQuickService(
                        'Bus',
                        Icons.directions_bus,
                        busEksekutifColor,
                        () => Navigator.pushNamed(context, '/bus')),
                    _buildQuickService('Hotel', Icons.hotel, hotelColor,
                        () => Navigator.pushNamed(context, '/hotel')),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Bandara Tickets Header
          const Text(
            'Tiket Bandara',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),

          // Empty state for bandara tickets
          Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey[200]!),
            ),
            child: Column(
              children: [
                Icon(
                  Icons.train,
                  size: 48,
                  color: Colors.grey[400],
                ),
                const SizedBox(height: 12),
                Text(
                  'Belum Ada Tiket Bandara',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Tiket Kereta Bandara Whoosh Anda akan muncul di sini',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[500],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.confirmation_num,
            size: 80,
            color: Colors.grey[300],
          ),
          const SizedBox(height: 16),
          Text(
            'Belum Ada Tiket',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Tiket yang Anda pesan akan muncul di sini',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickService(
      String title, IconData icon, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: colorWhite.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: colorWhite, size: 20),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            style: const TextStyle(
              color: colorWhite,
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTicketCard(
    String kodePemesan,
    String namaKereta,
    String kelas,
    String noKereta,
    String stasiunAsal,
    String tanggalBerangkat,
    String stasiunTujuan,
    String tanggalSampai,
    String jamBerangkat,
    String jamSampai,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: colorWhite,
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
          // Header
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [primaryColor, primaryColor.withOpacity(0.7)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  kodePemesan,
                  style: const TextStyle(
                    color: colorWhite,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: colorWhite,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'Antar Kota',
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            namaKereta,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            '$kelas • $noKereta',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      'assets/logo_kai.png',
                      height: 28,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.circle,
                                size: 10,
                                color: primaryColor,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                'Berangkat',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey[500],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            stasiunAsal,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            '$tanggalBerangkat, $jamBerangkat',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.grey[400],
                      size: 20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Tiba',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey[500],
                                ),
                              ),
                              const SizedBox(width: 6),
                              Icon(
                                Icons.circle,
                                size: 10,
                                color: warningColor,
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            stasiunTujuan,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.end,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            '$tanggalSampai, $jamSampai',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                            textAlign: TextAlign.end,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
