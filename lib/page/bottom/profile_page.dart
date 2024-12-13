import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 50),
              _buildProfileSection(),
              const SizedBox(height: 16),
              _buildMenuItem(
                Icons.lock,
                'Ganti Kata Sandi',
              ),
              _buildDivider(),
              _buildMenuItem(Icons.history, 'Riwayat Transaksi'),
              _buildDivider(),
              _buildMenuItem(FontAwesomeIcons.gem, 'Member Benefit'),
              _buildDivider(),
              _buildMenuItem(Icons.group, 'Daftar Penumpang'),
              _buildDivider(),
              _buildMenuItem(Icons.face, 'Registrasi Face Recognition'),
              _buildDivider(),
              _buildMenuItem(Icons.credit_card, 'Metode Pembayaran Saya'),
              _buildDivider(),
              _buildMenuItem(Icons.help, 'Pusat Bantuan'),
              _buildDivider(),
              _buildMenuItem(Icons.settings, 'Tentang Access'),
              _buildDivider(),
              _buildMenuItem(Icons.language, 'Bahasa'),
              _buildDivider(),
              _buildMenuItem(Icons.logout, 'Keluar'),
              _buildDivider(),
              const SizedBox(height: 16),
              const Text('Versi 1.0.0', style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 16),
              const Text('Copyright © 2023 Access.',
                  style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return Card(
      elevation: 4,
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.orange,
                  child: Text(
                    'Z',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
                SizedBox(width: 16),
                Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ZAINAL',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Premium Member | 009823733',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 30)
                  ],
                ),
              ],
            ),
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.person),
                  label: const Text('Lihat Profile'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.qr_code),
                  label: const Text('QR code'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {},
    );
  }

  Widget _buildDivider() {
    return const Divider(
      thickness: 1,
      height: 0,
    );
  }
}
