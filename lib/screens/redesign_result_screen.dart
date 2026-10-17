import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class RedesignResultScreen extends StatefulWidget {
  const RedesignResultScreen({super.key});

  @override
  State<RedesignResultScreen> createState() => _RedesignResultScreenState();
}

class _RedesignResultScreenState extends State<RedesignResultScreen> {
  double _sliderValue = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      body: SafeArea(
        child: Column(
          children: [
            // Top bar
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 12, 4),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.bookmark_outline)),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.ios_share)),
                ],
              ),
            ),

            // Before / After
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // AFTER (base)
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFFE4E7D6), Color(0xFFBFA282)],
                        stops: [0.64, 1.0],
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 60,
                          top: 80,
                          child: Container(
                            width: 90,
                            height: 130,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF7F5EC),
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 90,
                          bottom: 80,
                          child: Container(
                            width: 140,
                            height: 60,
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
                        Positioned(
                          left: 230,
                          bottom: 80,
                          child: Container(
                            width: 50,
                            height: 40,
                            decoration: BoxDecoration(
                              color: AppColors.terracotta.withOpacity(0.9),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                                bottomLeft: Radius.circular(3),
                                bottomRight: Radius.circular(3),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // BEFORE (clipped)
                  ClipRect(
                    clipper: _BeforeClipper(_sliderValue),
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xFFDFD6C9), Color(0xFFBEAB92)],
                          stops: [0.64, 1.0],
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 60,
                            top: 80,
                            child: Container(
                              width: 90,
                              height: 130,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF2F3EC),
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 90,
                            bottom: 80,
                            child: Container(
                              width: 140,
                              height: 60,
                              decoration: BoxDecoration(
                                color: const Color(0xFF9A9E80),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                  bottomLeft: Radius.circular(5),
                                  bottomRight: Radius.circular(5),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Slider handle
                  Align(
                    alignment: Alignment(_sliderValue * 2 - 1, 0),
                    child: Container(
                      width: 2,
                      color: Colors.white,
                      child: Center(
                        child: Container(
                          width: 38,
                          height: 38,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text('‹ ›',
                                style: AppTheme.inter(
                                  size: 11,
                                  weight: FontWeight.w700,
                                  color: AppColors.forest,
                                )),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Tags
                  Positioned(
                    top: 14,
                    left: 14,
                    child: _tag('BEFORE', onDark: false),
                  ),
                  Positioned(
                    top: 14,
                    right: 14,
                    child: _tag('AFTER', onDark: true),
                  ),
                ],
              ),
            ),

            // Bottom slider
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: AppColors.leaf,
                  inactiveTrackColor: AppColors.sagePale,
                  thumbColor: Colors.white,
                  overlayColor: AppColors.leaf.withOpacity(0.15),
                  trackHeight: 4,
                ),
                child: Slider(
                  value: _sliderValue,
                  onChanged: (v) => setState(() => _sliderValue = v),
                ),
              ),
            ),

            // Sheet
            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              decoration: const BoxDecoration(
                color: AppColors.cream,
                borderRadius: BorderRadius.vertical(top: Radius.circular(26)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('MASTER BEDROOM',
                                style: AppTheme.label(size: 9)),
                            const SizedBox(height: 6),
                            Text('Quiet Green',
                                style: AppTheme.fraunces(
                                    size: 21,
                                    weight: FontWeight.w500,
                                    spacing: -0.5)),
                          ],
                        ),
                      ),
                      _lockStamp(),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Four pieces replaced. Walls, window and proportions untouched.',
                    style: AppTheme.inter(
                        size: 11.5,
                        color: AppColors.muted,
                        height: 1.62),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColors.inkDark,
                            padding:
                            const EdgeInsets.symmetric(vertical: 14),
                            side: BorderSide(
                                color:
                                AppColors.inkDark.withOpacity(0.16)),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13)),
                          ),
                          child: const Text('Save board'),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding:
                            const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13)),
                          ),
                          child: const Text('Shop this look'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tag(String text, {required bool onDark}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: onDark ? AppColors.forest : Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        text,
        style: AppTheme.label(
          color: onDark ? Colors.white : AppColors.inkDark,
          size: 8.5,
          spacing: 1.4,
        ),
      ),
    );
  }

  Widget _lockStamp() {
    return Container(
      width: 58,
      height: 58,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.forest.withOpacity(0.42),
          width: 1.5,
          style: BorderStyle.solid,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('94',
              style: AppTheme.fraunces(
                size: 18,
                weight: FontWeight.w600,
                color: AppColors.forest,
                spacing: -0.5,
              )),
          Text('LOCK',
              style: AppTheme.label(
                  color: AppColors.forest, size: 6.5, spacing: 1.2)),
        ],
      ),
    );
  }
}

class _BeforeClipper extends CustomClipper<Rect> {
  final double value;
  _BeforeClipper(this.value);
  @override
  Rect getClip(Size size) =>
      Rect.fromLTRB(0, 0, size.width * value, size.height);
  @override
  bool shouldReclip(_BeforeClipper old) => old.value != value;
}