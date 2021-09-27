import 'package:bloc/bloc.dart';
import 'package:first_news_app/network/SP_Helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'AppStates.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  void changeAppMode({bool fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(AppChangeModeState());
    } else
      isDark = !isDark;

    SharedPreferencesHelper.setData(key: 'isDark', value: isDark).then((value) {
      emit(AppChangeModeState());
    });
  }
}