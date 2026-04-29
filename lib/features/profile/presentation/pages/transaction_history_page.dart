import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:myapp/core/theme/app_theme.dart';

class TransactionHistoryPage extends StatefulWidget {
  const TransactionHistoryPage({super.key});

  @override
  State<TransactionHistoryPage> createState() => _TransactionHistoryPageState();
}

class _TransactionHistoryPageState extends State<TransactionHistoryPage> {
  late final Future<List<TransactionHistoryItem>> _transactionFuture =
      _loadTransactions();

  String _selectedFilter = 'Semua';

  Future<List<TransactionHistoryItem>> _loadTransactions() async {
    final jsonString =
        await rootBundle.loadString('assets/transaction_history_data.json');
    final List<dynamic> jsonData = json.decode(jsonString);

    return jsonData
        .map(
          (item) => TransactionHistoryItem.fromJson(
            item as Map<String, dynamic>,
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey50,
      appBar: AppBar(
        backgroundColor: colorWhite,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Riwayat Transaksi',
          style: AppTextStyles.appBarTitle,
        ),
      ),
      body: FutureBuilder<List<TransactionHistoryItem>>(
        future: _transactionFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(color: primaryColor),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  'Data riwayat transaksi belum bisa dimuat.',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodyMedium.copyWith(color: grey700),
                ),
              ),
            );
          }

          final transactions = snapshot.data ?? <TransactionHistoryItem>[];
          final filteredTransactions = _selectedFilter == 'Semua'
              ? transactions
              : transactions
                  .where((item) => item.status == _selectedFilter)
                  .toList();

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildOverviewCard(transactions),
                const SizedBox(height: 20),
                _buildFilterSection(),
                const SizedBox(height: 16),
                ...filteredTransactions.map(_buildTransactionCard),
                if (filteredTransactions.isEmpty) _buildEmptyState(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildOverviewCard(List<TransactionHistoryItem> transactions) {
    final totalTransactions = transactions.length;
    final totalPaid = transactions
        .where((item) => item.status == 'Selesai')
        .fold<double>(0, (sum, item) => sum + item.amountValue);
    final pendingCount =
        transactions.where((item) => item.status == 'Menunggu').length;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            primaryColor,
            profileGradientEnd.withValues(alpha: 0.92),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withValues(alpha: 0.18),
            blurRadius: 18,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: colorWhite.withValues(alpha: 0.16),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(
                  Icons.receipt_long_rounded,
                  color: colorWhite,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Aktivitas Transaksi',
                      style: AppTextStyles.h6White,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Pantau pembayaran, refund, dan status pemesanan Anda.',
                      style: AppTextStyles.bodySmallWhite70,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              Expanded(
                child: _buildOverviewStat(
                  '$totalTransactions',
                  'Total transaksi',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildOverviewStat(
                  'Rp ${_formatCompactCurrency(totalPaid)}',
                  'Transaksi selesai',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildOverviewStat(
                  '$pendingCount',
                  'Menunggu bayar',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOverviewStat(String value, String label) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorWhite.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: AppTextStyles.h6White,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: AppTextStyles.bodySmallWhite70,
          ),
        ],
      ),
    );
  }

  Widget _buildFilterSection() {
    const filters = ['Semua', 'Selesai', 'Menunggu', 'Dibatalkan', 'Refund'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Filter Status',
          style: AppTextStyles.h6,
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 42,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final filter = filters[index];
              final isSelected = filter == _selectedFilter;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedFilter = filter;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: isSelected ? primaryColor : colorWhite,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: isSelected ? primaryColor : grey200,
                    ),
                  ),
                  child: Text(
                    filter,
                    style: isSelected
                        ? AppTextStyles.bodyMediumWhite
                        : AppTextStyles.bodyMedium.copyWith(color: grey700),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemCount: filters.length,
          ),
        ),
      ],
    );
  }

  Widget _buildTransactionCard(TransactionHistoryItem item) {
    final statusStyle = _statusAppearance(item.status);

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorWhite,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 14,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: statusStyle.backgroundColor,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  item.iconData,
                  color: statusStyle.foregroundColor,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: AppTextStyles.cardTitle,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.subtitle,
                      style: AppTextStyles.bodyMedium.copyWith(color: grey600),
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                decoration: BoxDecoration(
                  color: statusStyle.backgroundColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  item.status,
                  style: AppTextStyles.labelSmall.copyWith(
                    color: statusStyle.foregroundColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: grey50,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: grey200),
            ),
            child: Row(
              children: [
                Expanded(
                  child: _buildDetailItem('Tanggal', item.date),
                ),
                Expanded(
                  child: _buildDetailItem('Metode', item.paymentMethod),
                ),
                Expanded(
                  child: _buildDetailItem('Kode', item.code),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.routeOrDescription,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: grey800,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.note,
                      style: AppTextStyles.caption.copyWith(color: grey600),
                    ),
                  ],
                ),
              ),
              Text(
                item.amount,
                style: AppTextStyles.priceSmall,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.caption,
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: AppTextStyles.labelMedium.copyWith(color: grey800),
        ),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: colorWhite,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: grey200),
      ),
      child: Column(
        children: [
          const Icon(
            Icons.inbox_outlined,
            size: 40,
            color: grey400,
          ),
          const SizedBox(height: 12),
          const Text(
            'Belum ada transaksi pada filter ini',
            style: AppTextStyles.h6,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 6),
          Text(
            'Coba pilih status lain untuk melihat riwayat transaksi Anda.',
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyMedium.copyWith(color: grey600),
          ),
        ],
      ),
    );
  }

  _TransactionStatusAppearance _statusAppearance(String status) {
    switch (status) {
      case 'Selesai':
        return const _TransactionStatusAppearance(
          backgroundColor: Color(0xFFE7F8EE),
          foregroundColor: successColor,
        );
      case 'Menunggu':
        return const _TransactionStatusAppearance(
          backgroundColor: Color(0xFFFFF4E0),
          foregroundColor: Color(0xFFEE9B00),
        );
      case 'Dibatalkan':
        return const _TransactionStatusAppearance(
          backgroundColor: Color(0xFFFDECEC),
          foregroundColor: logoutColor,
        );
      case 'Refund':
        return const _TransactionStatusAppearance(
          backgroundColor: Color(0xFFEAF4FF),
          foregroundColor: infoColor,
        );
      default:
        return const _TransactionStatusAppearance(
          backgroundColor: grey100,
          foregroundColor: grey700,
        );
    }
  }

  String _formatCompactCurrency(double value) {
    if (value >= 1000000) {
      return '${(value / 1000000).toStringAsFixed(1)} Jt';
    }

    if (value >= 1000) {
      return '${(value / 1000).toStringAsFixed(0)} Rb';
    }

    return value.toStringAsFixed(0);
  }
}

