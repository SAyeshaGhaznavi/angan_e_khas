import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ItemDetailScreen extends StatelessWidget {
  const ItemDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hero image
              Stack(
                children: [
                  Container(
                    height: 250,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFFEAEBDE), Color(0xFFD3D6BF)],
                      ),
                    ),
                  ),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back),
                      ),
                    ),
                  ),
                ],
              ),
              // Sheet
              Transform.translate(
                offset: const Offset(0, -26),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 22, 20, 20),
                  decoration: const BoxDecoration(
                    color: AppColors.cream,
                    borderRadius:
                    BorderRadius.vertical(top: Radius.circular(26)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('KARACHI WOODWORKS · LAHORE',
                          style: AppTheme.label(size: 9)),
                      const SizedBox(height: 8),
                      Text('Moss Accent Chair',
                          style: AppTheme.fraunces(
                              size: 21,
                              weight: FontWeight.w500,
                              spacing: -0.5)),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Text('PKR 34,500',
                              style: AppTheme.fraunces(
                                size: 22,
                                weight: FontWeight.w600,
                                color: AppColors.clay,
                                spacing: -0.5,
                              )),
                          const Spacer(),
                          _matchStamp(92),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(height: 1, color: AppColors.lineSoft),
                      const SizedBox(height: 8),

                      _metric('Palette', 0.95, '95%'),
                      _metric('Style', 0.88, '88%'),
                      _metric('Scale', 0.90, '90%'),
                      _metric('Clearance', 0.93, '93%'),
                      const SizedBox(height: 18),
                      Text(
                        'Palette and scale are near-identical to your board. Style reads slightly more rustic — a walnut finish would close the gap.',
                        style: AppTheme.fraunces(
                          size: 12.5,
                          weight: FontWeight.w400,
                          color: AppColors.muted,
                          height: 1.6,
                          spacing: 0,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                foregroundColor: AppColors.inkDark,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 14),
                                side: BorderSide(
                                    color: AppColors.inkDark
                                        .withOpacity(0.16)),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(13)),
                              ),
                              child: const Text('Message'),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 14),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(13)),
                              ),
                              child: const Text('Add to board'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _metric(String label, double pct, String display) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label,
                  style: AppTheme.inter(
                      size: 11.5, weight: FontWeight.w500)),
              Text(display,
                  style: AppTheme.fraunces(
                    size: 13,
                    weight: FontWeight.w600,
                    color: AppColors.forest,
                    spacing: -0.3,
                  )),
            ],
          ),
          const SizedBox(height: 7),
          ClipRRect(
            borderRadius: BorderRadius.circular(99),
            child: Stack(
              children: [
                Container(height: 8, color: AppColors.sagePale),
                FractionallySizedBox(
                  widthFactor: pct,
                  child: Container(height: 8, color: AppColors.leaf),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _matchStamp(int score) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
            color: AppColors.forest.withOpacity(0.42), width: 1.5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('$score',
              style: AppTheme.fraunces(
                size: 15,
                weight: FontWeight.w600,
                color: AppColors.forest,
                spacing: -0.4,
              )),
          Text('MATCH',
              style:
              AppTheme.label(color: AppColors.forest, size: 6, spacing: 1)),
        ],
      ),
    );
  }
}