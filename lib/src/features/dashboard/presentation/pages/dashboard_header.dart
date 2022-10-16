import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/injector.dart';
import 'package:todo_app/src/core/response_classify.dart';
import 'package:todo_app/src/features/dashboard/presentation/manager/dashboard_controller.dart';

import '../../../../widget_utilities/index.dart';

class DashboardHeader extends StatefulWidget {
  const DashboardHeader({Key? key}) : super(key: key);

  @override
  State<DashboardHeader>createState() => _DashboardHeaderState();
}

class _DashboardHeaderState extends State<DashboardHeader> {
  final DashboardController controller = Get.put(DashboardController(getDashboardUseCases: sl()));
  String time = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    int getHour = TimeOfDay.now().hour;
    setState(() {
      if (getHour > 0 && getHour < 10) {
        time = 'Selamat Pagi';
      } else if (getHour >= 10 && getHour <= 14) {
        time = 'Selamat Siang';
      } else if (getHour >= 12 && getHour <= 18) {
        time = 'Selamat Sore';
      } else {
        time = 'Selamat Malam';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: <Widget>[
                AppDimens.verticalSpace20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GetBuilder<DashboardController>(
                      builder: (value) {
                        if (value.resultLogin.status == Status.completed){
                          return Row(
                            children: <Widget>[
                              AppDimens.horizontalSpace8,
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  height: 50,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Hi, ${value.resultLogin.data!.user!.name}!',
                                        style: text16RubikW500White,
                                      ),
                                      AppDimens.verticalSpace4,
                                      Text(
                                        time,
                                        style: text14RubikW500White,
                                      ),
                                      Expanded(
                                        child: Container(),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                    ///Todo Notification is Hidden > Ready to use
                    Expanded(child: Container()),
                    Expanded(
                      child: Container(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () async {},
                            child: const Icon(
                              Icons.logout,
                              size: 24,
                              color: white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
