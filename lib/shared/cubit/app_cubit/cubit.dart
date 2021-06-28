import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/modules/01-business_screen/business_screen.dart';
import 'package:news_app/modules/02-sports_screen/sports_screen.dart';
import 'package:news_app/modules/03-technology_screen/technology_screen.dart';
import 'package:news_app/shared/cubit/app_cubit/states.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitState());

  static AppCubit getInstance(context) => BlocProvider.of(context);

  int bottomNavCurrentIndex = 0;

  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    TechnologyScreen(),
  ];

  void changeBottomNavIndex(int index) {
    bottomNavCurrentIndex = index;
    emit(ChangeBottomNavIndexState());
  }

  List<ArticalModel> business = [];
  List<ArticalModel> sports = [];
  List<ArticalModel> technology = [];
  List<ArticalModel> search = [];

  void getBusinessData() {
    emit(GetBusinessDataLoadingState());

    if (business.length == 0) {
      DioHelper.init();
      DioHelper.getData(
        method: 'top-headlines',
        query: {
          'country': 'eg',
          'category': 'business',
          'apiKey': DioHelper.apiKey,
        },
      ).then((value) {
        List articles = value.data['articles'];
        articles.forEach((element) {
          if (element['description'] != null) {
            ArticalModel articalModel = ArticalModel.fromMap(element);
            business.add(articalModel);
          }
        });
        emit(GetBusinessDataSuccessState());
      }).catchError((error) {
        print(error);
        emit(GetBusinessDataFailState());
      });
    } else {
      emit(GetBusinessDataSuccessState());
    }
  }

  void getSportsData() {
    emit(GetSportsDataLoadingState());

    if (sports.length == 0) {
      DioHelper.init();
      DioHelper.getData(
        method: 'top-headlines',
        query: {
          'country': 'eg',
          'category': 'sports',
          'apiKey': DioHelper.apiKey,
        },
      ).then((value) {
        List articles = value.data['articles'];
        articles.forEach((element) {
          if (element['description'] != null) {
            sports.add(ArticalModel.fromMap(element));
          }
        });
        emit(GetSportsDataSuccessState());
      }).catchError((error) {
        print(error);
        emit(GetSportsDataFailState());
      });
    } else {
      emit(GetSportsDataSuccessState());
    }
  }

  void getTechnologyData() {
    emit(GetTechnologyDataLoadingState());

    if (technology.length == 0) {
      DioHelper.init();
      DioHelper.getData(
        method: 'top-headlines',
        query: {
          'country': 'eg',
          'category': 'technology',
          'apiKey': DioHelper.apiKey,
        },
      ).then((value) {
        List articles = value.data['articles'];
        articles.forEach((element) {
          if (element['description'] != null) {
            technology.add(ArticalModel.fromMap(element));
          }
        });
        emit(GetTechnologyDataSuccessState());
      }).catchError((error) {
        print(error);
        emit(GetTechnologyDataFailState());
      });
    } else {
      emit(GetTechnologyDataSuccessState());
    }
  }

  void searchWithName({required name}) {
    search = [];
    emit(GetSearchDataLoadingState());

    if (name.toString().trim().isNotEmpty) {
      DioHelper.init();
      DioHelper.getData(
        method: 'top-headlines',
        query: {
          'q': name,
          'country': 'eg',
          'apiKey': DioHelper.apiKey,
        },
      ).then((value) {
        List articles = value.data['articles'];
        articles.forEach((element) {
          if (element['description'] != null) {
            search.add(ArticalModel.fromMap(element));
          }
        });
        emit(GetSearchDataSuccessState());
      }).catchError((error) {
        print(error);
        emit(GetSearchDataFailState());
      });
    } else {
      emit(GetSearchDataSuccessState());
    }
  }
}
