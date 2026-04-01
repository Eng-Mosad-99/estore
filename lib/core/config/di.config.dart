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
import '../../data/data_sources/remote/brand_remote_data_source.dart' as _i114;
import '../../data/data_sources/remote/category_remote_data_source.dart'
    as _i344;
import '../../data/data_sources/remote/product_remote_data_source.dart'
    as _i189;
import '../../data/repositories/auth_repo_impl.dart' as _i653;
import '../../data/repositories/brand_repo_impl.dart' as _i78;
import '../../data/repositories/category_repo_impl.dart' as _i65;
import '../../data/repositories/product_repo_impl.dart' as _i953;
import '../../domain/repositories/auth/auth_repo.dart' as _i628;
import '../../domain/repositories/brands/brands_repositories.dart' as _i153;
import '../../domain/repositories/category/categories_repositories.dart'
    as _i513;
import '../../domain/repositories/products/products_repositories.dart' as _i668;
import '../../domain/use_cases/brands/brands_use_case.dart' as _i532;
import '../../domain/use_cases/category/category_use_case.dart' as _i512;
import '../../domain/use_cases/login_use_case.dart' as _i471;
import '../../domain/use_cases/products/products_use_case.dart' as _i81;
import '../../domain/use_cases/register_use_case.dart' as _i479;
import '../../features/ui/auth/login/cubit/login_cubit.dart' as _i209;
import '../../features/ui/auth/register/cubit/register_cubit.dart' as _i547;
import '../../features/ui/pages/home_screen/cubit/home_cubit.dart' as _i1037;
import '../../features/ui/pages/home_screen/tabs/home_tab/cubit/home_tab_cubit.dart'
    as _i843;
import '../../features/ui/pages/home_screen/tabs/products_tab/cubit/product_tab_cubit.dart'
    as _i750;
import '../api/api_service.dart' as _i299;
import '../api/data_sources/remote/auth/auth_remote_data_source_impl.dart'
    as _i983;
import '../api/data_sources/remote/brands/brands_remote_data_source_impl.dart'
    as _i948;
import '../api/data_sources/remote/category/category_remote_data_source_impl.dart'
    as _i942;
import '../api/data_sources/remote/products/product_remote_data_source_impl.dart'
    as _i148;
import '../api/dio/dio_module.dart' as _i223;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final getItModule = _$GetItModule();
    gh.factory<_i1037.HomeCubit>(() => _i1037.HomeCubit());
    gh.singleton<_i361.BaseOptions>(() => getItModule.provideBaseOptions());
    gh.singleton<_i528.PrettyDioLogger>(
      () => getItModule.providePrettyDioLogger(),
    );
    gh.singleton<_i361.Dio>(
      () => getItModule.provideDio(
        gh<_i361.BaseOptions>(),
        gh<_i528.PrettyDioLogger>(),
      ),
    );
    gh.singleton<_i299.ApiService>(
      () => getItModule.provideApiService(gh<_i361.Dio>()),
    );
    gh.factory<_i344.CategoryRemoteDataSource>(
      () => _i942.CategoryRemoteDataSourceImpl(gh<_i299.ApiService>()),
    );
    gh.factory<_i189.ProductRemoteDataSource>(
      () => _i148.ProductRemoteDataSourceImpl(gh<_i299.ApiService>()),
    );
    gh.factory<_i114.BrandRemoteDataSource>(
      () => _i948.BrandsRemoteDataSourceImpl(gh<_i299.ApiService>()),
    );
    gh.factory<_i865.AuthRemoteDataSource>(
      () => _i983.AuthRemoteDataSourceImpl(apiService: gh<_i299.ApiService>()),
    );
    gh.factory<_i628.AuthRepo>(
      () => _i653.AuthRepoImpl(
        remoteDataSource: gh<_i865.AuthRemoteDataSource>(),
      ),
    );
    gh.factory<_i153.BrandsRepositories>(
      () => _i78.BrandRepoImpl(gh<_i114.BrandRemoteDataSource>()),
    );
    gh.factory<_i668.ProductsRepositories>(
      () => _i953.ProductRepoImpl(gh<_i189.ProductRemoteDataSource>()),
    );
    gh.factory<_i513.CategoriesRepositories>(
      () => _i65.CategoryRepoImpl(gh<_i344.CategoryRemoteDataSource>()),
    );
    gh.factory<_i512.CategoryUseCase>(
      () => _i512.CategoryUseCase(gh<_i513.CategoriesRepositories>()),
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
    gh.factory<_i532.BrandsUseCase>(
      () => _i532.BrandsUseCase(gh<_i153.BrandsRepositories>()),
    );
    gh.factory<_i81.ProductsUseCase>(
      () => _i81.ProductsUseCase(gh<_i668.ProductsRepositories>()),
    );
    gh.factory<_i843.HomeTabCubit>(
      () => _i843.HomeTabCubit(
        gh<_i512.CategoryUseCase>(),
        gh<_i532.BrandsUseCase>(),
      ),
    );
    gh.factory<_i750.ProductTabCubit>(
      () => _i750.ProductTabCubit(gh<_i81.ProductsUseCase>()),
    );
    gh.factory<_i209.LoginCubit>(
      () => _i209.LoginCubit(gh<_i471.LoginUseCase>()),
    );
    return this;
  }
}

class _$GetItModule extends _i223.GetItModule {}