class TransactionHistoryItem {
  const TransactionHistoryItem({
    required this.title,
    required this.subtitle,
    required this.status,
    required this.amount,
    required this.amountValue,
    required this.date,
    required this.paymentMethod,
    required this.code,
    required this.routeOrDescription,
    required this.note,
    required this.type,
  });

  factory TransactionHistoryItem.fromJson(Map<String, dynamic> json) {
    return TransactionHistoryItem(
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      status: json['status'] as String,
      amount: json['amount'] as String,
      amountValue: (json['amount_value'] as num).toDouble(),
      date: json['date'] as String,
      paymentMethod: json['payment_method'] as String,
      code: json['code'] as String,
      routeOrDescription: json['route_or_description'] as String,
      note: json['note'] as String,
      type: json['type'] as String,
    );
  }

  final String title;
  final String subtitle;
  final String status;
  final String amount;
  final double amountValue;
  final String date;
  final String paymentMethod;
  final String code;
  final String routeOrDescription;
  final String note;
  final String type;

  IconData get iconData {
    switch (type) {
      case 'train':
        return Icons.train_rounded;
      case 'food':
        return Icons.restaurant_rounded;
      case 'hotel':
        return Icons.hotel_rounded;
      case 'refund':
        return Icons.replay_circle_filled_rounded;
      default:
        return Icons.receipt_long_rounded;
    }
  }
}

class _TransactionStatusAppearance {
  const _TransactionStatusAppearance({
    required this.backgroundColor,
    required this.foregroundColor,
  });

  final Color backgroundColor;
  final Color foregroundColor;
}
