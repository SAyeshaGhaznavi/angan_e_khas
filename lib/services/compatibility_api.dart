import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'redesign_api.dart';

class CompatibilityResult {
  final double score;
  final double styleCosine;
  final double colourHarmony;
  const CompatibilityResult({required this.score, required this.styleCosine, required this.colourHarmony});

  factory CompatibilityResult.fromJson(Map<String, dynamic> data) {
    final score = data['compatibility_0_100'];
    final cosine = data['style_cosine'];
    final harmony = data['colour_harmony'];
    if (score is! num || cosine is! num || harmony is! num) {
      throw const FormatException('The server returned incomplete compatibility results.');
    }
    return CompatibilityResult(
      score: score.toDouble(),
      styleCosine: cosine.toDouble(),
      colourHarmony: harmony.toDouble(),
    );
  }
}

class CompatibilityApi {
  static Future<CompatibilityResult> check({required File room, required File item}) async {
    final request = http.MultipartRequest('POST', Uri.parse('${RedesignApi.baseUrl}/compatibility'))
      ..headers['ngrok-skip-browser-warning'] = 'true'
      ..files.add(await http.MultipartFile.fromPath('room_photo', room.path))
      ..files.add(await http.MultipartFile.fromPath('item_photo', item.path));

    final streamed = await request.send().timeout(const Duration(minutes: 4));
    final response = await http.Response.fromStream(streamed);
    Map<String, dynamic> body;
    try {
      body = jsonDecode(response.body) as Map<String, dynamic>;
    } catch (_) {
      throw Exception('The server did not return JSON (HTTP ${response.statusCode}). Check the backend URL and that the updated API cell is running.');
    }
    if (response.statusCode != 200) {
      final error = body['error'];
      final message = error is Map ? error['message'] : null;
      throw Exception(message is String ? message : 'Compatibility check failed (HTTP ${response.statusCode}).');
    }
    return CompatibilityResult.fromJson(body);
  }
}
