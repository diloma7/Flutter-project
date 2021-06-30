import 'dart:convert';
// import 'dart:io';

import 'package:infos_app/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> aModel = [];

  Future<void> getNews() async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=za&category=business&apiKey=73b0ccbdff3b47aabd6b3d5ec0e2fb3c";

    var response = await http.get(Uri.encodeFull(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
              title: element['title'],
              author: element["author"],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              content: element['context']);

          // print(articleModel);
          aModel.add(articleModel);
        }
      });
    }
  }
}

class CategoriesNews {
  List<ArticleModel> aModel = [];

  Future<void> getNews(String category) async {
    String url =
        "http://newsapi.org/v2/top-headlines?category=$category&country=za&category=business&apiKey=73b0ccbdff3b47aabd6b3d5ec0e2fb3c";

    var response = await http.get(Uri.encodeFull(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
              title: element['title'],
              author: element["author"],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              content: element['context']);

          // print(articleModel);
          aModel.add(articleModel);
        }
      });
    }
  }
}
