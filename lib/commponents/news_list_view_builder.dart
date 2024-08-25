// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:news_app/commponents/news_list_view.dart';
import 'package:news_app/models/articale_model.dart';
import 'package:news_app/services/news_service.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({
    Key? key,
    required this.category,
  }) : super(key: key);
  final String category;
  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  dynamic future;
  @override
  void initState() {
    super.initState();
    future = NewsService(Dio()).getTopHeadlinesNews(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticaleModel>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NewsListView(
              articales: snapshot.data!,
            );
          } else if (snapshot.hasError) {
            return const SliverToBoxAdapter(
              child: Text('oops there was an error, try later'),
            );
          } else {
            return const SliverToBoxAdapter(
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.orange,
                ),
              ),
            );
          }
        });
  }
}
