import 'dart:io';
import 'package:flutter/material.dart';
import '../services/compatibility_api.dart';
import '../theme/app_theme.dart';

class CompatibilityResultScreen extends StatelessWidget {
  const CompatibilityResultScreen({super.key, required this.room, required this.item, required this.result});
  final File room;
  final File item;
  final CompatibilityResult result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      appBar: AppBar(title: Text('Your match', style: AppTheme.fraunces(size: 16))),
      body: SafeArea(child: Column(children: [
        Expanded(child: SingleChildScrollView(padding: const EdgeInsets.fromLTRB(22, 12, 22, 24),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('COMPATIBILITY REPORT', style: AppTheme.label(color: AppColors.forest)),
            const SizedBox(height: 8),
            Text('A closer look', style: AppTheme.fraunces(size: 27)),
            const SizedBox(height: 20),
            Row(children: [
              Expanded(child: _ResultPhoto(file: room, label: 'YOUR ROOM')),
              const SizedBox(width: 12),
              Expanded(child: _ResultPhoto(file: item, label: 'YOUR PIECE')),
            ]),
            const SizedBox(height: 24),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: AppColors.line), borderRadius: BorderRadius.circular(20),
              ),
              child: Column(children: [
                Text('VISUAL COMPATIBILITY', style: AppTheme.label()),
                const SizedBox(height: 12),
                Text('${result.score.toStringAsFixed(1)}',
                  style: AppTheme.fraunces(size: 54, color: AppColors.forest, height: 1.05)),
                Text('OUT OF 100', style: AppTheme.label(size: 8)),
                const SizedBox(height: 18),
                ClipRRect(borderRadius: BorderRadius.circular(6),
                  child: LinearProgressIndicator(value: (result.score / 100).clamp(0.0, 1.0),
                    minHeight: 7, backgroundColor: AppColors.linen, color: AppColors.moss)),
                const SizedBox(height: 17),
                Text('A visual similarity score based on style and colour — not a measure of physical fit.',
                  textAlign: TextAlign.center, style: AppTheme.inter(size: 11, color: AppColors.muted, height: 1.55)),
              ]),
            ),
            const SizedBox(height: 22),
            Text('THE DETAILS', style: AppTheme.label()),
            const SizedBox(height: 12),
            _MetricRow(title: 'Style similarity', value: result.styleCosine.toStringAsFixed(3),
              subtitle: 'CLIP image-to-image cosine similarity (not a percentage)'),
            const SizedBox(height: 10),
            _MetricRow(title: 'Colour harmony', value: result.colourHarmony.toStringAsFixed(2),
              subtitle: 'Colour agreement on a 0–1 scale'),
            const SizedBox(height: 20),
            Text('The compatibility score uses the same 60% visual-style and 40% colour-harmony weighting as the project notebook.',
              style: AppTheme.inter(size: 11, color: AppColors.muted, height: 1.65)),
          ]),
        )),
        Padding(padding: const EdgeInsets.fromLTRB(22, 8, 22, 20), child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text('Try another piece')),
        )),
      ])),
    );
  }
}

class _ResultPhoto extends StatelessWidget {
  const _ResultPhoto({required this.file, required this.label});
  final File file;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      ClipRRect(borderRadius: BorderRadius.circular(17), child: AspectRatio(aspectRatio: 0.92,
        child: Image.file(file, fit: BoxFit.cover))),
      const SizedBox(height: 9),
      Text(label, style: AppTheme.label(size: 9)),
    ]);
  }
}

class _MetricRow extends StatelessWidget {
  const _MetricRow({required this.title, required this.value, required this.subtitle});
  final String title;
  final String value;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 15),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.line)),
      child: Row(children: [
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, style: AppTheme.fraunces(size: 15)),
          const SizedBox(height: 4),
          Text(subtitle, style: AppTheme.inter(size: 10, color: AppColors.muted, height: 1.5)),
        ])),
        const SizedBox(width: 10),
        Text(value, style: AppTheme.fraunces(size: 19, color: AppColors.forest)),
      ]),
    );
  }
}
