part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {
  final String? email;
  final String? password;
  final bool isPasswordObscure;
  final bool isLoginButtonLoading;

  LoginInitial({
    this.email,
    this.password,
    this.isPasswordObscure = true,
    this.isLoginButtonLoading = false,
  });

  LoginInitial copyWith({
    String? email,
    String? password,
    bool? isPasswordObscure,
    bool? isLoginButtonLoading,
  }) {
    return LoginInitial(
      email: email ?? this.email,
      password: password ?? this.password,
      isLoginButtonLoading: isLoginButtonLoading ?? this.isLoginButtonLoading,
      isPasswordObscure: isPasswordObscure ?? this.isPasswordObscure,
    );
  }
}
