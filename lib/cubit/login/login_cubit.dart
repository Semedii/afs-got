import 'package:afs_gpt/service/login_service.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginService loginService;
  LoginCubit(this.loginService) : super(LoginInitial());

  onUsernameChanged(String email) {
    emit((state as LoginInitial).copyWith(email: email));
  }

  onPasswordChanged(String password) {
    emit((state as LoginInitial).copyWith(password: password));
  }

  onIsPasswordObscureChanged(bool isPasswordObscure) {
    emit(
      (state as LoginInitial).copyWith(
        isPasswordObscure: isPasswordObscure,
      ),
    );
  }

  onIsLoginButtonLoadingChanged(bool isLoginButtonLoading) {
    emit(
      (state as LoginInitial).copyWith(
        isLoginButtonLoading: isLoginButtonLoading,
      ),
    );
  }

  onLoginButtonPressed() {
    var currentState = state as LoginInitial;
    loginService.login(currentState.email!, currentState.password!);
  }
}
