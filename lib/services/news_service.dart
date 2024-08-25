import 'package:dio/dio.dart';
import 'package:news_app/models/articale_model.dart';

class NewsService {
  final Dio dio;

  NewsService(this.dio);
  Future<List<ArticaleModel>> getTopHeadlinesNews(
      {required String category}) async {
    try {
      Response response = await dio.get(
        'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=b048a144e76640028def241ae5ac3ceb',
      );
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articales = jsonData['articles'];
      List<ArticaleModel> articalesList = [];
      for (var articale in articales) {
        ArticaleModel articaleModel = ArticaleModel.fromJson(articale);
        articalesList.add(articaleModel);
      }
      return articalesList;
    } on Exception {
      return [];
    }
  }
}
