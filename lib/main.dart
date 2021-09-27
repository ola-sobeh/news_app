import 'package:first_news_app/ui/NewaLayout.dart';
import 'package:first_news_app/cubit/AppCubit.dart';
import 'package:first_news_app/cubit/AppStates.dart';
import 'package:first_news_app/network/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'cubit/Cubit.dart';
import 'network/SP_Helper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
   await SharedPreferencesHelper.int();
   bool isDark = SharedPreferencesHelper.getData(key: 'isDark');
  runApp(MyApp(isDark));
}
class MyApp extends StatelessWidget{
  final bool isDark;
  MyApp(this.isDark);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>NewsCubit()..getBusinessList()..getScienceList()..getSportsList(),),
        BlocProvider(create: (BuildContext context) => AppCubit()..changeAppMode(fromShared: isDark),)
      ],
        child: BlocConsumer<AppCubit,AppStates>(
          listener: (context,states){},
          builder: (context,states){
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  primarySwatch: Colors.red,
                  appBarTheme: AppBarTheme(
                    iconTheme: IconThemeData(color: Colors.black),
                    backwardsCompatibility: false,
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: Colors.white,
                        statusBarIconBrightness: Brightness.dark
                    ),
                    backgroundColor: Colors.white,
                  ),
                  bottomAppBarTheme: BottomAppBarTheme(
                    color: Colors.grey,
                  ),

                ),
                darkTheme: ThemeData(
                    scaffoldBackgroundColor: HexColor('333739'),
                    primarySwatch: Colors.red,
                    appBarTheme: AppBarTheme(
                      backwardsCompatibility: false,
                      systemOverlayStyle: SystemUiOverlayStyle(
                          statusBarColor: HexColor('333739'),
                          statusBarIconBrightness: Brightness.light
                      ),

                      backgroundColor: HexColor('333739'),

                    ),
                    bottomAppBarTheme: BottomAppBarTheme(
                      color: Colors.grey,
                    ),
                    iconTheme: IconThemeData(
                        color: Colors.white
                    ),
                    bottomNavigationBarTheme : BottomNavigationBarThemeData(
                      backgroundColor:  HexColor('333739'),
                      selectedItemColor: Colors.deepOrange,
                      unselectedItemColor: Colors.grey,
                    ),
                    textTheme: TextTheme(
                        bodyText1: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white
                        ),
                      headline6: TextStyle(
                          color: Colors.white
                      )
                    )
                ),
                themeMode: AppCubit.get(context).isDark?ThemeMode.dark:ThemeMode.light,
                home: NewsLayout());
          },
        ) ,
    );


  }

}