import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/utils/locator.dart';
import 'package:news_app/viewmodels/sign_up_viewmodel.dart';
import 'package:provider/provider.dart';

import 'views/authentication/signup_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  locatorSetUp();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(
      (MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SignUpViewmodel()),
        ],
        child: const MyApp(),
      )),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_, __) => MaterialApp(
        title: "News App",
        theme: ThemeData(
          textTheme: GoogleFonts.mulishTextTheme(),
          // primaryColor: kPrimaryColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        // builder: BotToastInit(),
        // onGenerateRoute: StackedRouter().onGenerateRoute,
        locale: const Locale('en'),
        home: const SignUpView(),
      ),
    );
  }
}
