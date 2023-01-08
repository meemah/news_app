import 'package:news_app/services/networking_service.dart/network_service.dart';

class NewsService {
  getNews({required String pageNumber}) async {
    return await NetworkClient().getData(
        url:
            "https://newsapi.org/v2/everything?q=Apple&from=2023-01-07&sortBy=popularity&apiKey=7ad604ca29d24895b27feea29777cd47&page=$pageNumber&pageSize=10");
  }
}
