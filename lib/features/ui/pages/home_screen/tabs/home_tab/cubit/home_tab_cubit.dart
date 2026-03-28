import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_tab_state.dart';

class HomeTabCubit extends Cubit<HomeTabState> {
  HomeTabCubit() : super(HomeTabInitial());
}
