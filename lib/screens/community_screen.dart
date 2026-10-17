import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('The Journal',
                style: AppTheme.fraunces(
                    size: 21,
                    weight: FontWeight.w500,
                    spacing: -0.5)),
            const SizedBox(height: 20),

            // Segment tabs
            Row(
              children: [
                _seg('Feed', true),
                _seg('Advice', false),
                _seg('Saved', false),
              ],
            ),
            const SizedBox(height: 8),
            Container(height: 1, color: AppColors.lineSoft),
            const SizedBox(height: 20),

            // Post 1
            _post(
              name: 'Hina R.',
              time: '2 hours ago',
              tag: '94 LOCK',
              tagWarm: false,
              title:
              'A small bedroom that finally feels like it breathes',
              sub:
              'Kept the original window placement and worked the whole scheme around it.',
              bg: const [Color(0xFFE4E7D6), Color(0xFFBFA282)],
              avatarColors: const [Color(0xFFA5A98B), Color(0xFF33401A)],
            ),
            const SizedBox(height: 20),

            // Post 2
            _post(
              name: 'Bilal K.',
              time: '5 hours ago',
              tag: 'ADVICE',
              tagWarm: true,
              title: 'Not sure about the rug placement — any thoughts?',
              sub: null,
              bg: const [Color(0xFFDFD6C9), Color(0xFFBEAB92)],
              avatarColors: const [Color(0xFFB8906E), Color(0xFF7B4A2A)],
            ),
          ],
        ),
      ),
    );
  }

  Widget _seg(String text, bool on) {
    return Padding(
      padding: const EdgeInsets.only(right: 22),
      child: Column(
        children: [
          Text(text,
              style: AppTheme.inter(
                size: 11.5,
                weight: FontWeight.w600,
                color: on ? AppColors.inkDark : AppColors.faint,
              )),
          const SizedBox(height: 10),
          Container(
            height: 1.5,
            width: 20,
            color: on ? AppColors.forest : Colors.transparent,
          ),
        ],
      ),
    );
  }

  Widget _post({
    required String name,
    required String time,
    required String tag,
    required bool tagWarm,
    required String title,
    String? sub,
    required List<Color> bg,
    required List<Color> avatarColors,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 26,
              height: 26,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: avatarColors,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style: AppTheme.inter(
                          size: 10.5,
                          weight: FontWeight.w600,
                          color: AppColors.inkDark)),
                  Text(time,
                      style: AppTheme.inter(
                          size: 9.5, color: AppColors.faint)),
                ],
              ),
            ),
            Text(tag,
                style: AppTheme.label(
                  color: tagWarm ? AppColors.clay : AppColors.forest,
                  size: 9,
                  spacing: 1.4,
                )),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          height: 172,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: bg,
              stops: const [0.64, 1.0],
            ),
          ),
        ),
        const SizedBox(height: 14),
        Text(title,
            style: AppTheme.fraunces(
                size: 16, weight: FontWeight.w500, spacing: -0.3)),
        if (sub != null) ...[
          const SizedBox(height: 7),
          Text(sub,
              style: AppTheme.inter(
                  size: 11, color: AppColors.muted, height: 1.6)),
        ],
        const SizedBox(height: 12),
        Row(
          children: [
            const Icon(Icons.favorite_border,
                size: 14, color: AppColors.muted),
            const SizedBox(width: 4),
            Text('42', style: AppTheme.inter(size: 10.5, color: AppColors.muted)),
            const SizedBox(width: 16),
            const Icon(Icons.chat_bubble_outline,
                size: 14, color: AppColors.muted),
            const SizedBox(width: 4),
            Text('8', style: AppTheme.inter(size: 10.5, color: AppColors.muted)),
            const Spacer(),
            Text('SHOP LOOK →',
                style: AppTheme.label(
                    color: AppColors.forest, size: 9, spacing: 1.2)),
          ],
        ),
      ],
    );
  }
}