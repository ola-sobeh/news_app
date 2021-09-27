import 'package:first_news_app/cubit/Cubit.dart';
import 'package:first_news_app/cubit/States.dart';
import 'package:first_news_app/ui/widget/ArticleLisetViewWidget.dart';
import 'package:first_news_app/ui/widget/defaultFormField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, states) {},
      builder: (context, states) {
        var list = NewsCubit.get(context).searchList;
        return Scaffold(
          appBar: AppBar(

          ),
            body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: CustomFormField(
                controller: searchController,
                type: TextInputType.text,
                onChange: (value) {
                  NewsCubit.get(context).getSearchList(value);
                },
                prefix: Icons.search,
                label: "search",
              ),
            ),
            Expanded(child: ArticleListViewWidget(list)),
          ],
        ));
      },
    );
  }
}
