import 'package:news_app/models/news_resp.dart';
import 'package:news_app/services/networking_service.dart/api_constants.dart';
import 'package:news_app/services/networking_service.dart/network_service.dart';
import 'package:news_app/utils/locator.dart';

abstract class NewsService {
  Future<NewsRespModel> getNews({required String pageNumber});
}

class NewsServiceImpl extends NewsService {
  final NetworkService _networkService = serviceLocator<NetworkService>();

  @override
  Future<NewsRespModel> getNews({required String pageNumber}) async {
    final response = await _networkService.getData(
        url: "${ApiConstants.newsUrl}&page=$pageNumber");
    return NewsRespModel.fromJson(response);
  }
}
