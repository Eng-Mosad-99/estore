

import 'package:ecommerce_route/features/ui/pages/home_screen/cubit/home_state.dart';
import 'package:ecommerce_route/features/ui/pages/home_screen/tabs/favorite_tab/favorite_tab.dart';
import 'package:ecommerce_route/features/ui/pages/home_screen/tabs/home_tab/home_tab.dart';
import 'package:ecommerce_route/features/ui/pages/home_screen/tabs/products_tab/products_tab.dart';
import 'package:ecommerce_route/features/ui/pages/home_screen/tabs/user_tab/user_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  //! hold data , handle logic

   int selectedIndex = 0;
  List<Widget> bodyList = [
    const HomeTab(),
    ProductsTab(),
    FavoriteTab(),
    const UserTab()
  ];

  void bottomNavOnTap(int index) {
    selectedIndex = index;
    emit(BottomNavOnTapState());
  }
}
