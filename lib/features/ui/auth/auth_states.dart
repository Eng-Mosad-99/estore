import 'package:ecommerce_route/domain/entities/response/auth_response.dart';

abstract class AuthStates {}

final class AuthInitialState extends AuthStates {}

final class AuthLoadingState extends AuthStates {}

final class AuthErrorState extends AuthStates {
  final String errorMsg;

  AuthErrorState({required this.errorMsg});
}

final class AuthSuccessState extends AuthStates {
  final AuthResponse authResponse;
  AuthSuccessState({required this.authResponse});
}
