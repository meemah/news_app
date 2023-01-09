import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/custom_widgets/custom_spacing.dart';
import 'package:news_app/utils/routes/route_names.dart';

import '../../../models/news_resp.dart';

class NewsDetail extends StatelessWidget {
  final Article article;
  const NewsDetail({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, AppRoutes.webview,
            arguments: article.url),
        child: Row(
          children: [
            Image.network(
              article.urlToImage ?? "",
              height: 80.h,
              width: 80.w,
              cacheHeight: 80,
              errorBuilder: (context, error, stackTrace) {
                return SizedBox(
                    height: 80.h,
                    width: 80.w,
                    child: const Icon(Icons.newspaper));
              },
            ),
            const XMargin(10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    article.title ?? "N/A",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
                  ),
                  const YMargin(5),
                  Text("- ${article.author ?? ""}",
                      textAlign: TextAlign.right,
                      style:
                          TextStyle(fontSize: 13.sp, color: Colors.redAccent)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
