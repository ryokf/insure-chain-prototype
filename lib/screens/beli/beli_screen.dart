import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme.dart';
import '../../core/constants.dart';
import '../../widgets/glass_card.dart';
import 'register_screen.dart';

class BeliScreen extends StatelessWidget {
  const BeliScreen({super.key});

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
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pilih Tier Perlindungan',
                        style: GoogleFonts.inter(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Lindungi kendaraan Anda dengan perlindungan komunitas Web3',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                // Discount Banner
                GlassCard(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  borderColor: AppColors.cyanAccent.withValues(alpha: 0.2),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.cyanAccent.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.discount_rounded,
                          size: 20,
                          color: AppColors.cyanAccent,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Skor Mengemudi: ${MockData.drivingScore}/100',
                              style: GoogleFonts.inter(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            Text(
                              'Anda mendapat diskon ${MockData.contributionDiscount}% kontribusi!',
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                color: AppColors.cyanAccent,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ...MockData.tiers.map(
                  (tier) => _TierCard(tier: tier, context: context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TierCard extends StatelessWidget {
  final Map<String, dynamic> tier;
  final BuildContext context;

  const _TierCard({required this.tier, required this.context});

  Color get _accentColor {
    switch (tier['color']) {
      case 'purple':
        return AppColors.purpleAccent;
      case 'gold':
        return const Color(0xFFFFD700);
      default:
        return AppColors.info;
    }
  }

  List<Color> get _gradientColors {
    switch (tier['color']) {
      case 'purple':
        return [const Color(0xFF7C3AED), AppColors.purpleAccent];
      case 'gold':
        return [const Color(0xFFD97706), const Color(0xFFFBBF24)];
      default:
        return [const Color(0xFF2563EB), const Color(0xFF60A5FA)];
    }
  }

  bool get _isPopular => tier['name'] == 'Plus';

  String _discountedPrice(String price) {
    final parsed = int.parse(price.replaceAll(',', ''));
    final discounted = (parsed * (1 - MockData.contributionDiscount / 100))
        .round();
    final formatted = discounted.toString().replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
      (m) => '${m[1]},',
    );
    return formatted;
  }

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.zero,
      borderColor: _isPopular ? _accentColor.withValues(alpha: 0.4) : null,
      child: Column(
        children: [
          // Header with gradient
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  _gradientColors[0].withValues(alpha: 0.2),
                  _gradientColors[1].withValues(alpha: 0.05),
                ],
              ),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (_isPopular)
                      Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: _gradientColors),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '⭐ POPULER',
                          style: GoogleFonts.inter(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    Text(
                      tier['name'] as String,
                      style: GoogleFonts.inter(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: _accentColor,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${tier['price']}',
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textMuted,
                        decoration: TextDecoration.lineThrough,
                        decorationColor: AppColors.textMuted,
                      ),
                    ),
                    Text(
                      _discountedPrice(tier['price'] as String),
                      style: GoogleFonts.inter(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Text(
                      'IDRT/bulan',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: AppColors.textMuted,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Features
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
            child: Column(
              children: [
                ...(tier['features'] as List<dynamic>).map(
                  (f) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.check_circle_rounded,
                          size: 18,
                          color: _accentColor,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            f as String,
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => RegisterScreen(
                        tierName: tier['name'] as String,
                        price: tier['price'] as String,
                      ),
                    ),
                  ),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: _gradientColors),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: _gradientColors[0].withValues(alpha: 0.3),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Text(
                      'Pilih Tier',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
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
}
