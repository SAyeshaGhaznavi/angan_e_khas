import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class MoodboardScreen extends StatelessWidget {
  const MoodboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      appBar: AppBar(
        title: Text('Moodboard',
            style: AppTheme.fraunces(
                size: 16, weight: FontWeight.w500, spacing: -0.3)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('MOODBOARD',
                  style: AppTheme.label(
                      color: AppColors.forest, size: 9, spacing: 1.8)),
              const SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text('Bedroom\nin Quiet Green',
                        style: AppTheme.fraunces(
                            size: 21,
                            weight: FontWeight.w500,
                            height: 1.2,
                            spacing: -0.5)),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 13, vertical: 7),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2B5A3A),
                      border: Border.all(
                          color: const Color(0xFFA3B05A).withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Text('Edit',
                        style: AppTheme.inter(
                          size: 10,
                          weight: FontWeight.w600,
                          color: const Color(0xFFD4E3B8),
                        )),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Masonry-ish grid
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 184,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xFFE4E7D6), Color(0xFFBFA282)],
                          stops: [0.64, 1.0],
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 30,
                            top: 50,
                            child: Container(
                              width: 60,
                              height: 90,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF7F5EC),
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 40,
                            bottom: 30,
                            child: Container(
                              width: 100,
                              height: 40,
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
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          height: 87,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Color(0xFFEAEBDE), Color(0xFFD3D6BF)],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 87,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Color(0xFFEFE6DA), Color(0xFFDAC0A8)],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              Text('PALETTE', style: AppTheme.label(size: 9, spacing: 1.8)),
              const SizedBox(height: 10),
              Row(
                children: [
                  _swatch(const Color(0xFFE4E7D6)),
                  _swatch(const Color(0xFF595D2B)),
                  _swatch(const Color(0xFF1D2A10)),
                  _swatch(const Color(0xFF7B4A2A)),
                  _swatch(const Color(0xFFA67B5B)),
                ],
              ),
              const SizedBox(height: 24),

              // Note
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.line),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('A NOTE ON THIS ROOM',
                        style: AppTheme.label(
                            color: AppColors.forest,
                            size: 9,
                            spacing: 1.8)),
                    const SizedBox(height: 8),
                    Text(
                      '"The window stays the brightest point. Everything else should step back from it."',
                      style: AppTheme.fraunces(
                        size: 12.5,
                        weight: FontWeight.w400,
                        color: AppColors.inkDark,
                        height: 1.6,
                        spacing: 0,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),

              // Placement check
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.line),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Placement check',
                              style: AppTheme.fraunces(
                                  size: 12.5, spacing: -0.2)),
                          const SizedBox(height: 4),
                          Text('Walkway clears 900 mm',
                              style: AppTheme.inter(
                                  size: 10.5, color: AppColors.muted)),
                        ],
                      ),
                    ),
                    Text('PASSED',
                        style: AppTheme.label(
                            color: AppColors.forest, size: 9)),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Shop this board'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _swatch(Color c) => Expanded(
    child: Container(
      height: 38,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: c,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black.withOpacity(0.06)),
      ),
    ),
  );
}