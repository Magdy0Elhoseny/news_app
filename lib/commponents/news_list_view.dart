import 'package:flutter/material.dart';
import 'package:news_app/commponents/news_post.dart';
import 'package:news_app/models/articale_model.dart';

class NewsListView extends StatelessWidget {
  final List<ArticaleModel> articales;

  const NewsListView({
    Key? key,
    required this.articales,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: articales.length,
        (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: NewsPost(
              articaleModel: articales[index],
            ),
          );
        },
      ),
    );
  }
}
