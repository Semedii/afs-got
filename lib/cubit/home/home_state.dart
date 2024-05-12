part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitialState extends HomeState {
  final String? question;
  final String? response;

  HomeInitialState({ this.question,  this.response});

  HomeInitialState copyWith({String? question, String? response}) {
    return HomeInitialState(
      question: question ?? this.question,
      response: response ?? this.response,
    );
  }
}
