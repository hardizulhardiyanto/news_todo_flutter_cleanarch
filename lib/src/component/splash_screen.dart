import 'package:flutter/material.dart';
import 'package:todo_app/src/component/loading_splashscreen.dart';
import '../configure/routes.dart';
import '../widget_utilities/index.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        color: white,
        child: LoadingSplashScreen(),
      ),
    );
  }

  startTime() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    //todo initials route
    Navigator.of(context).pushNamedAndRemoveUntil(routeLogin, (Route<dynamic> route) => false);
  }
}