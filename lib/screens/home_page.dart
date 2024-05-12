import 'package:afs_gpt/components/custom_drawer.dart';
import 'package:afs_gpt/components/question_message.dart';
import 'package:afs_gpt/components/response_message..dart';
import 'package:afs_gpt/cubit/home/home_cubit.dart';
import 'package:afs_gpt/service/chatgpt_service.dart';
import 'package:afs_gpt/service/prompt_data_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final ChatgptService _chatgptService = ChatgptService();
  final PromptDataService _promptDataService = PromptDataService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("AFS GPT"),
      ),
      body: BlocProvider(
        create: (context) => HomeCubit(_chatgptService, _promptDataService),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            state as HomeInitialState;
            final cubit = BlocProvider.of<HomeCubit>(context);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          state.response == null
                              ? Image.asset("assets/images/logo.png")
                              : _buildResponse(state)
                        ],
                      ),
                      _builTextField(cubit, state),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Column _buildResponse(HomeInitialState state) {
    return Column(
      children: [
        QuestionMessage(question: state.question),
        ResponseMessage(message: state.response),
      ],
    );
  }

  Widget _builTextField(HomeCubit cubit, HomeInitialState state) {
    return state.response == null
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: TextFormField(
              initialValue: state.question,
              decoration: _buildTextFieldDecoraion(cubit),
              onChanged: cubit.onQuestionChanged,
            ),
          )
        : ElevatedButton(
            onPressed: () => cubit.initPage(), child: const Text("new prompt"));
  }

  InputDecoration _buildTextFieldDecoraion(HomeCubit cubit) {
    return InputDecoration(
      contentPadding: const EdgeInsets.all(8),
      filled: true,
      fillColor: const Color.fromARGB(255, 228, 226, 226),
      hintText: 'Message',
      hintStyle: const TextStyle(color: Color.fromARGB(255, 101, 97, 97)),
      suffix: IconButton(
        icon: const Icon(Icons.arrow_upward),
        onPressed: cubit.onQuestionAsked,
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
