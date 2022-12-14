import 'package:flutter/material.dart';
import 'package:todo_app/src/features/news/presentation/pages/news_screen.dart';
import 'app.dart';
import 'injector.dart' as di;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const App());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News Clean Arch. Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.blueGrey,
        primaryColor: Colors.white,
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          titleTextStyle: TextStyle(
            color: Color.fromRGBO(160, 92, 147, 1.0),
          ),
        ),
        textTheme: TextTheme(
          headline1: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: const Color(0xff4E4E4E),
          ),
          headline2: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 20,
            color: const Color(0xff4E4E4E),
          ),
          bodyText1: TextStyle(
            color: const Color(0xff4E4E4E),
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
          bodyText2: TextStyle(fontSize: 16),
          button: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      home: NewsListPage(),
    );
  }
}
