import 'package:flutter/material.dart';
import 'package:news_app/utils/routes/route_names.dart';
import 'package:news_app/views/authentication/signin_view.dart';
import 'package:news_app/views/authentication/signup_view.dart';
import 'package:news_app/views/news_view/news_list_view.dart';
import 'package:news_app/views/news_view/news_webview.dart';

class Routers {
  static Route<dynamic> generateRoute(
      RouteSettings settings, BuildContext context) {
    Widget routeWidget;
    final args = settings.arguments;
    switch (settings.name) {
      case AppRoutes.signIn:
        routeWidget = SignInView();
        break;
      case AppRoutes.signUp:
        routeWidget = SignUpView();
        break;
      case AppRoutes.home:
        routeWidget = const NewsListView();
        break;
      case AppRoutes.webview:
        routeWidget = CustomWebView(
          url: args as String,
        );
        break;
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
    return _createRoute(child: routeWidget);
  }

  static Route _createRoute({child = Widget, settings}) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
