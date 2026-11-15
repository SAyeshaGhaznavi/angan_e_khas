import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../services/compatibility_api.dart';
import '../theme/app_theme.dart';
import 'compatibility_result_screen.dart';

class CompatibilityScreen extends StatefulWidget {
  const CompatibilityScreen({super.key});

  @override
  State<CompatibilityScreen> createState() => _CompatibilityScreenState();
}

class _CompatibilityScreenState extends State<CompatibilityScreen> {
  final ImagePicker _picker = ImagePicker();
  File? _room;
  File? _item;
  bool _loading = false;

  Future<void> _pick(bool isRoom, ImageSource source) async {
    try {
      final picked = await _picker.pickImage(source: source, imageQuality: 90);
      if (picked == null || !mounted) return;
      setState(() {
        if (isRoom) {
          _room = File(picked.path);
        } else {
          _item = File(picked.path);
        }
      });
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Could not open photo: $e')));
    }
  }

  Future<void> _choosePhoto(bool room) async {
    await showModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColors.cream,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(22))),
      builder: (sheetContext) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 16, 18, 20),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Text(room ? 'Choose your room photo' : 'Choose a furniture photo', style: AppTheme.fraunces(size: 18)),
            const SizedBox(height: 12),
            ListTile(
              leading: const Icon(Icons.photo_library_outlined, color: AppColors.terracotta),
              title: const Text('Photo library'),
              onTap: () { Navigator.pop(sheetContext); _pick(room, ImageSource.gallery); },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt_outlined, color: AppColors.terracotta),
              title: const Text('Take a photo'),
              onTap: () { Navigator.pop(sheetContext); _pick(room, ImageSource.camera); },
            ),
          ]),
        ),
      ),
    );
  }

  Future<void> _check() async {
    if (_loading || _room == null || _item == null) return;
    setState(() => _loading = true);
    try {
      final result = await CompatibilityApi.check(room: _room!, item: _item!);
      if (!mounted) return;
      Navigator.push(context, MaterialPageRoute(builder: (_) => CompatibilityResultScreen(
        room: _room!, item: _item!, result: result,
      )));
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Could not check compatibility: $e'), duration: const Duration(seconds: 9),
      ));
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      appBar: AppBar(title: Text('Check compatibility', style: AppTheme.fraunces(size: 16))),
      body: SafeArea(child: Column(children: [
        Expanded(child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(22, 14, 22, 24),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('THE FINISHING TOUCH', style: AppTheme.label(color: AppColors.forest)),
            const SizedBox(height: 8),
            Text('Does it belong here?', style: AppTheme.fraunces(size: 27)),
            const SizedBox(height: 8),
            Text('See how well a piece of furniture or decor complements your room.',
              style: AppTheme.inter(size: 12, height: 1.6, color: AppColors.muted)),
            const SizedBox(height: 24),
            _PhotoTile(number: '01', title: 'Your room', subtitle: 'A clear photo of your space',
              photo: _room, onTap: () => _choosePhoto(true)),
            const SizedBox(height: 16),
            _PhotoTile(number: '02', title: 'Furniture or decor', subtitle: 'One item, clearly visible',
              photo: _item, onTap: () => _choosePhoto(false)),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(color: AppColors.sagePale.withOpacity(0.55), borderRadius: BorderRadius.circular(14)),
              child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Icon(Icons.info_outline, color: AppColors.forest, size: 17),
                const SizedBox(width: 9),
                Expanded(child: Text('This measures visual style and colour harmony. It does not verify physical dimensions or whether the item will fit.',
                    style: AppTheme.inter(size: 10.5, height: 1.6, color: AppColors.forest))),
              ]),
            ),
          ]),
        )),
        Padding(padding: const EdgeInsets.fromLTRB(22, 8, 22, 20), child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _room != null && _item != null && !_loading ? _check : null,
            child: Padding(padding: const EdgeInsets.symmetric(vertical: 2),
              child: Text(_loading ? 'Checking compatibility…' : 'Check compatibility')),
          ),
        )),
      ])),
    );
  }
}

class _PhotoTile extends StatelessWidget {
  const _PhotoTile({required this.number, required this.title, required this.subtitle,
    required this.photo, required this.onTap});
  final String number;
  final String title;
  final String subtitle;
  final File? photo;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.line)),
        child: Row(children: [
          ClipRRect(borderRadius: BorderRadius.circular(13), child: SizedBox(
            width: 112, height: 118,
            child: photo == null
              ? Container(color: AppColors.linen, child: const Icon(Icons.add_photo_alternate_outlined,
                  color: AppColors.terracotta, size: 30))
              : Image.file(photo!, fit: BoxFit.cover),
          )),
          const SizedBox(width: 16),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('PHOTO $number', style: AppTheme.label(size: 8.5)),
            const SizedBox(height: 7),
            Text(title, style: AppTheme.fraunces(size: 17)),
            const SizedBox(height: 5),
            Text(subtitle, style: AppTheme.inter(size: 10, height: 1.45, color: AppColors.muted)),
            const SizedBox(height: 12),
            Row(children: [
              const Icon(Icons.add_circle_outline, color: AppColors.terracotta, size: 16),
              const SizedBox(width: 5),
              Flexible(child: Text(photo == null ? 'Add a photo' : 'Change photo',
                  style: AppTheme.inter(size: 11, weight: FontWeight.w600, color: AppColors.terracotta))),
            ]),
          ])),
        ]),
      ),
    );
  }
}
