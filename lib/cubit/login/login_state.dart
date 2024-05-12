part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {
  final String? username;
  final String? password;
  final bool isPasswordObscure;
  final bool isLoginButtonLoading;

  LoginInitial({
    this.username,
    this.password,
    this.isPasswordObscure = true,
    this.isLoginButtonLoading = false,
  });

  LoginInitial copyWith({
    String? username,
    String? password,
    bool? isPasswordObscure,
    bool? isLoginButtonLoading,
  }) {
    return LoginInitial(
      username: username ?? this.username,
      password: password ?? this.password,
      isLoginButtonLoading: isLoginButtonLoading ?? this.isLoginButtonLoading,
      isPasswordObscure: isPasswordObscure ?? this.isPasswordObscure,
    );
  }
}
