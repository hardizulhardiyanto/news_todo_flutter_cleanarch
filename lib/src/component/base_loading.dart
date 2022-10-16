import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BaseLoading extends StatefulWidget {
  const BaseLoading({Key? key}) : super(key: key);

  @override
  State<BaseLoading>createState() => _BaseLoadingState();
}

class _BaseLoadingState extends State<BaseLoading> {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/img-loading-1.gif",
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      fit: BoxFit.fitHeight,
    );
  }
}
