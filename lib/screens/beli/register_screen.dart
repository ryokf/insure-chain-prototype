import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme.dart';
import '../../core/constants.dart';
import '../../widgets/glass_card.dart';

class RegisterScreen extends StatefulWidget {
  final String tierName;
  final String price;

  const RegisterScreen({
    super.key,
    required this.tierName,
    required this.price,
  });

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _merekController = TextEditingController();
  final _modelController = TextEditingController();
  final _platController = TextEditingController();
  bool _photoTaken = false;

  @override
  void dispose() {
    _merekController.dispose();
    _modelController.dispose();
    _platController.dispose();
    super.dispose();
  }

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
                      'Registrasi Kendaraan',
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
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      // Form inputs
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Data Kendaraan',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      _InputField(
                        label: 'Merek',
                        hint: 'Contoh: Toyota',
                        controller: _merekController,
                      ),
                      _InputField(
                        label: 'Model',
                        hint: 'Contoh: Avanza 1.5 G',
                        controller: _modelController,
                      ),
                      _InputField(
                        label: 'Pelat Nomor',
                        hint: 'Contoh: B 1234 ABC',
                        controller: _platController,
                      ),
                      const SizedBox(height: 24),
                      // Baseline Photo
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Foto Acuan (Baseline)',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Ambil foto mobil dalam kondisi mulus sebagai acuan',
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            color: AppColors.textMuted,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      GlassCard(
                        onTap: () => setState(() => _photoTaken = true),
                        padding: const EdgeInsets.all(32),
                        borderColor: _photoTaken
                            ? AppColors.success.withValues(alpha: 0.3)
                            : AppColors.indigoPrimary.withValues(alpha: 0.2),
                        child: Column(
                          children: [
                            Icon(
                              _photoTaken
                                  ? Icons.check_circle_rounded
                                  : Icons.camera_alt_rounded,
                              size: 48,
                              color: _photoTaken
                                  ? AppColors.success
                                  : AppColors.textMuted,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              _photoTaken
                                  ? 'Foto berhasil diambil!'
                                  : 'Ketuk untuk mengambil foto',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: _photoTaken
                                    ? AppColors.success
                                    : AppColors.textSecondary,
                              ),
                            ),
                            if (_photoTaken) ...[
                              const SizedBox(height: 4),
                              Text(
                                '4 foto telah disimpan',
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  color: AppColors.textMuted,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      // Checkout
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Rincian Membership Contribution',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      GlassCard(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            _CheckoutRow(
                              label: 'Kontribusi ${widget.tierName}',
                              value: '${widget.price} IDRT',
                            ),
                            const Divider(
                              color: AppColors.surfaceLight,
                              height: 24,
                            ),
                            _CheckoutRow(
                              label:
                                  'Diskon Skor (${MockData.contributionDiscount}%)',
                              value: '-${_discountAmount()} IDRT',
                              valueColor: AppColors.success,
                            ),
                            const Divider(
                              color: AppColors.surfaceLight,
                              height: 24,
                            ),
                            _CheckoutRow(
                              label: 'Biaya Admin',
                              value: '25,000 IDRT',
                            ),
                            const Divider(
                              color: AppColors.surfaceLight,
                              height: 24,
                            ),
                            _CheckoutRow(
                              label: 'Total',
                              value: _calculateTotal(),
                              isBold: true,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Pay button
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: GestureDetector(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Kontribusi Web3 dikonfirmasi!',
                                  style: GoogleFonts.inter(),
                                ),
                                backgroundColor: AppColors.success,
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            );
                            Future.delayed(const Duration(seconds: 1), () {
                              if (context.mounted) Navigator.pop(context);
                            });
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            decoration: BoxDecoration(
                              gradient: AppColors.primaryGradient,
                              borderRadius: BorderRadius.circular(14),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.indigoPrimary.withValues(
                                    alpha: 0.3,
                                  ),
                                  blurRadius: 16,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.lock_rounded,
                                  size: 18,
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Konfirmasi Kontribusi Web3',
                                  style: GoogleFonts.inter(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
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

  String _calculateTotal() {
    final price = int.parse(widget.price.replaceAll(',', ''));
    final discount = (price * (MockData.contributionDiscount / 100)).round();
    final total = price - discount + 25000;
    final formatted = total.toString().replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
      (m) => '${m[1]},',
    );
    return '$formatted IDRT';
  }

  String _discountAmount() {
    final price = int.parse(widget.price.replaceAll(',', ''));
    final discount = (price * (MockData.contributionDiscount / 100)).round();
    final formatted = discount.toString().replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
      (m) => '${m[1]},',
    );
    return formatted;
  }
}

class _InputField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;

  const _InputField({
    required this.label,
    required this.hint,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 6),
          TextField(
            controller: controller,
            style: GoogleFonts.inter(
              fontSize: 15,
              color: AppColors.textPrimary,
            ),
            decoration: InputDecoration(hintText: hint),
          ),
        ],
      ),
    );
  }
}

class _CheckoutRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isBold;
  final Color? valueColor;

  const _CheckoutRow({
    required this.label,
    required this.value,
    this.isBold = false,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: isBold ? FontWeight.w700 : FontWeight.w400,
            color: isBold ? AppColors.textPrimary : AppColors.textSecondary,
          ),
        ),
        Text(
          value,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: isBold ? FontWeight.w700 : FontWeight.w500,
            color:
                valueColor ??
                (isBold ? AppColors.cyanAccent : AppColors.textPrimary),
          ),
        ),
      ],
    );
  }
}
