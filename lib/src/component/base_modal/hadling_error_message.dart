import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../widget_utilities/index.dart';
import '../index.dart';

class HandlingErrorWidget extends StatefulWidget {
  final String? errorMessage;
  final Function? onTapProps;
  final String? tittleBtn;

  const HandlingErrorWidget(
      {Key? key, this.errorMessage, this.onTapProps, this.tittleBtn})
      : super(key: key);

  @override
  State<HandlingErrorWidget> createState() => _HandlingErrorWidgetState();
}

class _HandlingErrorWidgetState extends State<HandlingErrorWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.50,
      decoration: const BoxDecoration(
          color: white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppDimens.verticalSpace12,
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(2),
              child: Container(
                color: grey,
                width: 40,
                height: 4,
              ),
            ),
          ),
          AppDimens.verticalSpace16,

          Flexible(
              child: SizedBox(
                child: Image.asset(
                  "assets/images/internet_lose_1.gif",
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                ),
              )
          ),
          Container(
            padding: const EdgeInsets.all(2),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: Text(
                  widget.errorMessage ?? 'Error Message ?',
                  style: text16RubikW500Black
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 6,
            decoration: const BoxDecoration(
                color: white, boxShadow: boxShadowGrey2),
            child: Center(
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 8),
                  child: BaseBounceButton(
                      titleBtn: widget.tittleBtn ?? 'title button ?',
                      gradientColor: gradientBlue,
                      onTapProps: widget.onTapProps as void Function()?
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }
}
