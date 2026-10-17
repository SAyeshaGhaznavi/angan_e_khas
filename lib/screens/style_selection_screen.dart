import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'redesign_result_screen.dart';

class StyleSelectionScreen extends StatefulWidget {
  final String description;
  const StyleSelectionScreen({super.key, this.description = ''});

  @override
  State<StyleSelectionScreen> createState() => _StyleSelectionScreenState();
}

class _StyleSelectionScreenState extends State<StyleSelectionScreen> {
  String _selectedRoom = 'Bedroom';
  int _selectedStyleIdx = 0;
  double _budget = 220000;

  final rooms = ['Bedroom', 'Lounge', 'Study', 'Kitchen'];
  final styles = [
    _Style('Japandi', 'Green · natural · quiet',
        [const Color(0xFFEAEBDE), const Color(0xFFD3D6BF)]),
    _Style('Mediterranean', 'Warm · earthy · bold',
        [const Color(0xFFEFE6DA), const Color(0xFFDAC0A8)]),
    _Style('Traditional', 'Rich · patterned',
        [const Color(0xFFF3EAD6), const Color(0xFFE2D0A9)]),
    _Style('Modern Minimal', 'Clean · restrained',
        [const Color(0xFFE4E2DB), const Color(0xFFCBC8BD)]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      appBar: AppBar(
        title: Text('Choose a direction',
            style: AppTheme.fraunces(
                size: 16, weight: FontWeight.w500, spacing: -0.3)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('STEP TWO',
                  style: AppTheme.label(
                      color: AppColors.forest, size: 9, spacing: 1.8)),
              const SizedBox(height: 8),
              Text('What kind of room?',
                  style: AppTheme.fraunces(
                      size: 21, weight: FontWeight.w500, spacing: -0.5)),
              const SizedBox(height: 18),
              Wrap(
                spacing: 7,
                runSpacing: 8,
                children: rooms.map((r) {
                  final on = r == _selectedRoom;
                  return GestureDetector(
                    onTap: () => setState(() => _selectedRoom = r),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(
                        color: on ? AppColors.terracotta : Colors.white,
                        border: Border.all(
                            color: on
                                ? AppColors.terracotta
                                : AppColors.line),
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        r,
                        style: AppTheme.inter(
                          size: 11,
                          weight: on ? FontWeight.w600 : FontWeight.w500,
                          color: on ? Colors.white : AppColors.muted,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 26),
              Text('Pick a style',
                  style: AppTheme.fraunces(
                      size: 16, weight: FontWeight.w500, spacing: -0.3)),
              const SizedBox(height: 14),
              ...List.generate(styles.length, (i) {
                final s = styles[i];
                final on = i == _selectedStyleIdx;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: GestureDetector(
                    onTap: () => setState(() => _selectedStyleIdx = i),
                    child: Container(
                      height: 88,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        border: on
                            ? Border.all(
                            color: AppColors.terracotta, width: 2)
                            : null,
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: s.bg,
                        ),
                      ),
                      child: Stack(
                        children: [
                          // overlay
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              gradient: LinearGradient(
                                colors: [
                                  const Color(0xFF060D08).withOpacity(0.66),
                                  const Color(0xFF060D08).withOpacity(0.10),
                                ],
                                stops: const [0.0, 0.78],
                              ),
                            ),
                          ),
                          // text
                          Positioned(
                            left: 17,
                            bottom: 15,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(s.sub.toUpperCase(),
                                    style: AppTheme.label(
                                        color:
                                        Colors.white.withOpacity(0.66),
                                        size: 8)),
                                const SizedBox(height: 4),
                                Text(s.name,
                                    style: AppTheme.fraunces(
                                      size: 17,
                                      weight: FontWeight.w500,
                                      color: Colors.white,
                                      spacing: -0.3,
                                    )),
                              ],
                            ),
                          ),
                          // tick
                          Positioned(
                            right: 15,
                            top: 0,
                            bottom: 0,
                            child: Center(
                              child: Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  color: on
                                      ? AppColors.terracotta
                                      : Colors.transparent,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: on
                                        ? AppColors.terracotta
                                        : Colors.white.withOpacity(0.55),
                                    width: 1.5,
                                  ),
                                ),
                                child: on
                                    ? const Icon(Icons.check,
                                    size: 14, color: Colors.white)
                                    : null,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
              const SizedBox(height: 22),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('BUDGET',
                      style: AppTheme.label(size: 9, spacing: 1.8)),
                  Text('PKR ${_budget.toStringAsFixed(0)}',
                      style: AppTheme.fraunces(
                        size: 16,
                        weight: FontWeight.w600,
                        color: AppColors.clay,
                      )),
                ],
              ),
              const SizedBox(height: 14),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: AppColors.leaf,
                  inactiveTrackColor: AppColors.sagePale,
                  thumbColor: Colors.white,
                  overlayColor: AppColors.leaf.withOpacity(0.15),
                  trackHeight: 6,
                  thumbShape:
                  const RoundSliderThumbShape(enabledThumbRadius: 9),
                ),
                child: Slider(
                  value: _budget,
                  min: 50000,
                  max: 500000,
                  divisions: 45,
                  onChanged: (v) => setState(() => _budget = v),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const RedesignResultScreen(),
                      ),
                    );
                  },
                  child: const Text('Redesign this room'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Style {
  final String name;
  final String sub;
  final List<Color> bg;
  _Style(this.name, this.sub, this.bg);
}