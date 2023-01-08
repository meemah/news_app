import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/custom_widgets/custom_spacing.dart';
import 'package:shimmer/shimmer.dart';

class NewsShimmer extends StatelessWidget {
  const NewsShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Shimmer.fromColors(
          // ignore: sort_child_properties_last
          child: Row(
            children: [
              Container(
                color: Colors.grey,
                height: 80,
                width: 80,
              ),
              const XMargin(10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 150.w,
                      color: Colors.grey,
                      child: const Text(
                        "Article 1",
                      ),
                    ),
                    const YMargin(5),
                    Container(
                      width: 100.w,
                      color: Colors.grey,
                      child: const Text(
                        "Writer one",
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          enabled: true,
          baseColor: Colors.grey,
          highlightColor: Colors.black26),
    );
  }
}
