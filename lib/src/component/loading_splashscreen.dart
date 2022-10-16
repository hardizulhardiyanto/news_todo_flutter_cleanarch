import 'package:flutter/animation.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import '../configure/routes.dart';
import '../widget_utilities/index.dart';

class LoadingSplashScreen extends StatefulWidget {
  String? message;

  LoadingSplashScreen({
    Key? key,
    this.message
  }) : super(key: key);

  @override
  State<LoadingSplashScreen> createState() => _LoadingSplashScreenState();
}

class _LoadingSplashScreenState extends State<LoadingSplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
                    Text(
                      widget.message != null ? "${widget.message}" :"redirecting...",
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
                    "News Todo",
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      color: eliteBlue,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                        fontStyle: FontStyle.italic
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}