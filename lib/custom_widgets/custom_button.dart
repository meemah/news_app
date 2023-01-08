import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/utils/theme.dart';

class CustomButton extends StatelessWidget {
  final bool isLoading;
  final String title;
  final Function() onTap;

  const CustomButton(
      {Key? key,
      this.isLoading = false,
      required this.title,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      elevation: 0,
      color: AppColors.primaryColor,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      height: 54.h,
      onPressed: onTap,
      child: isLoading
          ? SizedBox(
              height: 10.h,
              width: 10.w,
              child: const CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          : Text(
              title,
              style: const TextStyle(color: Colors.white),
            ),
    );
  }
}
