import 'package:afs_gpt/model/prompt.dart';
import 'package:afs_gpt/service/prompt_data_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final PromptDataService _promptDataService;
  FavoriteCubit(this._promptDataService) : super(FavoriteInitial());

  initPage()async{
    emit(FavoriteLoading());
    final String? userEmail = FirebaseAuth.instance.currentUser?.email;
    List<Prompt?> prompts = await _promptDataService.fetchFavorites(userEmail!);
    emit(FavoriteLoaded(prompts: prompts));
  }

  onFavoriteTapped(String id, bool isFavorite)async{
    await _promptDataService.updateIsFavorite(id: id, isFavorite: !isFavorite);
    initPage();
  }
}
