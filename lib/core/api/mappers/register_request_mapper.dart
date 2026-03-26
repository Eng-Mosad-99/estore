import 'package:ecommerce_route/core/api/models/request/register_request_dto.dart';
import 'package:ecommerce_route/domain/entities/requests/register_request.dart';

extension RegisterRequestMapper on RegisterRequest {
  RegisterRequestDto toRegisterRequestDto(){
    return RegisterRequestDto(
      name: name,
      email: email,
      password: password,
      phone: phone,
      rePassword: rePassword,
    );
  }
}