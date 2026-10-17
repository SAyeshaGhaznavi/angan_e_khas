import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/bottom_nav.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // ---- HERO ----
          Container(
            height: MediaQuery.of(context).size.height * 0.62,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF1D2A10),
                  Color(0xFF33401A),
                  Color(0xFF595D2B),
                ],
                stops: [0.0, 0.42, 1.0],
              ),
            ),
            child: Stack(
              children: [
                // soft circles
                Positioned(
                  top: -90,
                  right: -70,
                  child: Container(
                    width: 260,
                    height: 260,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.055),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -100,
                  left: -70,
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.04),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                // leaf outlines
                Positioned(
                  top: 70,
                  left: 30,
                  child: Transform.rotate(
                    angle: -0.38,
                    child: Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.white.withOpacity(0.16)),
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(90),
                          bottomLeft: Radius.circular(90),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 180,
                  right: 40,
                  child: Transform.rotate(
                    angle: 0.3,
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.white.withOpacity(0.13)),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(60),
                          bottomRight: Radius.circular(60),
                        ),
                      ),
                    ),
                  ),
                ),
                // mark
                Positioned(
                  top: 70,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Text(
                      'ANGAN · E · KHAS',
                      style: AppTheme.inter(
                        size: 11,
                        weight: FontWeight.w600,
                        color: Colors.white.withOpacity(0.62),
                        spacing: 3.5,
                      ),
                    ),
                  ),
                ),
                // arch
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: Container(
                      width: 100,
                      height: 132,
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                              color: AppColors.amber.withOpacity(0.75),
                              width: 1.5),
                          left: BorderSide(
                              color: AppColors.amber.withOpacity(0.75),
                              width: 1.5),
                          right: BorderSide(
                              color: AppColors.amber.withOpacity(0.75),
                              width: 1.5),
                        ),
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(50)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(13, 13, 13, 0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.amber.withOpacity(0.16),
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(37)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ---- BODY CARD ----
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(24, 32, 24, 26),
              decoration: const BoxDecoration(
                color: AppColors.cream,
                borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
              ),
              child: SafeArea(
                top: false,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('EST. 2025 · LAHORE',
                        style: AppTheme.label(
                            color: AppColors.forest,
                            size: 9,
                            spacing: 2.4)),
                    const SizedBox(height: 14),
                    Text(
                      'A room you already love — only restyled.',
                      style: AppTheme.fraunces(
                        size: 27,
                        weight: FontWeight.w500,
                        height: 1.14,
                        spacing: -0.7,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'One photograph. We hold your walls, windows and proportions, then change everything else.',
                      style: AppTheme.inter(
                          size: 11.5,
                          color: AppColors.muted,
                          height: 1.62),
                    ),
                    const SizedBox(height: 22),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const BottomNav()),
                          );
                        },
                        child: const Text('Begin'),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.inkDark,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          side: BorderSide(
                              color: AppColors.inkDark.withOpacity(0.16)),
                        ),
                        child: const Text('Sign in'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}