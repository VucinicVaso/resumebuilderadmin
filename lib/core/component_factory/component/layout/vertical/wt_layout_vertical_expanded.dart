import 'package:flutter/material.dart';
import '../wt_layout.dart';

class WTLayoutVerticalExpanded extends WTLayout {

  @override
  Widget? build() {
    return LayoutBuilder(
      key: getUniqueKey(),
      builder: (context, constraints) {
        width  = constraints.maxWidth;
        height = constraints.maxHeight;

        return Expanded(
          key: getUniqueKey(),
          child: Container(
            color: backgroundColor,
            width: width,
            padding: padding!,
            margin: margin!,
            alignment: alignment,
            child: Column(
              mainAxisAlignment: mainAxisAlignment!,
              crossAxisAlignment: crossAxisAlignment!,
              children: <Widget>[
                ...components!,
              ],
            ),
          ),
        );
      }
    );
  }

}