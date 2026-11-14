import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

class RedesignResponse {
  final Uint8List imageBytes;
  final int? lockPct;
  RedesignResponse({required this.imageBytes, required this.lockPct});
}

class RedesignApi {
  static const String baseUrl = 'https://bronco-maroon-pushing.ngrok-free.dev';

  static Future<RedesignResponse> redesign({required File photo,
      required String prompt, required String style, required String room}) async {
    final url = Uri.parse('$baseUrl/redesign');
    final request = http.MultipartRequest('POST', url)
      ..headers['ngrok-skip-browser-warning'] = 'true'
      ..fields['prompt'] = prompt
      ..fields['style'] = style
      ..fields['room'] = room
      ..files.add(await http.MultipartFile.fromPath('photo', photo.path));
    final streamed = await request.send().timeout(const Duration(minutes: 10));
    final response = await http.Response.fromStream(streamed);
    Map<String, dynamic> json;
    try {
      json = jsonDecode(response.body) as Map<String, dynamic>;
    } catch (_) {
      throw Exception('Server returned a non-JSON response (HTTP ${response.statusCode}). Check the API URL and Colab logs.');
    }
    if (response.statusCode != 200) {
      final error = json['error'];
      final message = error is Map ? error['message'] : null;
      throw Exception(message ?? 'HTTP ${response.statusCode}');
    }
    final b64 = json['image_b64'];
    if (b64 is! String || b64.isEmpty) throw Exception('No generated image received.');
    final bytes = base64Decode(b64);
    if (bytes.isEmpty) throw Exception('Generated image was empty.');
    final value = json['lock_pct'];
    return RedesignResponse(imageBytes: bytes,
        lockPct: value is num ? value.round() : null);
  }
}
