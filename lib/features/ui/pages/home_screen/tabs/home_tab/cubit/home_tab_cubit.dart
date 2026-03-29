import 'package:ecommerce_route/core/errors/app_exceptions.dart';
import 'package:ecommerce_route/core/utils/app_assets.dart';
import 'package:ecommerce_route/domain/use_cases/category/category_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'home_tab_state.dart';

@injectable
class HomeTabCubit extends Cubit<HomeTabState> {
  HomeTabCubit(this.categoryUseCase) : super(HomeTabInitial());
  final CategoryUseCase categoryUseCase;
  List<String> sliderImages = [
    AppAssets.announcement1,
    AppAssets.announcement2,
    AppAssets.announcement3,
  ];

  getAllCategories() async {
    try {
      emit(CategoryLoading());
      var response = await categoryUseCase.invoke();

      emit(CategoryLoaded(categories: response ?? []));
    } on AppException catch (e) {
      print(e); 
      emit(CategoryError(errorMsg: e.message));
    }
  }
}
