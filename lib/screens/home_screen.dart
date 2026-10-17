import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'upload_screen.dart';
import 'moodboard_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('TUESDAY, 14 OCT',
                          style: AppTheme.label(size: 9, spacing: 1.8)),
                      const SizedBox(height: 6),
                      Text(
                        'Good morning,\nAyesha',
                        style: AppTheme.fraunces(
                          size: 21,
                          weight: FontWeight.w500,
                          height: 1.2,
                          spacing: -0.5,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Color(0xFFA5A98B), Color(0xFF33401A)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 22),

            // Feature card (Quiet Green)
            GestureDetector(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const MoodboardScreen())),
              child: Container(
                height: 240,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFFE4E7D6), Color(0xFFBFA282)],
                    stops: [0.64, 1.0],
                  ),
                ),
                child: Stack(
                  children: [
                    // soft room shape
                    Positioned(
                      left: 40,
                      top: 60,
                      child: Container(
                        width: 80,
                        height: 120,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF7F5EC),
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 60,
                      bottom: 40,
                      child: Container(
                        width: 130,
                        height: 50,
                        decoration: BoxDecoration(
                          color: AppColors.moss,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                          ),
                        ),
                      ),
                    ),
                    // overlay
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            const Color(0xFF060D08).withOpacity(0.05),
                            const Color(0xFF060D08).withOpacity(0.78),
                          ],
                          stops: const [0.26, 1.0],
                        ),
                      ),
                    ),
                    // text
                    Positioned(
                      left: 20,
                      right: 20,
                      bottom: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("THIS WEEK'S COLLECTION",
                              style: AppTheme.label(
                                  color: Colors.white.withOpacity(0.68),
                                  size: 8.5)),
                          const SizedBox(height: 7),
                          Text('Quiet Green',
                              style: AppTheme.fraunces(
                                size: 23,
                                weight: FontWeight.w500,
                                color: Colors.white,
                                height: 1.15,
                                spacing: -0.5,
                              )),
                          const SizedBox(height: 5),
                          Text('12 rooms · 48 pieces',
                              style: AppTheme.inter(
                                  size: 10.5,
                                  color: Colors.white.withOpacity(0.72),
                                  spacing: 0.3)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Your rooms
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('YOUR ROOMS',
                    style: AppTheme.label(size: 9, spacing: 1.8)),
                Text('VIEW ALL',
                    style: AppTheme.label(
                        size: 9,
                        color: AppColors.forest,
                        spacing: 1.8)),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 160,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  _RoomCard(
                      name: 'Master Bedroom', meta: 'Japandi · 220k',
                      bg: [Color(0xFFDFD6C9), Color(0xFFBEAB92)]),
                  _RoomCard(
                      name: 'Drawing Room', meta: 'Botanical · Draft',
                      bg: [Color(0xFFE4E7D6), Color(0xFFBFA282)]),
                  _RoomCard(
                      name: 'Study', meta: 'Clay · Saved',
                      bg: [Color(0xFFEFE6DA), Color(0xFFDAC0A8)]),
                ],
              ),
            ),
            const SizedBox(height: 24),

            Container(height: 1, color: AppColors.lineSoft),
            const SizedBox(height: 20),

            // From the atelier
            Text('FROM THE ATELIER',
                style: AppTheme.label(size: 9, spacing: 1.8)),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: AppColors.line),
              ),
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 120,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFFE4E7D6), Color(0xFFBFA282)],
                        stops: [0.64, 1.0],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 14, 15, 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Why we lock the layout first',
                            style: AppTheme.fraunces(
                                size: 16, spacing: -0.3)),
                        const SizedBox(height: 7),
                        Text(
                          'A short note on structure-preserving generation and why it matters more than the style itself.',
                          style: AppTheme.inter(
                              size: 11,
                              color: AppColors.muted,
                              height: 1.62),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const UploadScreen())),
                child: const Text('Start a redesign'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RoomCard extends StatelessWidget {
  final String name;
  final String meta;
  final List<Color> bg;

  const _RoomCard({
    required this.name,
    required this.meta,
    required this.bg,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: SizedBox(
        width: 132,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 98,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: bg,
                  stops: const [0.64, 1.0],
                ),
              ),
            ),
            const SizedBox(height: 9),
            Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTheme.fraunces(size: 12.5, spacing: -0.2),
            ),
            const SizedBox(height: 3),
            Text(
              meta,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTheme.inter(
                  size: 9.5, color: AppColors.muted, spacing: 0.3),
            ),
          ],
        ),
      ),
    );
  }
}