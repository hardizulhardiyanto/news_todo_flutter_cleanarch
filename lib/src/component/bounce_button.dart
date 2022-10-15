import 'package:flutter/material.dart';

class BaseBounceButton extends StatefulWidget {
  Function? onTapProps;
  String? titleBtn;
  String? btnImg;
  Gradient? gradientColor;
  Color? colorProps;
  Color? textColors;
  double? widthBtn;

  BaseBounceButton({
    super.key,
    this.onTapProps,
    this.titleBtn,
    this.btnImg,
    this.gradientColor,
    this.colorProps,
    this.textColors,
    this.widthBtn
  });

  @override
  State<BaseBounceButton> createState() => _BaseBounceButtonState();
}

class _BaseBounceButtonState extends State<BaseBounceButton> with SingleTickerProviderStateMixin {
  late double _scale;
  late AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 250,
      ),
      lowerBound: 0.0,
      upperBound: 0.2,
    )
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    var titleText = widget.titleBtn ?? 'Button';
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: GestureDetector(
            onTapDown: _onTapDown,
            onTapUp: _onTapUp,
            onTap: widget.onTapProps as void Function()?,
            child: Transform.scale(
              scale: _scale,
              // child: _animatedButtonUI,
              child: Container(
                decoration: widget.gradientColor != null
                    ? BoxDecoration(
                  gradient: widget.gradientColor,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                )
                    : BoxDecoration(
                  color: widget.colorProps ?? Colors.blue[800],
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                height: 49,
                width: widget.widthBtn ?? widget.widthBtn,
                alignment: Alignment.center,
                child: widget.btnImg != null
                    ? Image.asset(
                  widget.btnImg!,
                  height: 20,
                )
                    : Text(titleText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14.0,
                      color: widget.textColors ?? Colors.white,
                      fontWeight: FontWeight.w600),
                ),

              ),
            ),
          ),
        ),
      ],
    );
  }

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
  }
}
