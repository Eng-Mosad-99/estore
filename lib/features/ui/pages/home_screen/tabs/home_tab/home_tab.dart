import 'package:ecommerce_route/core/config/di.dart';
import 'package:ecommerce_route/domain/entities/response/common/category_or_brand.dart';
import 'package:ecommerce_route/features/ui/pages/home_screen/tabs/home_tab/cubit/home_tab_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_styles.dart';
import '../../../../widgets/category_brand_item.dart';
import '../../../../widgets/main_error_widget.dart';
import '../../../../widgets/main_loading_widget.dart';
import 'cubit/home_tab_state.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  HomeTabCubit cubit = getIt<HomeTabCubit>();

@override
  void initState() {
    cubit.getAllBrands();
    cubit.getAllCategories();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.h),
          _buildAnnouncement(images: cubit.sliderImages),
          SizedBox(height: 24.h),
          _lineBreak(name: "Categories"),
          BlocBuilder<HomeTabCubit, HomeTabState>(
            bloc: cubit,
            // buildWhen: (previous, current) => current is CategoryLoaded||current is CategoryLoading|| current is CategoryError,
            builder: (context, state) {
              if (state is HomeTabSuccessState) {
                return _buildCategoryBrandSec(state.categories??[ ]);
              } else if (state is CategoryError) {
                return MainErrorWidget(
                  errorMessage: state.errorMsg,
                  onPressed: () {
                    cubit.getAllCategories();
                  },
                );
              } else {
                return const MainLoadingWidget();
              }
            },
          ),
          _lineBreak(name: "Brands"),
           BlocBuilder<HomeTabCubit, HomeTabState>(
            bloc: cubit,
            // buildWhen: (previous, current) => current is BrandsLoaded || current is BrandsLoading || current is BrandsError,
            builder: (context, state) {
              if (state is HomeTabSuccessState) {
                return _buildCategoryBrandSec(state.brands??[ ]);
              } else if (state is BrandsError) {
                return MainErrorWidget(
                  errorMessage: state.errorMsg,
                  onPressed: () {
                    cubit.getAllBrands();
                  },
                );
              } else {
                return const MainLoadingWidget();
              }
            },
          ),
        ],
      ),
    );
  }

  SizedBox _buildCategoryBrandSec(List<CategoryOrBrand> categoriesOrBrands) {
    return SizedBox(
      height: 270.h,
      width: double.infinity,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16.h,
          crossAxisSpacing: 16.w,
        ),
        itemCount: categoriesOrBrands.length,
        scrollDirection: Axis.horizontal,
        physics: const ScrollPhysics(),
        itemBuilder: (context, index) {
          return CategoryBrandItem(categoryOrBrand: categoriesOrBrands[index]);
        },
      ),
    );
  }

  ImageSlideshow _buildAnnouncement({required List<String> images}) {
    return ImageSlideshow(
      indicatorColor: AppColors.primaryColor,
      initialPage: 0,
      indicatorBottomPadding: 15.h,
      indicatorPadding: 8.w,
      indicatorRadius: 5,
      indicatorBackgroundColor: AppColors.whiteColor,
      isLoop: true,
      autoPlayInterval: 3000,
      height: 190.h,
      children: images.map((url) {
        return Image.asset(url, fit: BoxFit.fill);
      }).toList(),
    );
  }

  Widget _lineBreak({required String name}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name, style: AppStyles.medium18Header),
        TextButton(
          onPressed: () {
            //todo: navigate to all
          },
          child: Text("View All", style: AppStyles.regular12Text),
        ),
      ],
    );
  }
}
