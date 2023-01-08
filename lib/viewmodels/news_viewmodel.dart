import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:news_app/models/news_resp.dart';
import 'package:news_app/services/news_service.dart';

class NewsViewmodel extends ChangeNotifier {
  final PagingController<int, Article> pagingController =
      PagingController(firstPageKey: 1);
  initController() {
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final response =
          await NewsService().getNews(pageNumber: pageKey.toString());
      NewsRespModel respModel = NewsRespModel.fromJson(response);
      List<Article> newItems = respModel.articles!;

      final isLastPage = newItems.length == (respModel.totalResults ?? 0);
      if (isLastPage) {
        pagingController.appendLastPage(newItems);
      } else {
        int nextPage = (pagingController.nextPageKey ?? 0.toInt()) + 1;
        pagingController.appendPage(newItems, nextPage);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }
}
