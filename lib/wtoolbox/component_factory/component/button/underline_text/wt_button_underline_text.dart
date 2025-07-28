import 'package:flutter/material.dart';
import 'package:resumebuilderadmin/wtoolbox/component_factory/component/button/wt_button.dart';

class WTButtonUnderlineText extends WTButton {

  @override
  Widget? build() {
    return ButtonWidget(
      key: getUniqueKey(),
      action: action,
      width: width,
      padding: padding,
      margin: margin,
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      label: label,
      labelSize: labelSize,
      labelColor: labelColor,
    );
  }

}

// ignore: must_be_immutable
class ButtonWidget extends StatefulWidget {

  VoidCallback? action;
  double? width;
  EdgeInsets? padding, margin;
  Color? backgroundColor, borderColor;

  String? label;
  double? labelSize;
  Color? labelColor;

  ButtonWidget({
    super.key,
    this.action,
    this.width,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.borderColor,
    this.label,
    this.labelSize,
    this.labelColor,
  });

  @override
  State<ButtonWidget> createState() => _ButtonWState();

}

class _ButtonWState extends State<ButtonWidget> {

  @override
  void initState() {
    setButtonState();

    super.initState();
  }

  void setButtonState() {
    double? size = 0.0;
    if(widget.width! > 1000) { size = 22; }
    if(widget.width! < 1000) { size = 18; }
    if(widget.width! < 6000) { size = 16; }
    setState(() { widget.labelSize = size; });
  }

  Widget? textWidget() {
    if(widget.label == null) { return SizedBox.shrink(); }

    return Text(
      widget.label!,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: widget.labelColor,
        fontSize: widget.labelSize,
      ),
    );
  }

  Future<void> onTap() async {
    setState(() {});
    Future.delayed(Duration(milliseconds: 200), widget.action);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async => await onTap(),
      child: Container(
        padding: widget.padding,
        margin: widget.margin,
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          border: Border(
            bottom: BorderSide(
              color: widget.borderColor!,
              width: 1,
            ),
          ),
        ),
        child: textWidget(),
      ),
    );
  }

}