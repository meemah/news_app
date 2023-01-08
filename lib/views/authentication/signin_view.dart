import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/custom_widgets/custom_button.dart';
import 'package:news_app/custom_widgets/custom_spacing.dart';
import 'package:news_app/custom_widgets/custom_textfield.dart';
import 'package:news_app/services/networking_service.dart/network_status_check.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/utils/form_validators.dart';
import 'package:news_app/viewmodels/sign_in_viewmodel.dart';
import 'package:provider/provider.dart';

class SignInView extends StatelessWidget with Validators {
  SignInView({super.key});
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sign In.",
                    style:
                        TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
                  ),
                  const YMargin(30),
                  CustomTextField(
                      controller: emailController,
                      textfieldLabel: "Email",
                      validator: Validators.isEmail),
                  CustomTextField(
                      controller: passwordController,
                      textfieldLabel: "Password",
                      obscureText: true,
                      validator: Validators.validatePassword),
                  const YMargin(40),
                  Consumer<SignInViewmodel>(
                      builder: ((context, signInViewmodel, child) {
                    return CustomButton(
                        isLoading: isApiResponseLoading(
                            signInViewmodel.signInResponse),
                        title: "Sign In",
                        onTap: () async {
                          NewsService().getNews(pageNumber: "1");
                          // if (_formKey.currentState!.validate()) {
                          //   signInViewmodel.signIn(
                          //       email: emailController.text,
                          //       password: passwordController.text);
                          // }
                        });
                  }))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
