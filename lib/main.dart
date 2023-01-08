import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/services/database_service.dart';
import 'package:news_app/utils/locator.dart';
import 'package:news_app/viewmodels/news_viewmodel.dart';
import 'package:news_app/viewmodels/sign_in_viewmodel.dart';
import 'package:news_app/viewmodels/sign_up_viewmodel.dart';
import 'package:news_app/views/news_view/news_list_view.dart';
import 'package:provider/provider.dart';

void main() async {
  locatorSetUp();
  WidgetsFlutterBinding.ensureInitialized();
  await serviceLocator<DatabaseService>().initDatabase();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(
      (MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SignUpViewmodel()),
          ChangeNotifierProvider(create: (_) => SignInViewmodel()),
          ChangeNotifierProvider(create: (_) => NewsViewmodel()),
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
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        locale: const Locale('en'),
        home: const NewsListView(),
      ),
    );
  }
}
