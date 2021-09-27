import 'package:first_news_app/cubit/AppCubit.dart';
import 'package:first_news_app/cubit/Cubit.dart';
import 'package:first_news_app/cubit/States.dart';
import 'package:first_news_app/moduels/Search/SearchPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "News World",
                style: Theme.of(context).textTheme.headline6,
              ),
              actions: [
                IconButton(icon: Icon(Icons.search),
                  onPressed:()=>{
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SearchPage()))
                },),
                IconButton(
                  icon: Icon(Icons.brightness_4_outlined,),
                  onPressed: () {
                    AppCubit.get(context).changeAppMode();
                  },
                ),
              ],
            ),
            body: cubit.pages[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeIndex(index);
              },
              items: cubit.bottomItems,
            ),
          );
        },);
  }
}
