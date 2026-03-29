import 'package:ecommerce_route/core/errors/app_exceptions.dart';
import 'package:ecommerce_route/core/utils/app_assets.dart';
import 'package:ecommerce_route/domain/use_cases/brands/brands_use_case.dart';
import 'package:ecommerce_route/domain/use_cases/category/category_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'home_tab_state.dart';

@injectable
class HomeTabCubit extends Cubit<HomeTabState> {
  HomeTabCubit(this.categoryUseCase, this.brandsUseCase)
    : super(HomeTabInitial());
  final CategoryUseCase categoryUseCase;
  final BrandsUseCase brandsUseCase;
  List<String> sliderImages = [
    AppAssets.announcement1,
    AppAssets.announcement2,
    AppAssets.announcement3,
  ];
  HomeTabSuccessState successState = HomeTabSuccessState();
  getAllCategories() async {
    try {
      emit(CategoryLoading());
      var response = await categoryUseCase.invoke();

      // emit(CategoryLoaded(categories: response ?? []));
      emit(successState=successState.copyWith(categories: response));
    } on AppException catch (e) {
      print(e);
      emit(CategoryError(errorMsg: e.message));
    } catch (e) {
      emit(CategoryError(errorMsg: e.toString()));
    }
  }

  getAllBrands() async {
    try {
      emit(BrandsLoading());
      var response = await brandsUseCase.invoke();

      emit(successState = successState.copyWith(brands: response));
      // emit(BrandsLoaded(brands: response ?? []));
    } on AppException catch (e) {
      print(e);
      emit(BrandsError(errorMsg: e.message));
    } catch (e) {
      emit(BrandsError(errorMsg: e.toString()));
    }
  }
}
