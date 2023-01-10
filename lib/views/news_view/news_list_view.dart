import 'package:flutter/material.dart';

import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

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
              children: [
                Expanded(
                  child: PagedListView<int, Article>(
                    padding: EdgeInsets.zero,
                    pagingController: newsVm.pagingController,
                    builderDelegate: PagedChildBuilderDelegate<Article>(
                      animateTransitions: true,
                      firstPageProgressIndicatorBuilder: (context) {
                        return Column(
                          children:
                              List.generate(8, (index) => const NewsShimmer()),
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
