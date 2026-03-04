class MockData {
  static const List<Map<String, dynamic>> vehicles = [
    {
      'brand': 'Toyota',
      'model': 'Avanza 1.5 G',
      'plate': 'B 1234 ABC',
      'tier': 'Premium',
      'year': '2023',
      'premium': '1,200,000',
      'startDate': '1 Jan 2026',
      'endDate': '1 Jan 2027',
      'daysLeft': 304,
      'coverage': '200 Juta',
    },
    {
      'brand': 'Honda',
      'model': 'HR-V SE',
      'plate': 'B 5678 DEF',
      'tier': 'Plus',
      'year': '2022',
      'premium': '850,000',
      'startDate': '15 Mar 2026',
      'endDate': '15 Mar 2027',
      'daysLeft': 377,
      'coverage': '100 Juta',
    },
    {
      'brand': 'Suzuki',
      'model': 'Ertiga GX',
      'plate': 'D 9012 GHI',
      'tier': 'Basic',
      'year': '2024',
      'premium': '500,000',
      'startDate': '1 Feb 2026',
      'endDate': '1 Feb 2027',
      'daysLeft': 335,
      'coverage': '50 Juta',
    },
  ];

  static const List<Map<String, dynamic>> transactions = [
    {
      'type': 'deposit',
      'label': 'Deposit IDRT',
      'amount': '+500,000',
      'date': '28 Feb 2026',
      'positive': true,
    },
    {
      'type': 'premium',
      'label': 'Kontribusi Keanggotaan',
      'amount': '-1,200,000',
      'date': '25 Feb 2026',
      'positive': false,
    },
    {
      'type': 'claim',
      'label': 'Community Aid #0042',
      'amount': '+15,000,000',
      'date': '20 Feb 2026',
      'positive': true,
    },
    {
      'type': 'withdraw',
      'label': 'Tarik ke Wallet',
      'amount': '-2,000,000',
      'date': '15 Feb 2026',
      'positive': false,
    },
    {
      'type': 'deposit',
      'label': 'Deposit IDRT',
      'amount': '+1,000,000',
      'date': '10 Feb 2026',
      'positive': true,
    },
    {
      'type': 'yield',
      'label': 'Yield Reward',
      'amount': '+35,200',
      'date': '01 Feb 2026',
      'positive': true,
    },
  ];

  static const List<Map<String, dynamic>> notifications = [
    {
      'title': 'Protection Status Akan Berakhir',
      'body':
          'Perlindungan kendaraan B 1234 ABC akan berakhir dalam 7 hari. Perpanjang sekarang.',
      'time': '2 jam lalu',
      'read': false,
      'type': 'warning',
    },
    {
      'title': 'Undangan Guardian',
      'body':
          'Anda terpilih sebagai Guardian untuk permohonan #0058. Bergabunglah ke Ruang Sidang.',
      'time': '5 jam lalu',
      'read': false,
      'type': 'jury',
    },
    {
      'title': 'Permohonan Disetujui',
      'body':
          'Permohonan bantuan #0042 telah disetujui oleh Dewan Guardian. Community Aid sedang ditransfer.',
      'time': '1 hari lalu',
      'read': true,
      'type': 'success',
    },
    {
      'title': 'Skor Mengemudi Naik',
      'body':
          'Selamat! Skor mengemudi Anda naik menjadi 87. Terus pertahankan!',
      'time': '2 hari lalu',
      'read': true,
      'type': 'info',
    },
    {
      'title': 'Deposit Berhasil',
      'body':
          'Deposit 500,000 IDRT ke wallet Anda telah berhasil dikonfirmasi.',
      'time': '3 hari lalu',
      'read': true,
      'type': 'success',
    },
  ];

  static const List<Map<String, dynamic>> tiers = [
    {
      'name': 'Basic',
      'price': '500,000',
      'color': 'blue',
      'features': [
        'Perlindungan tabrakan dasar',
        'Batas bantuan 50 juta',
        'Respon 48 jam',
      ],
    },
    {
      'name': 'Plus',
      'price': '850,000',
      'color': 'purple',
      'features': [
        'Perlindungan tabrakan + banjir',
        'Batas bantuan 100 juta',
        'Respon 24 jam',
        'Mobil pengganti',
      ],
    },
    {
      'name': 'Premium',
      'price': '1,200,000',
      'color': 'gold',
      'features': [
        'All-risk protection',
        'Batas bantuan 200 juta',
        'Respon instan',
        'Mobil pengganti',
        'Concierge 24/7',
        'Yield bonus 2%',
      ],
    },
  ];

  static const List<Map<String, dynamic>> chatMessages = [
    {
      'sender': 'Guardian_Andi',
      'message':
          'Dari foto kecelakaan, kerusakan di bumper depan cukup parah. Konsisten dengan tabrakan depan.',
      'time': '14:32',
      'isMe': false,
    },
    {
      'sender': 'Guardian_Siti',
      'message':
          'Saya setuju. Foto acuan menunjukkan mobil dalam kondisi mulus. Kerusakan jelas baru terjadi.',
      'time': '14:35',
      'isMe': false,
    },
    {
      'sender': 'Anda',
      'message':
          'AI Gemini juga mengkonfirmasi kesesuaian antara deskripsi kronologi dan bukti foto. Saya vote Approve.',
      'time': '14:38',
      'isMe': true,
    },
    {
      'sender': 'Guardian_Budi',
      'message':
          'Lokasi GPS korban juga cocok dengan laporan saksi Pathfinder. Approve dari saya.',
      'time': '14:40',
      'isMe': false,
    },
  ];

  static const List<Map<String, dynamic>> activeClaims = [
    {
      'claimId': '#0059',
      'vehicle': 'Toyota Avanza 1.5 G',
      'plate': 'B 1234 ABC',
      'type': 'Tabrakan Depan',
      'currentStep': 2,
      'estimatedTime': '2-4 jam',
      'amount': '15,000,000',
      'date': '3 Mar 2026',
    },
    {
      'claimId': '#0061',
      'vehicle': 'Honda HR-V SE',
      'plate': 'B 5678 DEF',
      'type': 'Kerusakan Banjir',
      'currentStep': 1,
      'estimatedTime': '4-6 jam',
      'amount': '8,500,000',
      'date': '2 Mar 2026',
    },
  ];

  static const List<Map<String, dynamic>> claimHistory = [
    {
      'claimId': '#0042',
      'vehicle': 'Toyota Avanza 1.5 G',
      'plate': 'B 1234 ABC',
      'type': 'Tabrakan Belakang',
      'result': 'Disetujui',
      'amount': '15,000,000',
      'date': '20 Feb 2026',
    },
    {
      'claimId': '#0035',
      'vehicle': 'Honda HR-V SE',
      'plate': 'B 5678 DEF',
      'type': 'Goresan Bodi',
      'result': 'Ditolak',
      'amount': '3,200,000',
      'date': '5 Jan 2026',
    },
    {
      'claimId': '#0028',
      'vehicle': 'Suzuki Ertiga GX',
      'plate': 'D 9012 GHI',
      'type': 'Pecah Kaca',
      'result': 'Disetujui',
      'amount': '4,800,000',
      'date': '15 Dec 2025',
    },
  ];

  static const List<Map<String, dynamic>> activeDeliberations = [
    {
      'claimId': '#0058',
      'vehicle': 'Toyota Avanza 1.5 G',
      'type': 'Tabrakan Depan',
      'jurors': 5,
      'votedJurors': 3,
      'status': 'Voting',
      'timeLeft': '2 jam',
    },
    {
      'claimId': '#0061',
      'vehicle': 'Honda Civic RS',
      'type': 'Kerusakan Banjir',
      'jurors': 5,
      'votedJurors': 1,
      'status': 'Diskusi',
      'timeLeft': '18 jam',
    },
    {
      'claimId': '#0063',
      'vehicle': 'Daihatsu Xenia',
      'type': 'Pencurian',
      'jurors': 7,
      'votedJurors': 0,
      'status': 'Baru',
      'timeLeft': '23 jam',
    },
  ];

  static const String walletAddress = '0x7a3f...b92c';
  static const String idrtBalance = '2,450,000';
  static const String insIdrtBalance = '1,200,000';
  static const int drivingScore = 87;
  static const int contributionDiscount = 13; // Based on driving score 87

  // AI Anti-Spoofing Result (Fase 2)
  static const Map<String, dynamic> antiSpoofingResult = {
    'confidenceScore': 92,
    'classification': 'Tabrakan Asli',
    'gForce': 4.8,
    'sensorStatus': 'Verified',
    'rejectionReason': null, // null = valid, otherwise string reason
  };

  // AI Executive Summary (Fase 4 — Gemini Output)
  static const Map<String, dynamic> aiExecutiveSummary = {
    'kronologi':
        '14:22 — Korban melaju dengan kecepatan 35 km/h di Jl. Sudirman arah selatan. '
        '14:23 — Kendaraan lain (plat B 9876 XYZ) keluar dari gang tanpa melihat kanan-kiri. '
        '14:23 — Tabrakan terjadi di sisi bumper depan kiri. '
        '14:25 — Korban mengaktifkan laporan melalui aplikasi InsureChain.',
    'severity': 'Sedang',
    'severityScore': 6.5,
    'inconsistencies': [
      'Saksi A menyebut tabrakan dari kanan, namun foto menunjukkan kerusakan di sisi kiri — kemungkinan perbedaan perspektif.',
    ],
    'confidenceScore': 88,
    'pathfinderVerified': 3, // jumlah saksi yang memverifikasi
    'pathfinderTotal': 4,
    'sensorMatch': true,
    'recommendation': 'LAYAK DISETUJUI',
  };
}
