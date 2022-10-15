import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';

import '../features/news/presentation/pages/news_screen.dart';
import 'index.dart';

// route list
const routeSplashScreen = "/splashscreen";
const routeNewsList = "/listnews";

Route<dynamic>? generateRoute (RouteSettings settings) {
  switch (settings.name){
    case routeSplashScreen:
      return PageTransition(
          child: const SplashScreen(),
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 1000)
      );
    case routeNewsList:
      return PageTransition(
          child: NewsListPage(),
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 1000)
      );

    default:
      return null;
  }
}