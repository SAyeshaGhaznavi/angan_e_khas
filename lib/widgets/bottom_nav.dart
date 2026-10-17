import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../screens/home_screen.dart';
import '../screens/marketplace_screen.dart';
import '../screens/community_screen.dart';
import '../screens/profile_screen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    MarketplaceScreen(),
    CommunityScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.cream,
      body: Stack(
        children: [
          IndexedStack(index: _currentIndex, children: _screens),
          // Floating pill nav
          Positioned(
            left: 16,
            right: 16,
            bottom: 14,
            child: Container(
              height: 62,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.94),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF060D08).withOpacity(0.20),
                    blurRadius: 28,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Row(
                children: [
                  _navItem(0, Icons.home_outlined, 'Home'),
                  _navItem(1, Icons.storefront_outlined, 'Shop'),
                  _navItem(2, Icons.menu_book_outlined, 'Journal'),
                  _navItem(3, Icons.person_outline, 'Me'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _navItem(int idx, IconData icon, String label) {
    final active = idx == _currentIndex;
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => setState(() => _currentIndex = idx),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: active ? AppColors.terracotta : const Color(0xFFE5E6DB),
                borderRadius: BorderRadius.circular(7),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: AppTheme.inter(
                size: 8.5,
                weight: FontWeight.w600,
                color: active ? AppColors.terracotta : AppColors.faint,
                spacing: 0.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}