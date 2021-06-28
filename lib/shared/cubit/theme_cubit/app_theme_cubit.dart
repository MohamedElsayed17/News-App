import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/theme_cubit/app_theme_states.dart';
import 'package:news_app/shared/network/local/shared_pref_helper.dart';

class AppThemeCubit extends Cubit<AppThemeStates> {
  AppThemeCubit() : super(InitialAppThemeState());

  static AppThemeCubit getInstance(context) => BlocProvider.of(context);

  bool isDark = false;
  void changeAppMode() {
    SharedPrefHelper.init();
    SharedPrefHelper.setBoolean(key: 'isDark', value: !isDark).then((value) {
      isDark = !isDark;
      emit(SetDarkModeSuccessState());
    }).catchError((error) {
      print(error);
      emit(SetDarkModeFailState());
    });
  }

  void getAppMode() {
    SharedPrefHelper.init().then((value) {
      isDark = SharedPrefHelper.getBoolean(key: 'isDark');
      emit(GetDarkModeSuccessState());
    });
  }
}
