import 'package:dio/dio.dart';
import 'package:ecommerce_route/core/config/di.dart';
import 'package:ecommerce_route/core/errors/app_exceptions.dart';
import 'package:ecommerce_route/domain/entities/requests/register_request.dart';
import 'package:ecommerce_route/domain/use_cases/register_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../auth_states.dart';
@injectable
class RegisterCubit extends Cubit<AuthStates> {
  RegisterCubit(this.registerUseCase) : super(AuthInitialState());

  final RegisterUseCase registerUseCase ;
  var formKey = GlobalKey<FormState>();
  register(
    String email,
    String password,
    String name,
    String phone,
    String rePassword,
  ) async {
    try {
      if (formKey.currentState?.validate() == true) {
        emit(AuthLoadingState());
        var response = await registerUseCase.invoke(
          RegisterRequest(
            email: email,
            password: password,
            name: name,
            phone: phone,
            rePassword: rePassword,
          ),
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
