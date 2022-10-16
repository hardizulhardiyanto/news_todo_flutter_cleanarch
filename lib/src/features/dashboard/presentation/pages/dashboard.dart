import 'package:flutter/material.dart';

import '../../../../component/index.dart';
import '../../../../widget_utilities/index.dart';
import 'dashboard_header.dart';

class DashboardPages extends StatefulWidget {
  const DashboardPages({Key? key}) : super(key: key);

  @override
  State<DashboardPages>createState() => _DashboardPagesState();
}

class _DashboardPagesState extends State<DashboardPages> {
  ScrollController _scrollController = new ScrollController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

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
          NestedScrollView(
              scrollDirection: Axis.vertical,
              controller: _scrollController,
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget> [
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.22,
                      child: Stack(
                        children: const [
                          //Header Here
                          DashboardHeader()
                        ],
                      ),
                    ),
                  )
                ];
              },
              body: RefreshIndicator(
                  displacement: 200,
                  strokeWidth: 3,
                  color: white,
                  backgroundColor: greenDoctor,
                  key: _refreshIndicatorKey,
                  onRefresh: () async {},
                  child: Container()
              )
          )
        ],
      ),
    );
  }
}
