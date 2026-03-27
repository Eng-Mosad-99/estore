import 'package:dio/dio.dart';
import 'package:ecommerce_route/core/errors/app_exceptions.dart';
import 'package:ecommerce_route/domain/entities/requests/login_request.dart';
import 'package:ecommerce_route/domain/use_cases/login_use_case.dart';
import 'package:ecommerce_route/features/ui/auth/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginCubit extends Cubit<AuthStates> {
  LoginCubit(this.loginUseCase) : super(AuthInitialState());
  final LoginUseCase loginUseCase;
  var formKey = GlobalKey<FormState>();
  login(String email, String password) async {
    try {
      if (formKey.currentState?.validate() == true) {
        emit(AuthLoadingState());
        var response = await loginUseCase.invoke(
          LoginRequest(email: email, password: password),
        );

        emit(AuthSuccessState(authResponse: response));
      }
    } on AppException catch (e) {
      emit(AuthErrorState(errorMsg: e.message));
    } on DioException catch (e) {
      final message = (e.error is AppException)
          ? (e.error as AppException).message
          : 'Unexpected Error Occurred';

      emit(AuthErrorState(errorMsg: message));
    }
  }
}

/// view ==> Object ViewModel
/// viewModel ==> Object UseCase
/// useCase ==> Object Repository
/// repository ==> Object dataSource
/// dataSource ==> Object apiService
