import 'package:ecommerce_route/domain/entities/requests/login_request.dart';
import 'package:ecommerce_route/domain/entities/response/auth_response.dart';
import 'package:ecommerce_route/domain/repositories/auth/auth_repo.dart';

class LoginUseCase {
  final AuthRepo repo;

  LoginUseCase({required this.repo});

  Future<AuthResponse> invoke(LoginRequest loginRequest) {
    return repo.login(loginRequest);
  }
}