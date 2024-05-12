import 'package:afs_gpt/cubit/login/login_cubit.dart';
import 'package:afs_gpt/service/login_service.dart';
import 'package:afs_gpt/utils/field_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
   LoginPage({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginCubit(LoginService()),
        child: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            state as LoginInitial;
            final cubit = BlocProvider.of<LoginCubit>(context);
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildInputField(
                      initialValue: state.email,
                      labelText: 'Username',
                      onChanged: cubit.onUsernameChanged,
                    ),
                    const SizedBox(height: 20.0),
                    _buildInputField(
                      initialValue: state.password,
                      labelText: 'Password',
                      obscureText: state.isPasswordObscure,
                      onChanged: cubit.onPasswordChanged
                    ),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () {
                       _onLoginPressed(cubit);
                      },
                      child: const Text('Login'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String labelText,
    bool obscureText = false,
    String? initialValue,
    void Function(String)? onChanged,
  }) {
    return TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      obscureText: obscureText,
      onChanged: onChanged,
      validator: FieldValidator.required,
    );
  }

  _onLoginPressed(LoginCubit cubit){
    if(_formKey.currentState!.validate()){
      cubit.onLoginButtonPressed();
    }
  }
}
