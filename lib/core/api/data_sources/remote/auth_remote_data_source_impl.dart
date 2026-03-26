import 'package:ecommerce_route/core/api/api_service.dart';
import 'package:ecommerce_route/core/api/mappers/auth_response_mapper.dart';
import 'package:ecommerce_route/core/api/mappers/login_request_mapper.dart';
import 'package:ecommerce_route/core/api/mappers/register_request_mapper.dart';
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
  Future<AuthResponse> login(LoginRequest loginRequest) async {
    //! TODO: LoginRequest ====> LoginRequestDto
    var authResponse = await apiService.login(loginRequest.toLoginRequestDto());

    //! TODO: AuthResponse ====> AuthResponseDto
    return authResponse.toAuthResponseDto();
  }

  @override
  Future<AuthResponse> register(RegisterRequest registerRequest) async {
    //! TODO: RegisterRequest ====> RegisterRequestDto

    var response = await apiService.register(
      registerRequest.toRegisterRequestDto(),
    );
    //! TODO: AuthResponse ====> AuthResponseDto
    return response.toAuthResponseDto();
  }
}
