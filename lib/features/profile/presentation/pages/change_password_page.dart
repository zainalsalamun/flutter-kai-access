import 'package:flutter/material.dart';

import 'package:myapp/core/theme/app_theme.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _hideCurrentPassword = true;
  bool _hideNewPassword = true;
  bool _hideConfirmPassword = true;

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  bool get _hasMinLength => _newPasswordController.text.length >= 8;
  bool get _hasUppercase =>
      RegExp(r'[A-Z]').hasMatch(_newPasswordController.text);
  bool get _hasNumber => RegExp(r'[0-9]').hasMatch(_newPasswordController.text);
  bool get _isConfirmationMatch =>
      _confirmPasswordController.text.isNotEmpty &&
      _confirmPasswordController.text == _newPasswordController.text;

  void _submitForm() {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) {
      setState(() {});
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Kata sandi berhasil diperbarui'),
        backgroundColor: successColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey50,
      appBar: AppBar(
        backgroundColor: colorWhite,
        elevation: 0,
        title: const Text(
          'Ganti Kata Sandi',
          style: AppTextStyles.appBarTitle,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSecurityHeader(),
              const SizedBox(height: 20),
              _buildPasswordCard(),
              const SizedBox(height: 20),
              _buildPasswordRules(),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: colorWhite,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    'Simpan Kata Sandi Baru',
                    style: AppTextStyles.buttonLargeWhite,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Center(
                child: Text(
                  'Pastikan kata sandi baru tidak sama dengan kata sandi sebelumnya.',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.caption.copyWith(color: grey600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSecurityHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            primaryColor,
            profileGradientEnd.withValues(alpha: 0.9),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withValues(alpha: 0.18),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              color: colorWhite.withValues(alpha: 0.18),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.lock_reset_rounded,
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
                  'Perbarui keamanan akun',
                  style: AppTextStyles.h6White,
                ),
                const SizedBox(height: 6),
                Text(
                  'Gunakan kombinasi huruf besar, angka, dan minimal 8 karakter untuk perlindungan yang lebih baik.',
                  style: AppTextStyles.bodySmallWhite70,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: colorWhite,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Form Kata Sandi',
            style: AppTextStyles.h6,
          ),
          const SizedBox(height: 6),
          Text(
            'Masukkan kata sandi lama Anda lalu buat kata sandi baru.',
            style: AppTextStyles.bodyMedium.copyWith(color: grey600),
          ),
          const SizedBox(height: 18),
          _buildPasswordField(
            label: 'Kata Sandi Saat Ini',
            hintText: 'Masukkan kata sandi saat ini',
            controller: _currentPasswordController,
            obscureText: _hideCurrentPassword,
            onToggleVisibility: () {
              setState(() {
                _hideCurrentPassword = !_hideCurrentPassword;
              });
            },
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Kata sandi saat ini wajib diisi';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          _buildPasswordField(
            label: 'Kata Sandi Baru',
            hintText: 'Masukkan kata sandi baru',
            controller: _newPasswordController,
            obscureText: _hideNewPassword,
            onChanged: (_) => setState(() {}),
            onToggleVisibility: () {
              setState(() {
                _hideNewPassword = !_hideNewPassword;
              });
            },
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Kata sandi baru wajib diisi';
              }
              if (value.length < 8) {
                return 'Minimal 8 karakter';
              }
              if (!RegExp(r'[A-Z]').hasMatch(value)) {
                return 'Tambahkan minimal 1 huruf besar';
              }
              if (!RegExp(r'[0-9]').hasMatch(value)) {
                return 'Tambahkan minimal 1 angka';
              }
              if (value == _currentPasswordController.text) {
                return 'Kata sandi baru harus berbeda';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          _buildPasswordField(
            label: 'Konfirmasi Kata Sandi Baru',
            hintText: 'Ulangi kata sandi baru',
            controller: _confirmPasswordController,
            obscureText: _hideConfirmPassword,
            onChanged: (_) => setState(() {}),
            onToggleVisibility: () {
              setState(() {
                _hideConfirmPassword = !_hideConfirmPassword;
              });
            },
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Konfirmasi kata sandi wajib diisi';
              }
              if (value != _newPasswordController.text) {
                return 'Konfirmasi kata sandi belum sama';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordField({
    required String label,
    required String hintText,
    required TextEditingController controller,
    required bool obscureText,
    required VoidCallback onToggleVisibility,
    ValueChanged<String>? onChanged,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.labelMedium.copyWith(color: grey800),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          onChanged: onChanged,
          validator: validator,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: AppTextStyles.bodyMedium.copyWith(color: grey500),
            filled: true,
            fillColor: grey50,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            suffixIcon: IconButton(
              onPressed: onToggleVisibility,
              icon: Icon(
                obscureText ? Icons.visibility_off_outlined : Icons.visibility,
                color: grey600,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: grey200),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: primaryColor, width: 1.4),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: logoutColor),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: logoutColor, width: 1.4),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordRules() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: colorWhite,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: grey200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Syarat Kata Sandi',
            style: AppTextStyles.h6,
          ),
          const SizedBox(height: 14),
          _buildRuleItem(
            'Minimal 8 karakter',
            _hasMinLength,
          ),
          const SizedBox(height: 10),
          _buildRuleItem(
            'Mengandung minimal 1 huruf besar',
            _hasUppercase,
          ),
          const SizedBox(height: 10),
          _buildRuleItem(
            'Mengandung minimal 1 angka',
            _hasNumber,
          ),
          const SizedBox(height: 10),
          _buildRuleItem(
            'Konfirmasi kata sandi sudah sesuai',
            _isConfirmationMatch,
          ),
        ],
      ),
    );
  }

  Widget _buildRuleItem(String label, bool fulfilled) {
    return Row(
      children: [
        Icon(
          fulfilled ? Icons.check_circle : Icons.radio_button_unchecked,
          color: fulfilled ? successColor : grey400,
          size: 20,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            label,
            style: AppTextStyles.bodyMedium.copyWith(
              color: fulfilled ? grey800 : grey600,
            ),
          ),
        ),
      ],
    );
  }
}
