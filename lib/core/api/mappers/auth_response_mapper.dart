import 'package:ecommerce_route/core/api/mappers/user_mapper.dart';
import 'package:ecommerce_route/core/api/models/response/auth_response_dto.dart';
import 'package:ecommerce_route/core/errors/app_exceptions.dart';
import 'package:ecommerce_route/domain/entities/response/auth_response.dart';

extension AuthResponseMapper on AuthResponseDto {
  AuthResponse toAuthResponseDto() {
    if (token != null || token!.isNotEmpty || user != null) {
      return AuthResponse(message: message, token: token, user: user!.toUser());
    } else {
      throw ServerException(message: 'Failed Authentication');
    }
  }
}
