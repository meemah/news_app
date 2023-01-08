import 'package:flutter/material.dart';
import 'package:news_app/utils/theme.dart';
// import 'package:maka_app/export.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String textfieldLabel;
  final String? Function(String?) validator;
  final bool obscureText;
  final TextInputType? textInputType;
  const CustomTextField(
      {Key? key,
      required this.controller,
      required this.textfieldLabel,
      required this.validator,
      this.obscureText = false,
      this.textInputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextFormField(
          validator: validator,
          controller: controller,
          keyboardType: textInputType,
          decoration: InputDecoration(
              hintText: textfieldLabel,
              isDense: true,
              border: kTextFormBorder,
              focusedBorder: kTextFormBorder,
              enabledBorder: kTextFormBorder)),
    );
  }
}

final kTextFormBorder = OutlineInputBorder(
  borderSide: const BorderSide(color: AppColors.primaryColor),
  borderRadius: BorderRadius.circular(8.0),
);
