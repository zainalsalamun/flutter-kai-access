import 'package:flutter/material.dart';
import '../../theme/theme.dart';

class TripPlannerPage extends StatefulWidget {
  const TripPlannerPage({super.key});

  @override
  State<TripPlannerPage> createState() => _TripPlannerPageState();
}

class _TripPlannerPageState extends State<TripPlannerPage> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedTripType = 'Sekali Jalan';
  DateTime _selectedDate = DateTime.now();
  String _selectedClass = 'Semua Kelas';
  int _selectedTravelers = 1;

  final List<String> _tripTypes = ['Sekali Jalan', 'Pulang Pergi'];
  final List<String> _trainClasses = [
    'Semua Kelas',
    'Eksekutif',
    'Bisnis',
    'Ekonomi'
  ];

  final List<Map<String, dynamic>> _popularDestinations = [
    {
      'city': 'Jakarta',
      'station': 'Stasiun Gambir',
      'price': 'Rp 150.000',
      'duration': '3j 30m',
      'image': 'assets/kota/jakarta.png',
      'trains': 12,
    },
    {
      'city': 'Bandung',
      'station': 'Stasiun Bandung',
      'price': 'Rp 120.000',
      'duration': '2j 45m',
      'image': 'assets/kota/bandung.png',
      'trains': 8,
    },
    {
      'city': 'Yogyakarta',
      'station': 'Stasiun Tugu',
      'price': 'Rp 180.000',
      'duration': '5j 15m',
      'image': 'assets/kota/yogyakarta.png',
      'trains': 10,
    },
  ];

  final List<Map<String, dynamic>> _savedTrips = [
    {
      'title': 'Liburan ke Yogyakarta',
      'from': 'Jakarta',
      'to': 'Yogyakarta',
      'date': '20 Apr 2026',
      'trains': 2,
      'color': primaryColor,
    },
    {
      'title': 'Kunjungan Bisnis Bandung',
      'from': 'Surabaya',
      'to': 'Bandung',
      'date': '25 Apr 2026',
      'trains': 1,
      'color': Colors.teal,
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey100,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: colorWhite),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Trip Planner',
          style: AppTextStyles.appBarTitle,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.history, color: colorWhite),
            onPressed: () {
              // Tampilkan riwayat trip
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search & Form Section
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [primaryColor, promoGradientStart],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
              child: Column(
                children: [
                  // Trip Type Toggle
                  Container(
                    decoration: BoxDecoration(
                      color: colorWhite.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: _tripTypes.map((type) {
                        final isSelected = _selectedTripType == type;
                        return Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedTripType = type;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? colorWhite
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                type,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: isSelected
                                      ? primaryColor
                                      : colorWhite.withOpacity(0.8),
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Search From-To
                  Container(
                    decoration: BoxDecoration(
                      color: colorWhite,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        // From Field
                        _buildLocationField(
                          icon: Icons.trip_origin,
                          iconColor: successColor,
                          hint: 'Dari mana?',
                          hintStyle: const TextStyle(color: textSecondary),
                          onTap: () {
                            // Pilih stasiun asal
                          },
                        ),
                        // Divider
                        Divider(
                          height: 1,
                          color: grey200,
                          indent: 56,
                        ),
                        // To Field
                        _buildLocationField(
                          icon: Icons.location_on,
                          iconColor: dangerColor,
                          hint: 'Ke mana?',
                          hintStyle: const TextStyle(color: textSecondary),
                          onTap: () {
                            // Pilih stasiun tujuan
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Date & Class Row
                  Row(
                    children: [
                      // Date Picker
                      Expanded(
                        child: _buildInfoChip(
                          icon: Icons.calendar_today,
                          label: _formatDate(_selectedDate),
                          onTap: () => _selectDate(context),
                        ),
                      ),
                      const SizedBox(width: 12),
                      // Class Selector
                      Expanded(
                        child: _buildInfoChip(
                          icon: Icons.airline_seat_recline_normal,
                          label: _selectedClass,
                          onTap: () => _showClassSelector(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Travelers
                  Row(
                    children: [
                      Expanded(
                        child: _buildInfoChip(
                          icon: Icons.person,
                          label: '$_selectedTravelers Traveler',
                          onTap: () => _showTravelerSelector(),
                        ),
                      ),
                      const SizedBox(width: 12),
                      // Search Button
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // Cari perjalanan
                            _searchTrips();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: warningColor,
                            foregroundColor: textBlack,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 0,
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.search, size: 20),
                              SizedBox(width: 8),
                              Text(
                                'Cari Trip',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Saved Trips Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Rencana Perjalanan',
                    style: AppTextStyles.h6,
                  ),
                  TextButton(
                    onPressed: () {
                      // Lihat semua rencana
                    },
                    child: const Text(
                      'Lihat Semua',
                      style: TextStyle(color: primaryColor),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 140,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: _savedTrips.length,
                itemBuilder: (context, index) {
                  final trip = _savedTrips[index];
                  return _buildSavedTripCard(trip);
                },
              ),
            ),
            const SizedBox(height: 24),

            // Popular Destinations Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Tujuan Populer',
                    style: AppTextStyles.h6,
                  ),
                  TextButton(
                    onPressed: () {
                      // Lihat semua tujuan
                    },
                    child: const Text(
                      'Lihat Semua',
                      style: TextStyle(color: primaryColor),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _popularDestinations.length,
              itemBuilder: (context, index) {
                final destination = _popularDestinations[index];
                return _buildDestinationCard(destination);
              },
            ),
            const SizedBox(height: 16),

            // Quick Actions
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: colorWhite,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: cardBorder),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Aksi Cepat',
                      style: AppTextStyles.h6,
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildQuickAction(
                          icon: Icons.history,
                          label: 'Riwayat',
                          color: primaryColor,
                          onTap: () {},
                        ),
                        _buildQuickAction(
                          icon: Icons.bookmark,
                          label: 'Tersimpan',
                          color: Colors.orange,
                          onTap: () {},
                        ),
                        _buildQuickAction(
                          icon: Icons.notifications_active,
                          label: 'Notifikasi',
                          color: Colors.teal,
                          onTap: () {},
                        ),
                        _buildQuickAction(
                          icon: Icons.help_outline,
                          label: 'Bantuan',
                          color: Colors.blue,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationField({
    required IconData icon,
    required Color iconColor,
    required String hint,
    required TextStyle hintStyle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Icon(icon, color: iconColor, size: 24),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                hint,
                style: hintStyle.copyWith(fontSize: 14),
              ),
            ),
            Icon(Icons.chevron_right, color: grey400, size: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoChip({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: colorWhite,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: grey300),
        ),
        child: Row(
          children: [
            Icon(icon, color: primaryColor, size: 18),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: textPrimary,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSavedTripCard(Map<String, dynamic> trip) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            trip['color'],
            (trip['color'] as Color).withOpacity(0.7),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: (trip['color'] as Color).withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: colorWhite.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.train,
                    color: colorWhite,
                    size: 16,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    trip['title'],
                    style: const TextStyle(
                      color: colorWhite,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      trip['from'],
                      style: TextStyle(
                        color: colorWhite.withOpacity(0.9),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      Icons.arrow_forward,
                      color: colorWhite.withOpacity(0.7),
                      size: 14,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      trip['to'],
                      style: const TextStyle(
                        color: colorWhite,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      trip['date'],
                      style: TextStyle(
                        color: colorWhite.withOpacity(0.8),
                        fontSize: 12,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: colorWhite.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '${trip['trains']} kereta',
                        style: const TextStyle(
                          color: colorWhite,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDestinationCard(Map<String, dynamic> destination) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: colorWhite,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Image
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
            child: Image.asset(
              destination['image'],
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 100,
                  height: 100,
                  color: grey200,
                  child: const Icon(
                    Icons.image_not_supported,
                    color: grey400,
                  ),
                );
              },
            ),
          ),
          // Info
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    destination['city'],
                    style: AppTextStyles.h6,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    destination['station'],
                    style: AppTextStyles.caption,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      _buildInfoBadge(
                        icon: Icons.access_time,
                        label: destination['duration'],
                      ),
                      const SizedBox(width: 8),
                      _buildInfoBadge(
                        icon: Icons.train,
                        label: '${destination['trains']} kereta',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Price & Action
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Column(
              children: [
                Text(
                  destination['price'],
                  style: AppTextStyles.priceSmall,
                ),
                const SizedBox(height: 8),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Pilih',
                    style: TextStyle(
                      color: colorWhite,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoBadge({required IconData icon, required String label}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: grey100,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: textSecondary),
          const SizedBox(width: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 10,
              color: textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickAction({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'Mei',
      'Jun',
      'Jul',
      'Agu',
      'Sep',
      'Okt',
      'Nov',
      'Des'
    ];
    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: primaryColor,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _showClassSelector() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            color: colorWhite,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: grey300,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Pilih Kelas Kereta',
                style: AppTextStyles.h5,
              ),
              const SizedBox(height: 16),
              ..._trainClasses.map((trainClass) {
                final isSelected = _selectedClass == trainClass;
                return ListTile(
                  leading: Icon(
                    Icons.airline_seat_recline_normal,
                    color: isSelected ? primaryColor : grey400,
                  ),
                  title: Text(
                    trainClass,
                    style: TextStyle(
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                      color: isSelected ? primaryColor : textPrimary,
                    ),
                  ),
                  trailing: isSelected
                      ? const Icon(Icons.check_circle, color: primaryColor)
                      : null,
                  onTap: () {
                    setState(() {
                      _selectedClass = trainClass;
                    });
                    Navigator.pop(context);
                  },
                );
              }).toList(),
            ],
          ),
        );
      },
    );
  }

  void _showTravelerSelector() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              decoration: const BoxDecoration(
                color: colorWhite,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: grey300,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Jumlah Traveler',
                    style: AppTextStyles.h5,
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: _selectedTravelers > 1
                            ? () {
                                setModalState(() {
                                  _selectedTravelers--;
                                });
                                setState(() {
                                  _selectedTravelers--;
                                });
                              }
                            : null,
                        icon: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _selectedTravelers > 1
                                ? primaryColor.withOpacity(0.1)
                                : grey200,
                          ),
                          child: Icon(
                            Icons.remove,
                            color:
                                _selectedTravelers > 1 ? primaryColor : grey400,
                          ),
                        ),
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: primaryColor, width: 2),
                        ),
                        child: Center(
                          child: Text(
                            '$_selectedTravelers',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: _selectedTravelers < 6
                            ? () {
                                setModalState(() {
                                  _selectedTravelers++;
                                });
                                setState(() {
                                  _selectedTravelers++;
                                });
                              }
                            : null,
                        icon: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _selectedTravelers < 6
                                ? primaryColor.withOpacity(0.1)
                                : grey200,
                          ),
                          child: Icon(
                            Icons.add,
                            color:
                                _selectedTravelers < 6 ? primaryColor : grey400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Selesai',
                        style: TextStyle(
                          color: colorWhite,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _searchTrips() {
    // Tampilkan loading atau navigasi ke halaman hasil pencarian
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
            'Mencari trip untuk $_selectedTravelers traveler dengan kelas $_selectedClass...'),
        backgroundColor: primaryColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
