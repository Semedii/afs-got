import 'package:afs_gpt/repository/prompt_repository.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 205, 202, 202),
      appBar: AppBar(
        title: const Text("AFS GPT"),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: 100,
                  height: 200,
                  color: Colors.green,
                ),
                Container(
                  width: 100,
                  height: 200,
                  color: Colors.white,
                ),
                Container(
                  width: 100,
                  height: 200,
                  color: Colors.red,
                ),
                Container(
                  width: 100,
                  height: 200,
                  color: Colors.green,
                ),
                Container(
                  width: 100,
                  height: 200,
                  color: Colors.white,
                ),
                Container(
                  width: 100,
                  height: 200,
                  color: Colors.red,
                ),
              ],
            ),
          ),
          _builTextField()
        ],
      ),
    );
  }

  Widget _builTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: TextField(
        decoration: _buildTextFieldDecoraion(),
      ),
    );
  }

  InputDecoration _buildTextFieldDecoraion() {
    return InputDecoration(
      filled: true,
      fillColor: Colors.white,
      hintText: 'Message',
      hintStyle: TextStyle(color: Colors.grey[400]),
      suffix: IconButton(
        icon: const Icon(Icons.arrow_upward),
        onPressed: () => PromptRepository().fetchChatGPTResponse("say yes"),
      ),
      border: _buildTextFieldBorder(),
    );
  }

  OutlineInputBorder _buildTextFieldBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide.none,
    );
  }
}
