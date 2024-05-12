part of 'favorite_cubit.dart';

sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}

final class FavoriteLoading extends FavoriteState {}

final class FavoriteLoaded extends FavoriteState {
  final List<Prompt?> prompts;

  FavoriteLoaded({required this.prompts});

  FavoriteLoaded copyWith(List<Prompt?>? prompts) {
    return FavoriteLoaded(prompts: prompts ?? this.prompts);
  }
}
