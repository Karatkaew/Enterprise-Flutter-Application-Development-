import 'dart:convert';
import 'package:http/http.dart' as http;

class AIService {

  Future<String> summarize(String text) async {

    final response = await http.post(
      Uri.parse("https://api.openai.com/v1/chat/completions"),
      headers: {
        "Authorization": "Bearer API_KEY",
        "Content-Type": "application/json"
      },
      body: jsonEncode({
        "model": "gpt-3.5-turbo",
        "messages": [
          {"role": "user", "content": "summarize: $text"}
        ]
      }),
    );

    return response.body;
  }

}