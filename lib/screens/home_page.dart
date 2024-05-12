import 'package:afs_gpt/components/custom_drawer.dart';
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

  Container _buildResponse(HomeInitialState state) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: _buildResponseDecoration(),
      child: Text(
        state.response!,
        style: const TextStyle(fontSize: 16.0),
      ),
    );
  }

  BoxDecoration _buildResponseDecoration() {
    return BoxDecoration(
      color: Colors.grey[300],
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(20.0),
        bottomLeft: Radius.circular(20.0),
        bottomRight: Radius.circular(20.0),
      ),
    );
  }

  Widget _builTextField(HomeCubit cubit, HomeInitialState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: TextFormField(
        initialValue: state.question,
        decoration: _buildTextFieldDecoraion(cubit),
        onChanged: cubit.onQuestionChanged,
      ),
    );
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
