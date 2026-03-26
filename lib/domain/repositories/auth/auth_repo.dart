import 'package:ecommerce_route/domain/entities/requests/login_request.dart';
import 'package:ecommerce_route/domain/entities/requests/register_request.dart';
import 'package:ecommerce_route/domain/entities/response/auth_response.dart';

abstract class AuthRepo {
  Future<AuthResponse> login(LoginRequest loginRequest);
  
  Future<AuthResponse> register(RegisterRequest registerRequest);

}