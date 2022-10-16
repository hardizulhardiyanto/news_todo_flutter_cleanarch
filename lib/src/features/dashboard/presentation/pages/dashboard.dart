import 'package:flutter/material.dart';

import '../../../../component/index.dart';
import '../../../../widget_utilities/index.dart';
import 'dashboard_banner.dart';
import 'dashboard_body.dart';
import 'dashboard_header.dart';

class DashboardPages extends StatefulWidget {
  const DashboardPages({Key? key}) : super(key: key);

  @override
  State<DashboardPages>createState() => _DashboardPagesState();
}

class _DashboardPagesState extends State<DashboardPages> {
  ScrollController _scrollController = new ScrollController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      key: scaffoldKey,
      drawer: Container(),
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: AppBar(
              automaticallyImplyLeading: false,
              brightness: Brightness.dark,
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
          ),
          ClipPath(
            clipper: Clipper80(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.41,
              width: double.infinity,
              decoration: BoxDecoration(gradient: gradientBlue),
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                DashboardHeader(),
                AppDimens.verticalSpace16,
                DashboardBanner(),
                AppDimens.verticalSpace12,
                DashboardBody()
              ],
            ),
          )
        ],
      ),
    );
  }
}
