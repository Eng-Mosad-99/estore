import 'package:ecommerce_route/core/errors/app_exceptions.dart';
import 'package:ecommerce_route/domain/use_cases/products/products_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'product_tab_state.dart';

@injectable
class ProductTabCubit extends Cubit<ProductTabState> {
  ProductTabCubit(this.productsUseCase) : super(ProductTabInitial());
  final ProductsUseCase productsUseCase;

  getAllProducts() async {
    try {
      emit(ProductLoading());
      var response = await productsUseCase.invoke();

      emit(ProductSuccess(products: response ?? []));
    } on AppException catch (e) {
      print(e);
      emit(ProductError(errorMsg: e.message));
    } catch (e) {
      emit(ProductError(errorMsg: e.toString()));
    }
  }
}
