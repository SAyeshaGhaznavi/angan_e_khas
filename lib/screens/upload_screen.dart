import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../theme/app_theme.dart';
import 'style_selection_screen.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  File? _image;
  final ImagePicker _picker = ImagePicker();
  final TextEditingController _descController = TextEditingController();

  Future<void> _pickImage(ImageSource source) async {
    final picked = await _picker.pickImage(source: source, imageQuality: 85);
    if (picked != null) setState(() => _image = File(picked.path));
  }

  @override
  void dispose() {
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      appBar: AppBar(
        title: Text('Scan your room',
            style: AppTheme.fraunces(
                size: 16, weight: FontWeight.w500, spacing: -0.3)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Preview / capture frame
              Expanded(
                flex: 5,
                child: GestureDetector(
                  onTap: () => _pickImage(ImageSource.gallery),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: _image == null
                          ? const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFFD5D8C6), Color(0xFFAFA089)],
                        stops: [0.66, 1.0],
                      )
                          : null,
                      image: _image != null
                          ? DecorationImage(
                        image: FileImage(_image!),
                        fit: BoxFit.cover,
                      )
                          : null,
                    ),
                    child: Stack(
                      children: [
                        if (_image == null) ...[
                          Positioned(
                            left: 40,
                            top: 40,
                            child: Container(
                              width: 70,
                              height: 100,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF0F1E9),
                                borderRadius: BorderRadius.circular(3),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withOpacity(0.34),
                                    blurRadius: 0,
                                    spreadRadius: 6,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 60,
                            bottom: 60,
                            child: Container(
                              width: 120,
                              height: 46,
                              decoration: BoxDecoration(
                                color: const Color(0xFF95997D),
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
                        // guide corners
                        Positioned.fill(
                          child: Padding(
                            padding: const EdgeInsets.all(26),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.white.withOpacity(0.36)),
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                          ),
                        ),
                        // caption
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 22,
                          child: Center(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 8),
                              decoration: BoxDecoration(
                                color:
                                const Color(0xFF060D08).withOpacity(0.42),
                                borderRadius: BorderRadius.circular(999),
                              ),
                              child: Text(
                                _image == null
                                    ? 'Stand in a corner, capture both walls'
                                    : 'Looking good — add a note below',
                                style: AppTheme.fraunces(
                                  size: 12.5,
                                  weight: FontWeight.w400,
                                  color: Colors.white,
                                  spacing: 0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Description box
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.line),
                ),
                child: TextField(
                  controller: _descController,
                  maxLines: 3,
                  maxLength: 200,
                  style: AppTheme.inter(size: 12.5, height: 1.5),
                  decoration: InputDecoration(
                    hintText:
                    'Describe how you want to redesign this room...\ne.g. "Make it cozy and warm with wooden furniture"',
                    hintStyle: AppTheme.inter(
                        size: 12, color: AppColors.muted, height: 1.5),
                    border: InputBorder.none,
                    counterStyle: AppTheme.inter(
                        size: 10, color: AppColors.faint),
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Camera / Gallery
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () => _pickImage(ImageSource.camera),
                      icon: const Icon(Icons.camera_alt_outlined, size: 18),
                      label: const Text('Camera'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        foregroundColor: AppColors.inkDark,
                        side: BorderSide(
                            color: AppColors.inkDark.withOpacity(0.14)),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () => _pickImage(ImageSource.gallery),
                      icon: const Icon(Icons.photo_library_outlined, size: 18),
                      label: const Text('Gallery'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        foregroundColor: AppColors.inkDark,
                        side: BorderSide(
                            color: AppColors.inkDark.withOpacity(0.14)),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14)),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _image == null
                      ? null
                      : () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => StyleSelectionScreen(
                          description: _descController.text.trim(),
                        ),
                      ),
                    );
                  },
                  child: const Text('Continue'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}