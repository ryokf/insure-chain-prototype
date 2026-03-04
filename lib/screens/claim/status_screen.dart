import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme.dart';
import '../../core/constants.dart';
import '../../widgets/glass_card.dart';
import '../deliberation/deliberation_screen.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                padding: const EdgeInsets.fromLTRB(8, 8, 20, 0),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back_rounded,
                        color: AppColors.textPrimary,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Text(
                      'Status Permohonan',
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(0, 24, 0, 20),
                  child: Column(
                    children: [
                      // Claim ID
                      GlassCard(
                        padding: const EdgeInsets.all(20),
                        borderColor: AppColors.indigoPrimary.withValues(
                          alpha: 0.2,
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                gradient: AppColors.primaryGradient,
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: const Icon(
                                Icons.receipt_long_rounded,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Permohonan #0059',
                                    style: GoogleFonts.inter(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                  Text(
                                    'Toyota Avanza · B 1234 ABC',
                                    style: GoogleFonts.inter(
                                      fontSize: 13,
                                      color: AppColors.textMuted,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      // AI Anti-Spoofing Card
                      GlassCard(
                        padding: const EdgeInsets.all(16),
                        borderColor: AppColors.success.withValues(alpha: 0.15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.success.withValues(
                                      alpha: 0.15,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.verified_user_rounded,
                                        size: 12,
                                        color: AppColors.success,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        'Anti-Spoofing',
                                        style: GoogleFonts.inter(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.success,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  'Confidence: ${MockData.antiSpoofingResult['confidenceScore']}%',
                                  style: GoogleFonts.inter(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.success,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                _InfoChip(
                                  label: 'G-Force',
                                  value:
                                      '${MockData.antiSpoofingResult['gForce']}g',
                                ),
                                const SizedBox(width: 8),
                                _InfoChip(
                                  label: 'Klasifikasi',
                                  value:
                                      MockData.antiSpoofingResult['classification']
                                          as String,
                                ),
                                const SizedBox(width: 8),
                                _InfoChip(
                                  label: 'Sensor',
                                  value:
                                      MockData.antiSpoofingResult['sensorStatus']
                                          as String,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Step tracker
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Text(
                              'Progres Permohonan',
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
                                color: AppColors.warning.withValues(
                                  alpha: 0.15,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                'Fase 4/6',
                                style: GoogleFonts.inter(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.warning,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      _StepItem(
                        title: 'Laporan & Deteksi AI',
                        subtitle:
                            'Sensor G-Force + AI Anti-Spoofing memvalidasi insiden (Confidence: 92%)',
                        time: '14:23',
                        status: _StepStatus.completed,
                        icon: Icons.sensors_rounded,
                      ),
                      _StepItem(
                        title: 'Verifikasi Pathfinder',
                        subtitle:
                            '3 dari 4 saksi Tier 1 di sekitar lokasi mengkonfirmasi kecelakaan',
                        time: '14:35',
                        status: _StepStatus.completed,
                        icon: Icons.people_alt_rounded,
                      ),
                      _StepItem(
                        title: 'Masa Tenang & Sintesis AI',
                        subtitle:
                            'Gemini menghasilkan AI Executive Summary — kronologi, keparahan, inkonsistensi',
                        time: '15:25',
                        status: _StepStatus.completed,
                        icon: Icons.smart_toy_rounded,
                      ),
                      _StepItem(
                        title: 'Investigasi Guardian',
                        subtitle:
                            '5 Guardian terpilih membahas di Deliberation Room berdasarkan AI Summary',
                        time: 'Berlangsung',
                        status: _StepStatus.active,
                        icon: Icons.gavel_rounded,
                      ),
                      _StepItem(
                        title: 'Konsensus & Schelling Point',
                        subtitle:
                            'Voting mayoritas menentukan hasil. Guardian mayoritas terima reward.',
                        time: '-',
                        status: _StepStatus.pending,
                        icon: Icons.how_to_vote_rounded,
                      ),
                      _StepItem(
                        title: 'Community Aid Ditransfer',
                        subtitle:
                            'Jika disetujui, smart contract otomatis transfer dana ke wallet korban',
                        time: '-',
                        status: _StepStatus.pending,
                        isLast: true,
                        icon: Icons.account_balance_wallet_rounded,
                      ),
                      const SizedBox(height: 24),
                      // Estimated time
                      GlassCard(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Icon(
                              Icons.timer_rounded,
                              size: 20,
                              color: AppColors.warning,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                'Estimasi waktu: 2-4 jam',
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Link to deliberation
                      GlassCard(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const DeliberationScreen(),
                          ),
                        ),
                        padding: const EdgeInsets.all(16),
                        borderColor: AppColors.purpleAccent.withValues(
                          alpha: 0.2,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.gavel_rounded,
                              size: 20,
                              color: AppColors.purpleAccent,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                'Lihat Ruang Sidang Guardian',
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.purpleAccent,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.chevron_right_rounded,
                              color: AppColors.purpleAccent,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Info Chip ──
class _InfoChip extends StatelessWidget {
  final String label;
  final String value;
  const _InfoChip({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: BoxDecoration(
          color: AppColors.surfaceLight,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 10,
                color: AppColors.textMuted,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              value,
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

enum _StepStatus { completed, active, pending }

class _StepItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;
  final _StepStatus status;
  final bool isLast;
  final IconData icon;

  const _StepItem({
    required this.title,
    required this.subtitle,
    required this.time,
    required this.status,
    this.isLast = false,
    required this.icon,
  });

  Color get _dotColor {
    switch (status) {
      case _StepStatus.completed:
        return AppColors.success;
      case _StepStatus.active:
        return AppColors.cyanAccent;
      case _StepStatus.pending:
        return AppColors.textMuted;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Timeline
            Column(
              children: [
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: status == _StepStatus.pending
                        ? AppColors.surfaceLight
                        : _dotColor.withValues(alpha: 0.2),
                    border: Border.all(color: _dotColor, width: 2),
                  ),
                  child: status == _StepStatus.completed
                      ? Icon(Icons.check_rounded, size: 16, color: _dotColor)
                      : status == _StepStatus.active
                      ? Container(
                          margin: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _dotColor,
                          ),
                        )
                      : null,
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      color: status == _StepStatus.completed
                          ? _dotColor.withValues(alpha: 0.4)
                          : AppColors.surfaceLight,
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 14),
            // Content
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(bottom: isLast ? 0 : 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          icon,
                          size: 16,
                          color: status == _StepStatus.pending
                              ? AppColors.textMuted
                              : _dotColor,
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            title,
                            style: GoogleFonts.inter(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: status == _StepStatus.pending
                                  ? AppColors.textMuted
                                  : AppColors.textPrimary,
                            ),
                          ),
                        ),
                        Text(
                          time,
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: status == _StepStatus.active
                                ? AppColors.cyanAccent
                                : AppColors.textMuted,
                            fontWeight: status == _StepStatus.active
                                ? FontWeight.w600
                                : FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        color: AppColors.textSecondary,
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
