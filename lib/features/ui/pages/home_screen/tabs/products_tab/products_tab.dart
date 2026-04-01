import 'dart:developer';

import 'package:ecommerce_route/core/config/di.dart';
import 'package:ecommerce_route/features/ui/pages/home_screen/tabs/products_tab/cubit/product_tab_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/app_routes.dart';
import '../../../../widgets/main_error_widget.dart';
import '../../../../widgets/main_loading_widget.dart';
import '../../../../widgets/product_tab_item.dart';
import 'cubit/product_tab_state.dart';

class ProductsTab extends StatefulWidget {
  const ProductsTab({super.key});

  @override
  State<ProductsTab> createState() => _ProductsTabState();
}

class _ProductsTabState extends State<ProductsTab> {
  ProductTabCubit cubit = getIt<ProductTabCubit>();

  @override
  void initState() {
    cubit.getAllProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<ProductTabCubit, ProductTabState>(
            bloc: cubit,
            builder: (context, state) {
              if (state is ProductSuccess) {
                log(state.products!.length.toString());
                return Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 3.h,
                      crossAxisSpacing: 16.w,
                      mainAxisSpacing: 16.h,
                    ),
                    itemCount: state.products!.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          //todo: navigate to product details screen
                          Navigator.pushNamed(context, AppRoutes.productRoute , arguments: state.products![index]);
                        },
                        child: ProductTabItem(product: state.products![index]),
                      );
                    },
                  ),
                );
              } else if (state is ProductError) {
                return MainErrorWidget(
                  errorMessage: state.errorMsg,
                  onPressed: () {
                    cubit.getAllProducts();
                  },
                );
              } else {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 200.h),
                  child: const MainLoadingWidget(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
