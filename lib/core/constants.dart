class MockData {
  static const List<Map<String, String>> vehicles = [
    {
      'brand': 'Toyota',
      'model': 'Avanza 1.5 G',
      'plate': 'B 1234 ABC',
      'tier': 'Premium',
      'year': '2023',
    },
    {
      'brand': 'Honda',
      'model': 'HR-V SE',
      'plate': 'B 5678 DEF',
      'tier': 'Plus',
      'year': '2022',
    },
    {
      'brand': 'Suzuki',
      'model': 'Ertiga GX',
      'plate': 'D 9012 GHI',
      'tier': 'Basic',
      'year': '2024',
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
      'label': 'Bayar Iuran Premium',
      'amount': '-1,200,000',
      'date': '25 Feb 2026',
      'positive': false,
    },
    {
      'type': 'claim',
      'label': 'Terima Klaim #0042',
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
      'title': 'Polis Akan Berakhir',
      'body':
          'Polis kendaraan B 1234 ABC akan berakhir dalam 7 hari. Perpanjang sekarang.',
      'time': '2 jam lalu',
      'read': false,
      'type': 'warning',
    },
    {
      'title': 'Undangan Juri',
      'body':
          'Anda terpilih sebagai juri untuk klaim #0058. Bergabunglah ke Ruang Sidang.',
      'time': '5 jam lalu',
      'read': false,
      'type': 'jury',
    },
    {
      'title': 'Klaim Disetujui',
      'body':
          'Klaim #0042 telah disetujui oleh Dewan Guardian. Dana sedang ditransfer.',
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
        'Batas klaim 50 juta',
        'Respon 48 jam',
      ],
    },
    {
      'name': 'Plus',
      'price': '850,000',
      'color': 'purple',
      'features': [
        'Perlindungan tabrakan + banjir',
        'Batas klaim 100 juta',
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
        'Batas klaim 200 juta',
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

  static const List<Map<String, dynamic>> activePolicies = [
    {
      'vehicle': 'Toyota Avanza 1.5 G',
      'plate': 'B 1234 ABC',
      'tier': 'Premium',
      'premium': '1,200,000',
      'startDate': '1 Jan 2026',
      'endDate': '1 Jan 2027',
      'daysLeft': 304,
      'coverage': '200 Juta',
    },
    {
      'vehicle': 'Honda HR-V SE',
      'plate': 'B 5678 DEF',
      'tier': 'Plus',
      'premium': '850,000',
      'startDate': '15 Mar 2026',
      'endDate': '15 Mar 2027',
      'daysLeft': 377,
      'coverage': '100 Juta',
    },
    {
      'vehicle': 'Suzuki Ertiga GX',
      'plate': 'D 9012 GHI',
      'tier': 'Basic',
      'premium': '500,000',
      'startDate': '1 Feb 2026',
      'endDate': '1 Feb 2027',
      'daysLeft': 335,
      'coverage': '50 Juta',
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
}
