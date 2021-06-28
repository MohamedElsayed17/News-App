import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/layout.dart';
import 'package:news_app/shared/cubit/theme_cubit/app_theme_cubit.dart';
import 'package:news_app/shared/cubit/theme_cubit/app_theme_states.dart';
import 'package:news_app/shared/cubit/app_cubit/cubit.dart';
import 'package:news_app/shared/cubit/observer.dart';
import 'package:news_app/shared/styles/themes.dart';

void main() {
  Bloc.observer = MyBlocObserver();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit()
            ..getBusinessData()
            ..getSportsData()
            ..getTechnologyData(),
        ),
        BlocProvider(create: (context) => AppThemeCubit()..getAppMode())
      ],
      child: BlocConsumer<AppThemeCubit, AppThemeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: AppThemeCubit.getInstance(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}

/// ```
/// NAME         SIZE  WEIGHT  SPACING
/// headline1    96.0  light   -1.5
/// headline2    60.0  light   -0.5
/// headline3    48.0  regular  0.0
/// headline4    34.0  regular  0.25
/// headline5    24.0  regular  0.0
/// headline6    20.0  medium   0.15
/// subtitle1    16.0  regular  0.15
/// subtitle2    14.0  medium   0.1
/// body1        16.0  regular  0.5   (bodyText1)
/// body2        14.0  regular  0.25  (bodyText2)
/// button       14.0  medium   1.25
/// caption      12.0  regular  0.4
/// overline     10.0  regular  1.5
/// ```
