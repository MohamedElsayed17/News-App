import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/04-search_screen/search_screen.dart';
import 'package:news_app/shared/cubit/theme_cubit/app_theme_cubit.dart';
import 'package:news_app/shared/cubit/app_cubit/cubit.dart';
import 'package:news_app/shared/cubit/app_cubit/states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppCubit.getInstance(context).getBusinessData();
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit appCubit = AppCubit.getInstance(context);

          return Scaffold(
            appBar: AppBar(
              title: Text('News App'),
              titleTextStyle: Theme.of(context).textTheme.headline6,
              textTheme: Theme.of(context).textTheme,
              systemOverlayStyle:
                  Theme.of(context).appBarTheme.systemOverlayStyle,
              actions: [
                IconButton(
                  onPressed: () {
                    AppThemeCubit.getInstance(context).changeAppMode();
                  },
                  icon: Icon(
                    Icons.brightness_medium_outlined,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchScreen(),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.search,
                  ),
                ),
              ],
            ),
            body: appCubit.screens[appCubit.bottomNavCurrentIndex],
            bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.business_center_outlined),
                  label: 'business',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.sports_esports),
                  label: 'sports',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.mobile_friendly_rounded),
                  label: 'Technology',
                ),
              ],
              type: BottomNavigationBarType.fixed,
              elevation: 12.0,
              onTap: (index) {
                appCubit.changeBottomNavIndex(index);
              },
              currentIndex: appCubit.bottomNavCurrentIndex,
            ),
          );
        });
  }
}
