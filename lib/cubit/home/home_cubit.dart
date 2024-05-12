import 'package:afs_gpt/model/prompt.dart';
import 'package:afs_gpt/service/chatgpt_service.dart';
import 'package:afs_gpt/service/prompt_data_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final ChatgptService _chatgptService;
  final PromptDataService _promptDataService;
  HomeCubit(this._chatgptService, this._promptDataService)
      : super(HomeInitialState());

  onQuestionChanged(String? question) {
    emit((state as HomeInitialState).copyWith(question: question));
  }

  onQuestionAsked() async {
    var currentState = state as HomeInitialState;
    final String? userEmail = FirebaseAuth.instance.currentUser?.email;
    String? response =
        await _chatgptService.fetchChatGPTResponse(currentState.question!);
        emit(currentState.copyWith(response: response));
    Prompt prompt = Prompt(
        question: currentState.question!,
        response: response!,
        userEmail: userEmail!,
        createdDate: DateTime.now());
    await _promptDataService.savePrompt(prompt);
  }
}
