import 'package:dio/dio.dart';

class ExpenseRemoteDatasource {

  final Dio dio;

  ExpenseRemoteDatasource(this.dio);

  Future<String> categorizeExpense(String text) async {

    final response = await dio.post(
      "https://api.openai.com/v1/chat/completions",
      data: {
        "model": "gpt-4o-mini",
        "messages": [
          {
            "role": "user",
            "content": "categorize this expense: $text"
          }
        ]
      },
    );

    return response.data["choices"][0]["message"]["content"];
  }
}