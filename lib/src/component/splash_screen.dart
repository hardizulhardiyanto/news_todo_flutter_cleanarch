import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import '../configure/routes.dart';
import '../widget_utilities/index.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

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
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/images/todo_logo.png",
                width: 130,
                height: 130,
                fit: BoxFit.cover,
              ),
            ),
            const Align(
              alignment: Alignment.center,
              child: SpinKitRing(
                color: black80,
                size: 170,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                children: const <Widget>[
                  SizedBox(
                    height: 165,
                  ),
                ],
              ),
            ),
            Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.30,
                    ),
                    const Text(
                      'redirecting...',
                      style: text12RubikNormalGrey,
                    )
                  ],
                )
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: const Text(
                    "My Todo List",
                    style: text20RubikW500Grey,
                  )),
            )
          ],
        ),
      ),
    );
  }

  startTime() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    //todo initials route
    Navigator.of(context).pushNamedAndRemoveUntil(routeLogin, (Route<dynamic> route) => false);
  }
}