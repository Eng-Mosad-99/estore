import 'package:ecommerce_route/domain/entities/requests/register_request.dart';
import 'package:ecommerce_route/domain/entities/response/auth_response.dart';
import 'package:ecommerce_route/domain/repositories/auth/auth_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class RegisterUseCase {
  final AuthRepo repo;

  RegisterUseCase({required this.repo});

  Future<AuthResponse> invoke(RegisterRequest registerRequest) {
    return repo.register(registerRequest);
  }
}
