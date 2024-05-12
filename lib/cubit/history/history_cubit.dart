import 'package:afs_gpt/model/prompt.dart';
import 'package:afs_gpt/service/prompt_data_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  final PromptDataService _promptDataService;
  HistoryCubit(this._promptDataService) : super(HistoryInitial());

  initPage()async{
    emit(HistoryLoading());
    final String? userEmail = FirebaseAuth.instance.currentUser?.email;
    List<Prompt?> prompts = await _promptDataService.fetchHistory(userEmail!);
    emit(HistoryLoaded(prompts: prompts));
  }
  onFavoriteTapped(String id, bool isFavorite)async{
    await _promptDataService.updateIsFavorite(id: id, isFavorite: !isFavorite);
    initPage();
  }
}
