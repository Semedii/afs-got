import 'package:afs_gpt/components/custom_drawer.dart';
import 'package:afs_gpt/repository/prompt_repository.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("AFS GPT"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Image.asset("assets/images/logo.png")],
                ),
                _builTextField(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _builTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: TextFormField(
        decoration: _buildTextFieldDecoraion(),
      ),
    );
  }

  InputDecoration _buildTextFieldDecoraion() {
    return InputDecoration(
      contentPadding: const EdgeInsets.all(8),
      filled: true,
      fillColor: const Color.fromARGB(255, 228, 226, 226),
      hintText: 'Message',
      hintStyle: const TextStyle(color: Color.fromARGB(255, 101, 97, 97)),
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
