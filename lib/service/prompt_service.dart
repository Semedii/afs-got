import 'dart:convert';

import 'package:afs_gpt/model/prompt.dart';
import 'package:http/http.dart' as https;

class PromptService {
  fetchChatGPTResponse(String message, String userEmail) async {
    try {
      final response = await https.post(
          Uri.parse('https://api.openai.com/v1/chat/completions'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization':
                'Bearer sk-proj-oUeTnNM3wuVCTntvAg3UT3BlbkFJlvl2nFwFFpwDmmlcWVJ0'
          },
          body: jsonEncode({
            "model": "gpt-3.5-turbo",
            "messages": [
              {"role": "user", "content": message}
            ],
          }));

      if (response.statusCode == 200) {
        String chatGptResponse =
            jsonDecode(response.body)['choices'][0]['message']['content'];
        Prompt prompt = Prompt(
            question: message,
            response: chatGptResponse,
            userEmail: userEmail,
            createdDate: DateTime.now());
      } else {
        print('Failed to fetch aswer: ${response.body}');
      }
    } catch (error) {
      print("error: $error");
    }
  }
}
