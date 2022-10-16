import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../injector.dart';
import '../../../../widget_utilities/index.dart';
import '../../../news/presentation/manager/news_controller.dart';

class DashboardBody extends StatefulWidget {
  const DashboardBody({Key? key}) : super(key: key);

  @override
  State<DashboardBody>createState() => _DashboardBodyState();
}

class _DashboardBodyState extends State<DashboardBody> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  final NewsController controller = Get.put(NewsController(getNewsUseCases: sl()));

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RefreshIndicator(
          displacement: 200,
          strokeWidth: 3,
          color: white,
          backgroundColor: greenDoctor,
          key: _refreshIndicatorKey,
          onRefresh: () async {},
          child: Container(

          )
      ),
    );
  }
}
