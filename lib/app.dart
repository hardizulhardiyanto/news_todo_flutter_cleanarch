import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'src/component/index.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App>createState() => _AppState();
}

class _AppState extends State<App> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        hideKeyboard(context);
      },
      child: GetMaterialApp(
        key: _navigatorKey,
        title: 'Todo App Hardy',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: routeSplashScreen,
        // todo development page
        // initialRoute: router.routeAppointmentDoctor,
        onGenerateRoute: generateRoute,
      ),
    );
  }

  void hideKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus!.unfocus();
    }
  }
}
