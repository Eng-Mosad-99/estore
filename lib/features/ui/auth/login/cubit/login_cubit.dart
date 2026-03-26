import 'package:ecommerce_route/domain/entities/requests/login_request.dart';
import 'package:ecommerce_route/domain/use_cases/login_use_case.dart';
import 'package:ecommerce_route/features/ui/auth/auth_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginCubit extends Cubit<AuthStates> {
  LoginCubit(this.loginUseCase) : super(AuthInitialState());
final LoginUseCase loginUseCase;

  login(LoginRequest loginRequest) async{
    emit(AuthLoadingState());
    var response = await loginUseCase.invoke(loginRequest);
    if(response.message =='success'){
      emit(AuthSuccessState(authResponse: response));
    }else{
      emit(AuthErrorState(errorMsg: response.message??'Error in Login'));
    }
  }
}

/// view ==> Object ViewModel
/// viewModel ==> Object UseCase
/// useCase ==> Object Repository
/// repository ==> Object dataSource
/// dataSource ==> Object apiService