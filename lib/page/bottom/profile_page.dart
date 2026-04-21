import 'package:flutter/material.dart';
import '../../theme/theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorWhite,
        elevation: 0,
        title: const Text(
          'Akun',
          style: AppTextStyles.appBarTitle,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: textBlack),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildProfileCard(),
            const SizedBox(height: 20),
            _buildMenuSection(),
            const SizedBox(height: 20),
            _buildAppInfo(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 167, 138, 215),
            Color.fromARGB(255, 152, 71, 166)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: colorWhite, width: 2),
                ),
                child: const CircleAvatar(
                  radius: 32,
                  backgroundColor: profileAvatarColor,
                  child: Text(
                    'Z',
                    style: AppTextStyles.h3White,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'ZAINAL',
                      style: AppTextStyles.h4White,
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: premiumBadgeColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.verified_user,
                            color: colorWhite,
                            size: 14,
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Premium Member',
                            style: AppTextStyles.badgeMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              _buildQuickAction(
                Icons.person_outline,
                'Lihat Profile',
                colorWhite,
              ),
              const SizedBox(width: 12),
              _buildQuickAction(
                Icons.qr_code,
                'QR Code',
                colorWhite,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickAction(IconData icon, String label, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: colorWhite.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuSection() {
    return Container(
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
          _buildMenuItem(Icons.lock_outline, 'Ganti Kata Sandi'),
          _buildMenuDivider(),
          _buildMenuItem(Icons.history, 'Riwayat Transaksi'),
          _buildMenuDivider(),
          _buildMenuItem(Icons.card_membership, 'Member Benefit'),
          _buildMenuDivider(),
          _buildMenuItem(Icons.group_outlined, 'Daftar Penumpang'),
          _buildMenuDivider(),
          _buildMenuItem(Icons.face_retouching_natural, 'Registrasi Face ID'),
          _buildMenuDivider(),
          _buildMenuItem(Icons.credit_card_outlined, 'Metode Pembayaran'),
          _buildMenuDivider(),
          _buildMenuItem(Icons.help_outline, 'Pusat Bantuan'),
          _buildMenuDivider(),
          _buildMenuItem(Icons.info_outline, 'Tentang Access'),
          _buildMenuDivider(),
          _buildMenuItem(Icons.language, 'Bahasa'),
          _buildMenuDivider(),
          _buildMenuItem(Icons.logout, 'Keluar', isLogout: true),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, {bool isLogout = false}) {
    return ListTile(
      leading: Icon(
        icon,
        color: isLogout ? logoutColor : Colors.grey[700],
      ),
      title: Text(
        title,
        style:
            isLogout ? AppTextStyles.bodyMediumRed : AppTextStyles.bodyMedium,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: isLogout ? logoutColor : Colors.grey[400],
      ),
      onTap: () {},
    );
  }

  Widget _buildMenuDivider() {
    return Divider(
      thickness: 1,
      height: 1,
      indent: 56,
      color: Colors.grey[200],
    );
  }

  Widget _buildAppInfo() {
    return const Column(
      children: [
        Text(
          'Versi 1.0.0',
          style: AppTextStyles.caption,
        ),
        SizedBox(height: 4),
        Text(
          'Copyright © 2024 Access.',
          style: AppTextStyles.caption,
        ),
      ],
    );
  }
}
