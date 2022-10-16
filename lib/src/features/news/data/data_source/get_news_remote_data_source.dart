import '../models/news_everything_model.dart';
import '../models/news_model.dart';
import '../../../../core/api_provider.dart';
import '../../../../core/constants.dart';

abstract class GetNewsRemoteDataSource {
  Future<NewsModel> getNews();
  Future<NewsEverythingModel> getNewsEverything();
}

class GetNewsRemoteDataSourceImpl implements GetNewsRemoteDataSource {
  final ApiProvider apiProvider;

  GetNewsRemoteDataSourceImpl({required this.apiProvider});

  @override
  Future<NewsModel> getNews() async {
    final Map<String, dynamic> jsonResponse =
    await apiProvider.get("top-headlines?language=en&page=1&apiKey=$newsApiKey");
    final data = NewsModel.fromJson(jsonResponse);
    return data;
  }

  Future<NewsEverythingModel> getNewsEverything() async {
    final Map<String, dynamic> jsonResponse =
    await apiProvider.get("everything?language=en&from=2022-10-16&sortBy=publishedAt&q=tesla&apiKey=$newsApiKey");
    final data = NewsEverythingModel.fromJson(jsonResponse);
    return data;
  }
}