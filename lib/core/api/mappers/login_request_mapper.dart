import 'package:ecommerce_route/core/api/models/request/login_request_dto.dart';
import 'package:ecommerce_route/domain/entities/requests/login_request.dart';

extension LoginRequestMapper on LoginRequest {
  LoginRequestDto toLoginRequestDto() {
    return LoginRequestDto(email: email, password: password);
  }
}

