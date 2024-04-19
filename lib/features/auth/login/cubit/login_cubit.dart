import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/features/auth/domain/login_repo.dart';
import 'package:task/features/auth/login/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginStates() async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(
      email: emailController.text,
      password: passwordController.text,
    );
    response.when(success: (loginResponse) async {
      var prefs = await SharedPreferences.getInstance();
            prefs.setBool('isAuth',true );
            prefs.setString('userId',loginResponse.data.id);
            prefs.setString('authKey',loginResponse.data.authKey);
      emit(LoginState.success(loginResponse));
    }, failure: (error) {
      emit(LoginState.error(error: error.apiErrorModel.messages ?? ''));
    });
  }
}
