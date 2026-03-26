import 'package:ecommerce_route/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:ecommerce_route/domain/entities/requests/login_request.dart';
import 'package:ecommerce_route/domain/entities/requests/register_request.dart';
import 'package:ecommerce_route/domain/entities/response/auth_response.dart';
import 'package:ecommerce_route/domain/repositories/auth/auth_repo.dart';

class AuthRepoImpl implements AuthRepo{
  final AuthRemoteDataSource remoteDataSource;

  AuthRepoImpl({required this.remoteDataSource});

  @override
  Future<AuthResponse> login(LoginRequest loginRequest) {
    return remoteDataSource.login(loginRequest);
  }

  @override
  Future<AuthResponse> register(RegisterRequest registerRequest) {
    return remoteDataSource.register(registerRequest);
  }
}