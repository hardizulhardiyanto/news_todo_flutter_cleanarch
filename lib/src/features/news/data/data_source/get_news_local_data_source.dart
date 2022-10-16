import 'package:get_storage/get_storage.dart';
import 'package:todo_app/src/features/news/data/models/news_everything_model.dart';

import '../models/news_model.dart';

abstract class GetNewsLocalDataSource {
  Future<NewsModel> getCachedNews();
  Future<NewsEverythingModel> getCachedNewsEverything();

  Future<void> cacheNews(NewsModel cacheNews);
  Future<void> cachedNewsEverything(NewsEverythingModel cacheNews);
}

class GetNewsLocalDataSourceImpl implements GetNewsLocalDataSource {
  GetNewsLocalDataSourceImpl({required this.localStorage});

  final GetStorage localStorage;

  @override
  Future<void> cacheNews(cacheNews) {
    return localStorage.write("news", cacheNews.toJson());
  }
  Future<void> cachedNewsEverything(cacheNews) {
    return localStorage.write("newseverything", cacheNews.toJson());
  }

  @override
  Future<NewsModel> getCachedNews() {
    final jsonNews = localStorage.read("news");
    if (jsonNews != null) {
      return Future.value(NewsModel.fromJson(jsonNews));
    } else {
      throw "Cache Error";
    }
  }

  Future<NewsEverythingModel> getCachedNewsEverything() {
    final jsonNews = localStorage.read("newseverything");
    if (jsonNews != null) {
      return Future.value(NewsEverythingModel.fromJson(jsonNews));
    } else {
      throw "Cache Error";
    }
  }
}
