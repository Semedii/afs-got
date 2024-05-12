part of 'history_cubit.dart';

sealed class HistoryState {}

final class HistoryInitial extends HistoryState {}

final class HistoryLoading extends HistoryState {}

final class HistoryLoaded extends HistoryState {
  final List<Prompt?> prompts;

  HistoryLoaded({required this.prompts});

  HistoryLoaded copyWith(List<Prompt?>? prompts) {
    return HistoryLoaded(prompts: prompts ?? this.prompts);
  }
}
