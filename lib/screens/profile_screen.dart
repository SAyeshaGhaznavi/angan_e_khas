import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'moodboard_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero
            Stack(
              children: [
                Container(
                  height: 190,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFF1D2A10), Color(0xFF595D2B)],
                    ),
                  ),
                ),
                Positioned(
                  top: -70,
                  right: -50,
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.055),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -70,
                  left: -50,
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: AppColors.amber.withOpacity(0.12),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(22, 26, 22, 20),
                    child: Row(
                      children: [
                        Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Colors.white.withOpacity(0.42),
                                width: 1.5),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Ayesha Arshad',
                                style: AppTheme.fraunces(
                                  size: 22,
                                  weight: FontWeight.w500,
                                  color: Colors.white,
                                  spacing: -0.5,
                                )),
                            const SizedBox(height: 6),
                            Text('LAHORE · SINCE 2025',
                                style: AppTheme.inter(
                                  size: 10,
                                  weight: FontWeight.w500,
                                  color: Colors.white.withOpacity(0.68),
                                  spacing: 1.4,
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // Stats card overlapping
            Transform.translate(
              offset: const Offset(0, -34),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: AppColors.line),
                  ),
                  child: Row(
                    children: [
                      _stat('07', 'ROOMS'),
                      _divider(),
                      _stat('03', 'BOARDS'),
                      _divider(),
                      _stat('12', 'SAVED'),
                    ],
                  ),
                ),
              ),
            ),

            Transform.translate(
              offset: const Offset(0, -8),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('RECENT ROOMS',
                            style: AppTheme.label(size: 9, spacing: 1.8)),
                        Text('SEE ALL',
                            style: AppTheme.label(
                                color: AppColors.forest,
                                size: 9,
                                spacing: 1.8)),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        _roomThumb(
                            'Bedroom',
                            const [Color(0xFFE4E7D6), Color(0xFFBFA282)]),
                        const SizedBox(width: 10),
                        _roomThumb(
                            'Lounge',
                            const [Color(0xFFDFD6C9), Color(0xFFBEAB92)]),
                        const SizedBox(width: 10),
                        _roomThumb(
                            'Study',
                            const [Color(0xFFEFE6DA), Color(0xFFDAC0A8)]),
                      ],
                    ),
                    const SizedBox(height: 26),

                    _listTile(context, Icons.bookmark_border, 'Saved pieces'),
                    _listTile(context, Icons.storefront_outlined,
                        'My listings'),
                    _listTile(context, Icons.notifications_none,
                        'Notifications'),
                    _listTile(context, Icons.tune, 'Preferences'),
                    _listTile(context, Icons.info_outline,
                        'About Angan-e-Khas'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _stat(String num, String label) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          children: [
            Text(num,
                style: AppTheme.fraunces(
                  size: 21,
                  weight: FontWeight.w500,
                  color: AppColors.forest,
                  spacing: -0.5,
                )),
            const SizedBox(height: 3),
            Text(label,
                style: AppTheme.label(size: 9, spacing: 1.1)),
          ],
        ),
      ),
    );
  }

  Widget _divider() =>
      Container(width: 1, height: 32, color: AppColors.lineSoft);

  Widget _roomThumb(String label, List<Color> bg) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 76,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: bg,
                stops: const [0.64, 1.0],
              ),
            ),
          ),
          const SizedBox(height: 7),
          Text(label,
              style: AppTheme.fraunces(size: 10, spacing: -0.2)),
        ],
      ),
    );
  }

  Widget _listTile(BuildContext context, IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 13),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: AppColors.sagePale,
              borderRadius: BorderRadius.circular(11),
            ),
            child: Icon(icon, size: 16, color: AppColors.forest),
          ),
          const SizedBox(width: 14),
          Text(label,
              style: AppTheme.inter(
                  size: 12.5, weight: FontWeight.w500)),
          const Spacer(),
          const Icon(Icons.chevron_right,
              color: AppColors.faint, size: 18),
        ],
      ),
    );
  }
}