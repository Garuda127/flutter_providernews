import 'package:flutter/material.dart';
import 'package:flutter_providernews/src/models/category_model.dart';
import 'package:flutter_providernews/src/models/news_models.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

const _urlNews = 'https://newsapi.org/v2';
const _apiKey = 'e4caeb3b4c564c20aa2112cbc5a149a9';

class NewsServices extends ChangeNotifier {
  List<Article> headlines = [];
  String _selectectCategory = 'business';
  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.building, 'health'),
    Category(FontAwesomeIcons.volleyball, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];

  Map<String, List<Article>> categoryArticles = {};

  NewsServices() {
    getTopHeadlines();
    for (var element in categories) {
      categoryArticles[element.name] = [];
    }
  }

  getTopHeadlines() async {
    const url = '$_urlNews/top-headlines?country=mx&apiKey=$_apiKey';
    final res = await http.get(Uri.parse(url));
    final newsResponse = NewsResponse.fromJson(res.body);
    headlines.addAll(newsResponse.articles);
    notifyListeners();
  }

  String get selectectCategory => _selectectCategory;
  set selectectCategory(String category) {
    _selectectCategory = category;
    getArticlesByCategory(category);
    notifyListeners();
  }

  getArticlesByCategory(String category) async {
    if (categoryArticles[category]!.isNotEmpty) {
      return categoryArticles[category];
    }
    final url =
        '$_urlNews/top-headlines?country=mx&apiKey=$_apiKey&category=$category';
    final res = await http.get(Uri.parse(url));
    final newsResponse = NewsResponse.fromJson(res.body);
    categoryArticles[category]!.addAll(newsResponse.articles);
    notifyListeners();
  }

  List<Article> get getArticlesCategorySelected =>
      categoryArticles[selectectCategory]!;
}
