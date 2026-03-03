import 'package:flutter/material.dart';
import '../widgets/bottom_nav.dart';
import 'home/home_screen.dart';
import 'claim/my_claims_screen.dart';
import 'wallet/wallet_screen.dart';
import 'beli/beli_screen.dart';
import 'setting/setting_screen.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    MyClaimsScreen(),
    WalletScreen(),
    BeliScreen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: BottomNav(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
