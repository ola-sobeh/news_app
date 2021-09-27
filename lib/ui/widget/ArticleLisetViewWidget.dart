import 'package:conditional_builder/conditional_builder.dart';
import 'package:first_news_app/cubit/Cubit.dart';
import 'package:first_news_app/cubit/States.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ArticleWidget.dart';

class ArticleListViewWidget extends StatelessWidget {
  List articleList;

  ArticleListViewWidget(this.articleList);

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: articleList.length > 0,
      builder: (context) => ListView.separated(
          itemBuilder: (context, index) => ArticleWidget(articleList[index]),
          separatorBuilder: (context, index) => Divider(height:10),
          itemCount: 10),
      fallback: (context) => Center(child: CircularProgressIndicator()),
    );
  }
}
