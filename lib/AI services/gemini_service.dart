import 'dart:convert';
import 'package:http/http.dart' as http;
import 'secrets.dart';

class GeminiService {
  static const String apiKey = "AIzaSyC2JJmkYbGm8cfTyZUiT8rFaj9U6Y6yeDY"; // replace

  static Future<String> getAIResponse(String question) async {
  final url = Uri.parse(
  "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key=$apiKey",
);





    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "contents": [
          {
            "parts": [
              {"text": question}
            ]
          }
        ]
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data["candidates"][0]["content"]["parts"][0]["text"];
    } else {
      print("STATUS CODE: ${response.statusCode}");
      print("BODY: ${response.body}");
      return "Gemini request failed";
    }
  }
}
