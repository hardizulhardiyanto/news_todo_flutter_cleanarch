import 'package:flutter/material.dart';

class DashboardPages extends StatefulWidget {
  const DashboardPages({Key? key}) : super(key: key);

  @override
  State<DashboardPages>createState() => _DashboardPagesState();
}

class _DashboardPagesState extends State<DashboardPages> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("This Dashboard Pages"));
  }
}
