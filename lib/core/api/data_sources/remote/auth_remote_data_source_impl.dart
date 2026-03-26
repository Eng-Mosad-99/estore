import 'package:ecommerce_route/core/api/api_service.dart';
import 'package:ecommerce_route/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:ecommerce_route/domain/entities/requests/login_request.dart';
import 'package:ecommerce_route/domain/entities/requests/register_request.dart';
import 'package:ecommerce_route/domain/entities/response/auth_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiService apiService;
  AuthRemoteDataSourceImpl({required this.apiService});

  @override
  Future<AuthResponse> login(LoginRequest loginRequest) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<AuthResponse> register(RegisterRequest registerRequest) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
