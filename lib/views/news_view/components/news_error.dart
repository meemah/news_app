import 'package:flutter/material.dart';

import 'package:news_app/custom_widgets/custom_spacing.dart';

class NewsError extends StatelessWidget {
  final Function()? onTryAgain;
  final String message;
  const NewsError({super.key, this.onTryAgain, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        child: Column(
          children: [
            Text(
              'Something went wrong',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6,
            ),
            const YMargin(16),
            Text(
              message,
              textAlign: TextAlign.center,
            ),
            const YMargin(48),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: onTryAgain,
                icon: const Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
                label: const Text(
                  'Try Again',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
