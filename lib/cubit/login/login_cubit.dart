import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  onUsernameChanged(String username){
    emit((state as LoginInitial).copyWith(username: username));
  }
    onPasswordChanged(String password){
    emit((state as LoginInitial).copyWith(password: password));
  }
    onIsPasswordObscureChanged(bool isPasswordObscure){
    emit((state as LoginInitial).copyWith(isPasswordObscure: isPasswordObscure));
  }
    onIsLoginButtonLoadingChanged(bool isLoginButtonLoading){
    emit((state as LoginInitial).copyWith(isLoginButtonLoading: isLoginButtonLoading));
  }
  
}
