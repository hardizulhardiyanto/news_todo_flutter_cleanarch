import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';
import 'package:todo_app/src/features/login/presentation/pages/login.dart';

import '../features/news/presentation/pages/news_screen.dart';
import '../component/index.dart';

// route list
const routeSplashScreen = "/splashscreen";
const routeNewsList = "/listnews";
const routeLogin = "/login";

Route<dynamic>? generateRoute (RouteSettings settings) {
  switch (settings.name){
    case routeSplashScreen:
      return PageTransition(
          child: SplashScreen(),
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 1000)
      );
    case routeNewsList:
      return PageTransition(
          child: NewsListPage(),
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 1000)
      );
    case routeLogin:
      return PageTransition(
          child: const LoginPages(),
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 1000)
      );

    default:
      return null;
  }
}