import 'dart:convert';
import 'package:http/http.dart' as https;

class ChatgptService {
 Future<String?> fetchChatGPTResponse(String message) async {
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
            return chatGptResponse;
      } else {
        print('Failed to fetch aswer: ${response.body}');
      }
    } catch (error) {
      print("error: $error");
    }
    return null;
  }
}
