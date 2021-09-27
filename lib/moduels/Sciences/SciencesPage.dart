import 'package:first_news_app/cubit/Cubit.dart';
import 'package:first_news_app/cubit/States.dart';
import 'package:first_news_app/ui/widget/ArticleLisetViewWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SciencePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).scienceList;
        return ArticleListViewWidget(list);
      },
    );
  }
}
