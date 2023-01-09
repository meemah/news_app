import 'package:news_app/services/networking_service.dart/network_service.dart';
import 'package:news_app/utils/locator.dart';

abstract class NewsService {
  getNews({required String pageNumber});
}

class NewsServiceImpl extends NewsService {
  final NetworkService _networkService = serviceLocator<NetworkService>();

  @override
  getNews({required String pageNumber}) async {
    return await _networkService.getData(
        url:
            "https://newsapi.org/v2/everything?q=Business+Tech+Startup&sortBy=popularity&apiKey=7ad604ca29d24895b27feea29777cd47&page=$pageNumber&pageSize=10");
  }
}
