import 'dart:convert';
import 'package:http/http.dart' as http;
import 'secrets.dart';

class ApiService {
  static Future<String> getAIResponse(String message) async {
    final url = Uri.parse(
      "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=${AppSecrets.geminiApiKey}",
    );

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "contents": [
          {
            "parts": [
              {"text": message}
            ]
          }
        ]
      }),
    );

    final data = jsonDecode(response.body);

    try {
      return data["candidates"][0]["content"]["parts"][0]["text"];
    } catch (e) {
      return "AI request failed. Check API key / request format.";
    }
  }
}
