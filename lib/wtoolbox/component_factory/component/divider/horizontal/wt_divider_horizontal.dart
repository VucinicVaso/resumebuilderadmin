import 'package:flutter/material.dart';
import '../wt_divider.dart';

class WTDividerHorizontal extends WTDivider {

  @override
  Widget? build() {
    return Container(
      key: getUniqueKey(),
      width: width,
      height: thickness,
      margin: margin,
      color: backgroundColor,
    );
  }

}