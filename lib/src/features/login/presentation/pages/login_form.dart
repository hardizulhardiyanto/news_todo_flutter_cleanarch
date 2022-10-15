import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/src/features/login/data/models/request/login_model_request.dart';
import 'package:todo_app/src/features/login/presentation/manager/login_controller.dart';

import '../../../../../injector.dart';
import '../../../../component/index.dart';
import '../../../../widget_utilities/index.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm>createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final FocusNode fnEmail = FocusNode();
  final FocusNode fnPassword = FocusNode();
  bool isSubmitLogin = false;
  bool isFieldInvalid = false;
  bool _passwordVisible = false;

  final LoginController controller = Get.put(LoginController(getLoginUseCases: sl()));


  @override
  Widget build(BuildContext context) {
    return loginForm();
  }

  Widget loginForm(){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/images/todo_logo.png",
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: const Text(
                    "My Todo List",
                    style: text20RubikW500Grey,
                  )),
            ),
            AppDimens.verticalSpace16,
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 61,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: grey_two,
                    border: Border.all(
                      color: (isSubmitLogin &&
                          emailController.text.isEmpty) ||
                          isFieldInvalid
                          ? red
                          : Colors.transparent,
                      width: 1.0,
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      AppDimens.horizontalSpace16,
                      Icon(
                        Icons.person_outline,
                        size: 28,
                        color: emailController.text.isEmpty
                            ? grey
                            : blueCore,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: AutofillGroup(
                            child: ListTile(
                              title: TextField(
                                cursorColor: blueCore,
                                controller: emailController,
                                onSubmitted: (String str) {
                                  fnEmail.unfocus();
                                  FocusScope.of(context)
                                      .requestFocus(fnPassword);
                                },
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Email",
                                  labelStyle: text14RubikNormalBlack80,
                                ),
                                // focusNode: fnEmail,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                AppDimens.verticalSpace4,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(),
                ),
              ],
            ),
            AppDimens.verticalSpace8,
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 61,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: grey_two,
                    border: Border.all(
                      color: (isSubmitLogin &&
                          passwordController.text.isEmpty) ||
                          isFieldInvalid
                          ? red
                          : Colors.transparent,
                      width: 1.0,
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      AppDimens.horizontalSpace16,
                      Icon(
                        Icons.lock_outline,
                        size: 28,
                        color: passwordController.text.isEmpty
                            ? grey
                            : blueCore,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: AutofillGroup(
                            child: ListTile(
                              title: TextField(
                                cursorColor: blueCore,
                                controller: passwordController,
                                onSubmitted: (String str) {
                                  fnPassword.unfocus();
                                  FocusScope.of(context)
                                      .requestFocus(fnEmail);
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    labelText: "Password",
                                    labelStyle: text14RubikNormalBlack80,
                                    suffixIcon: IconButton(
                                      icon: Icon(!_passwordVisible
                                          ? Icons.visibility_off
                                          : Icons.visibility),
                                      onPressed: () {
                                        setState(() {
                                          _passwordVisible =
                                          !_passwordVisible;
                                        });
                                      },
                                    )),
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                obscureText: !_passwordVisible,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                AppDimens.verticalSpace4,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(),
                ),
              ],
            ),
            AppDimens.verticalSpace4,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    // Navigator.of(context).pushNamed(routeForgotPassword);
                  },
                  child: const Text(
                    'Forgot Password',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      color: blue,
                    ),
                  ),
                ),
              ],
            ),
            AppDimens.verticalSpace16,
            BaseBounceButton(
                titleBtn: 'Login',
                gradientColor: gradientBlue,
                onTapProps: () {
                  sendLogin();
                }),
            // _keyboardShow && getSizeScreen(context).name == "lg" || getSizeScreen(context).name == "xl" ? Container(height: MediaQuery.of(context).size.height * 1) : Container()
          ],
        ),
      ),
    );
  }

  String? validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return 'Enter a valid email address';
    } else {
      return null;
    }
  }

  void sendLogin(){
    setState(() {
      isSubmitLogin = true;
    });
    String message = "All Field Required";
    // todo setelah develop dibuka
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty){
      if (validateEmail(emailController.text) == null) {
          LoginModelRequest loginRequest = LoginModelRequest.fromJson({
          'email': emailController.text,
          'password': passwordController.text
          });
          controller.postLogin(loginRequest);
      } else {
        message = validateEmail(emailController.text)!;
        ShowToast.toast(message: message);
      }
    } else {
      ShowToast.toast(message: message);
    }
  }
}
