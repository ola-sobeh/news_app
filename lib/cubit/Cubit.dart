import 'package:first_news_app/cubit/States.dart';
import 'package:first_news_app/moduels/Sciences/SciencesPage.dart';
import 'package:first_news_app/moduels/Sport/SportPage.dart';
import 'package:first_news_app/moduels/business/BusinessPage.dart';
import 'package:first_news_app/network/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());
  int currentIndex = 0;

  static NewsCubit get(context) => BlocProvider.of(context);
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
        icon: Icon(Icons.sports_baseball),
        label: "sport"),
     BottomNavigationBarItem(
        icon: Icon(Icons.business_center),
         label: "business"),
    BottomNavigationBarItem(icon: Icon(Icons.science),
        label: "science")
  ];

  void changeIndex(int index) {
    currentIndex = index;

    /*if(index==0){
      getSportsList();
    }*/
    emit(NewsBottomNavState());
  }

  List<Widget> pages = [SportPage(), BusinessPage(), SciencePage()];
  List<dynamic> businessList = [];
  List<dynamic> scienceList = [];
  List<dynamic> sportsList = [];
  List<dynamic> searchList = [];

  getBusinessList() {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'business',
      'apiKey': '0c005525238d4732b3d41c761ca71206'
    }).then((value) {
      businessList = value.data['articles'];
      print(businessList[0]['title']+"title");
      emit(NewsGetBusinessSuccessState());
    });
  }
  getSportsList() {
    emit(NewsGetSportLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'sports',
      'apiKey': '0c005525238d4732b3d41c761ca71206'
    }).then((value) {
      sportsList = value.data['articles'];
      emit(NewsGetSportSuccessState());
    });
  }
  getScienceList() {
    emit(NewsGetScienceLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'science',
      'apiKey': '0c005525238d4732b3d41c761ca71206'
    }).then((value) {
      scienceList = value.data['articles'];
      emit(NewsGetScienceSuccessState());
    });
  }
  getSearchList(String value) {
    emit(NewsGetSearchLoadingState());
    searchList =[];
    DioHelper.getData(url: 'v2/everything',
        query: {
          'q': '$value',
           'apiKey': '0c005525238d4732b3d41c761ca71206'
        }).then((value) {
      searchList = value.data['articles'];
      emit(NewsGetSearchSuccessState());
    });
  }
}
