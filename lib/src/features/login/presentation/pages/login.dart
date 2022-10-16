import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/src/component/index.dart';
import 'package:todo_app/src/configure/routes.dart';
import 'package:todo_app/src/features/login/presentation/manager/login_controller.dart';
import 'package:todo_app/src/features/login/presentation/pages/login_form.dart';

import '../../../../../injector.dart';
import '../../../../core/response_classify.dart';

class LoginPages extends StatefulWidget {
  const LoginPages({Key? key}) : super(key: key);

  @override
  State<LoginPages> createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final LoginController loginController = Get.put(LoginController(getLoginUseCases: sl()));

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: GetBuilder<LoginController>(
        builder: (value) {
          if (value.loginResult.status == Status.loading){
            return LoadingSplashScreen(
              message: "Identifier User",
            );
          } else if (value.loginResult.status == Status.error) {
            ShowToast.toast(message: "Invalid Email or Password");
            return const LoginForm();
          } else if (value.loginResult.status == Status.completed){
            return onCompleted();
          } else {
            return const LoginForm();
          }
        },
      ),
    );
  }

  Widget onCompleted() {
    onCompletedRedirect();
    return LoadingSplashScreen(
      message: "Identifier Success!",
    );
  }

  void modalBottom({String? message, String? titleButton, Function? onFunction}) async {
    Future.delayed( const Duration(milliseconds: 2000), () => {
      BaseModal.showHandlingError(
          context,
          tittleBtn: "Close",
          onTapProps: () async {
            Navigator.pop(context);
          },
          errorMessage: message
      )
    });
  }

  void onCompletedRedirect() async {
    await Future.delayed( const Duration(milliseconds: 2000));
    Navigator.of(context).pushNamedAndRemoveUntil(routeDashboard, (Route<dynamic> route) => false);
  }
}
