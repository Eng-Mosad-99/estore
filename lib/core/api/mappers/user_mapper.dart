import 'package:ecommerce_route/core/api/models/response/user_dto.dart';
import 'package:ecommerce_route/domain/entities/response/user.dart';

extension UserMapper on UserDto{
  User toUser () {
    return User(
      name: name,
      email: email
    );
  }
}