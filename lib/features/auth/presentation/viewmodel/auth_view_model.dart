import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/common/my_snackbar.dart';
import '../../domain/entity/auth_entity.dart';
import '../../domain/usecases/auth_usecase.dart';
import '../navigator/login_navigator.dart';
import '../navigator/register_navigator.dart';
import '../state/auth_state.dart';

final authViewModelProvider = StateNotifierProvider<AuthViewModel, AuthState>(
  (ref) => AuthViewModel(
    ref.read(loginViewNavigatorProvider),
    ref.read(authUseCaseProvider),
    ref.read(registerViewNavigatorProvider),
  ),
);

class AuthViewModel extends StateNotifier<AuthState> {
  AuthViewModel(this.loginNavigator, this.authUseCase, this.registerNavigator)
      : super(AuthState.initial());
  final AuthUseCase authUseCase;
  final LoginViewNavigator loginNavigator;
  final RegisterViewNavigator registerNavigator;

  Future<String> registerUser(AuthEntity user) async {
    state = state.copyWith(isLoading: true);
    var data = await authUseCase.registerUser(user);
    return data.fold(
      (failure) {
        state = state.copyWith(
          isLoading: false,
          error: failure.error,
        );
        if (failure.error != null) {
          showMySnackBar(message: failure.error, color: Colors.red);
        }
        return "error";
      },
      (success) {
        state = state.copyWith(isLoading: false, error: null);
        showMySnackBar(message: "Successfully registered");
        return "success";
      },
    );
  }

  Future<void> loginUser(String email, String password) async {
    state = state.copyWith(isLoading: true);
    var data = await authUseCase.loginUser(email, password);
    data.fold(
      (failure) {
        state = state.copyWith(isLoading: false, error: failure.error);
        showMySnackBar(message: failure.error, color: Colors.red);
      },
      (success) {
        state = state.copyWith(isLoading: false, error: null);
        openHomeView();
      },
    );
  }

  void openRegisterView() {
    loginNavigator.openRegisterView();
  }

  void openHomeView() {
    loginNavigator.openHomeView();
  }

  void openLoginView() {
    registerNavigator.openLoginView();
  }
}
