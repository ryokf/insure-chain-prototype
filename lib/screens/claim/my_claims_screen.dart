import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme.dart';
import '../../core/constants.dart';
import '../../widgets/glass_card.dart';
import 'status_screen.dart';

class MyClaimsScreen extends StatelessWidget {
  const MyClaimsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF0F1629), AppColors.bgDark],
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.description_rounded,
                        color: AppColors.cyanAccent,
                        size: 24,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Klaim Saya',
                        style: GoogleFonts.inter(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Tab Bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    height: 44,
                    decoration: BoxDecoration(
                      color: AppColors.surfaceLight,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TabBar(
                      indicator: BoxDecoration(
                        gradient: AppColors.primaryGradient,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.indigoPrimary.withValues(
                              alpha: 0.3,
                            ),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      indicatorSize: TabBarIndicatorSize.tab,
                      dividerColor: Colors.transparent,
                      labelColor: Colors.white,
                      labelStyle: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                      unselectedLabelColor: AppColors.textMuted,
                      unselectedLabelStyle: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                      tabs: const [
                        Tab(text: 'Klaim Aktif'),
                        Tab(text: 'Riwayat Klaim'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Tab Content
                Expanded(
                  child: TabBarView(
                    children: [_ActiveClaimsTab(), _ClaimHistoryTab()],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ── Active Claims Tab ──
class _ActiveClaimsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final claims = MockData.activeClaims;
    if (claims.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.check_circle_outline_rounded,
              size: 64,
              color: AppColors.textMuted.withValues(alpha: 0.4),
            ),
            const SizedBox(height: 12),
            Text(
              'Tidak ada klaim aktif',
              style: GoogleFonts.inter(
                fontSize: 16,
                color: AppColors.textMuted,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 20),
      itemCount: claims.length,
      itemBuilder: (context, index) => _ActiveClaimCard(claim: claims[index]),
    );
  }
}

// ── Active Claim Card with Tracker ──
class _ActiveClaimCard extends StatelessWidget {
  final Map<String, dynamic> claim;

  const _ActiveClaimCard({required this.claim});

  static const List<Map<String, dynamic>> _steps = [
    {
      'title': 'Laporan Diterima',
      'subtitle': 'Foto & kronologi diterima sistem',
      'icon': Icons.receipt_long_rounded,
    },
    {
      'title': 'Dianalisis AI',
      'subtitle': 'Computer Vision memverifikasi bukti',
      'icon': Icons.smart_toy_rounded,
    },
    {
      'title': 'Voting DAO Juri',
      'subtitle': 'Dewan Guardian deliberasi klaim',
      'icon': Icons.gavel_rounded,
    },
    {
      'title': 'Dana Dicairkan',
      'subtitle': 'Transfer otomatis ke wallet',
      'icon': Icons.account_balance_wallet_rounded,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final currentStep = claim['currentStep'] as int;

    return GlassCard(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.all(18),
      borderColor: AppColors.indigoPrimary.withValues(alpha: 0.15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Claim header
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.circular(13),
                ),
                child: const Icon(
                  Icons.receipt_long_rounded,
                  color: Colors.white,
                  size: 22,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Klaim ${claim['claimId']}',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.warning.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            'Proses',
                            style: GoogleFonts.inter(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: AppColors.warning,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${claim['vehicle']} · ${claim['type']}',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: AppColors.textMuted,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // ── Claim Tracker (e-commerce style) ──
          ...List.generate(_steps.length, (i) {
            final step = _steps[i];
            final isCompleted = i < currentStep;
            final isActive = i == currentStep;
            final isPending = i > currentStep;
            final isLast = i == _steps.length - 1;

            final dotColor = isCompleted
                ? AppColors.success
                : isActive
                ? AppColors.cyanAccent
                : AppColors.textMuted;

            return IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Timeline column
                  SizedBox(
                    width: 32,
                    child: Column(
                      children: [
                        Container(
                          width: 26,
                          height: 26,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isPending
                                ? AppColors.surfaceLight
                                : dotColor.withValues(alpha: 0.2),
                            border: Border.all(color: dotColor, width: 2),
                          ),
                          child: isCompleted
                              ? Icon(
                                  Icons.check_rounded,
                                  size: 14,
                                  color: dotColor,
                                )
                              : isActive
                              ? Container(
                                  margin: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: dotColor,
                                  ),
                                )
                              : null,
                        ),
                        if (!isLast)
                          Expanded(
                            child: Container(
                              width: 2,
                              margin: const EdgeInsets.symmetric(vertical: 2),
                              color: isCompleted
                                  ? dotColor.withValues(alpha: 0.4)
                                  : AppColors.surfaceLight,
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Step content
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: isLast ? 0 : 18),
                      child: Row(
                        children: [
                          Icon(
                            step['icon'] as IconData,
                            size: 16,
                            color: isPending ? AppColors.textMuted : dotColor,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  step['title'] as String,
                                  style: GoogleFonts.inter(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: isPending
                                        ? AppColors.textMuted
                                        : AppColors.textPrimary,
                                  ),
                                ),
                                Text(
                                  step['subtitle'] as String,
                                  style: GoogleFonts.inter(
                                    fontSize: 11,
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (isActive)
                            Text(
                              'Berlangsung',
                              style: GoogleFonts.inter(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: AppColors.cyanAccent,
                              ),
                            ),
                          if (isCompleted)
                            Icon(
                              Icons.check_circle_rounded,
                              size: 16,
                              color: AppColors.success,
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),

          const SizedBox(height: 16),

          // Bottom row: estimated time + detail button
          Row(
            children: [
              Icon(Icons.timer_rounded, size: 16, color: AppColors.warning),
              const SizedBox(width: 6),
              Text(
                'Est. ${claim['estimatedTime']}',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const StatusScreen()),
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    gradient: AppColors.primaryGradient,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.indigoPrimary.withValues(alpha: 0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Text(
                    'Lihat Detail',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ── Claim History Tab ──
class _ClaimHistoryTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final claims = MockData.claimHistory;
    if (claims.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.history_rounded,
              size: 64,
              color: AppColors.textMuted.withValues(alpha: 0.4),
            ),
            const SizedBox(height: 12),
            Text(
              'Belum ada riwayat klaim',
              style: GoogleFonts.inter(
                fontSize: 16,
                color: AppColors.textMuted,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 20),
      itemCount: claims.length,
      itemBuilder: (context, index) => _HistoryClaimCard(claim: claims[index]),
    );
  }
}

// ── History Claim Card ──
class _HistoryClaimCard extends StatelessWidget {
  final Map<String, dynamic> claim;

  const _HistoryClaimCard({required this.claim});

  @override
  Widget build(BuildContext context) {
    final result = claim['result'] as String;
    final isApproved = result == 'Disetujui';
    final resultColor = isApproved ? AppColors.success : AppColors.danger;
    final resultIcon = isApproved
        ? Icons.check_circle_rounded
        : Icons.cancel_rounded;

    return GlassCard(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          // Result icon
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: resultColor.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Icon(resultIcon, color: resultColor, size: 24),
          ),
          const SizedBox(width: 14),
          // Claim info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Klaim ${claim['claimId']}',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: resultColor.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        result,
                        style: GoogleFonts.inter(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: resultColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  '${claim['vehicle']} · ${claim['type']}',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: AppColors.textMuted,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  claim['date'] as String,
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    color: AppColors.textMuted,
                  ),
                ),
              ],
            ),
          ),
          // Amount
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                isApproved ? '+${claim['amount']}' : claim['amount'] as String,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: isApproved ? AppColors.success : AppColors.textMuted,
                ),
              ),
              Text(
                'IDRT',
                style: GoogleFonts.inter(
                  fontSize: 11,
                  color: AppColors.textMuted,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
