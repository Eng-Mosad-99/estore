// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

import '../../data/data_sources/remote/auth_remote_data_source.dart' as _i865;
import '../../data/repositories/auth_repo_impl.dart' as _i653;
import '../../domain/repositories/auth/auth_repo.dart' as _i628;
import '../../domain/use_cases/login_use_case.dart' as _i471;
import '../../domain/use_cases/register_use_case.dart' as _i479;
import '../../features/ui/auth/login/cubit/login_cubit.dart' as _i209;
import '../../features/ui/auth/register/cubit/register_cubit.dart' as _i547;
import '../api/api_service.dart' as _i299;
import '../api/data_sources/remote/auth_remote_data_source_impl.dart' as _i668;
import '../api/dio/dio_module.dart' as _i223;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final getItModule = _$GetItModule();
    gh.singleton<_i361.BaseOptions>(() => getItModule.provideBaseOptions());
    gh.singleton<_i528.PrettyDioLogger>(
      () => getItModule.providePrettyDioLogger(),
    );
    gh.singleton<_i361.Dio>(
      () => getItModule.provideDio(
        gh<_i361.BaseOptions>(),
        gh<_i223.CustomDioLogger>(),
      ),
    );
    gh.singleton<_i299.ApiService>(
      () => getItModule.provideApiService(gh<_i361.Dio>()),
    );
    gh.factory<_i865.AuthRemoteDataSource>(
      () => _i668.AuthRemoteDataSourceImpl(apiService: gh<_i299.ApiService>()),
    );
    gh.factory<_i628.AuthRepo>(
      () => _i653.AuthRepoImpl(
        remoteDataSource: gh<_i865.AuthRemoteDataSource>(),
      ),
    );
    gh.factory<_i471.LoginUseCase>(
      () => _i471.LoginUseCase(repo: gh<_i628.AuthRepo>()),
    );
    gh.factory<_i479.RegisterUseCase>(
      () => _i479.RegisterUseCase(repo: gh<_i628.AuthRepo>()),
    );
    gh.factory<_i547.RegisterCubit>(
      () => _i547.RegisterCubit(gh<_i479.RegisterUseCase>()),
    );
    gh.factory<_i209.LoginCubit>(
      () => _i209.LoginCubit(gh<_i471.LoginUseCase>()),
    );
    return this;
  }
}

class _$GetItModule extends _i223.GetItModule {}
