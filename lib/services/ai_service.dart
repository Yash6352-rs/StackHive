import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class AiService {
  static Future<String?> generateAnswer({
    required String questionId,
    required String title,
    required String description,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(
          "http://192.168.1.213:5000/api/ai/generate-answer",
        ),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "questionId": questionId,
          "title": title,
          "description": description,
        }),
      );

      if (response.statusCode != 200) {
        debugPrint("AI Error: ${response.statusCode} - ${response.body}");
        return null;
      }

      final data = jsonDecode(response.body);

      return data["answer"] as String?;
    } catch (e) {
      debugPrint("AI Service Error: $e");
      return null;
    }
  }
}
