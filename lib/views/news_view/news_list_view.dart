import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:news_app/views/news_view/components/news_error.dart';

import 'package:news_app/views/news_view/components/news_shimmer.dart';
import 'package:news_app/models/news_resp.dart';
import 'package:news_app/viewmodels/news_viewmodel.dart';
import 'package:news_app/views/news_view/components/news_detail.dart';
import 'package:provider/provider.dart';

class NewsListView extends StatefulWidget {
  const NewsListView({super.key});

  @override
  State<NewsListView> createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView> {
  @override
  void initState() {
    super.initState();

    Provider.of<NewsViewmodel>(context, listen: false).initController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: Consumer<NewsViewmodel>(
        builder: (context, newsVm, child) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "News.",
                  style:
                      TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: PagedListView<int, Article>.separated(
                    separatorBuilder: ((context, index) {
                      return const Divider();
                    }),
                    padding: EdgeInsets.zero,
                    pagingController: newsVm.pagingController,
                    builderDelegate: PagedChildBuilderDelegate<Article>(
                      animateTransitions: true,
                      firstPageErrorIndicatorBuilder: (context) {
                        return NewsError(
                          message: newsVm.pagingController.error,
                          onTryAgain: () {
                            newsVm.pagingController.refresh();
                          },
                        );
                      },
                      firstPageProgressIndicatorBuilder: (context) {
                        return Column(
                          children:
                              List.generate(9, (index) => const NewsShimmer()),
                        );
                      },
                      itemBuilder: (context, article, index) =>
                          NewsDetail(article: article),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    ));
  }
}
