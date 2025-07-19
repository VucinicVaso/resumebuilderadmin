import 'package:flutter/material.dart';
import '../wt_layout.dart';

class WTLayoutVerticalExpandedAndScrollable extends WTLayout {

  @override
  Widget? build() {
    return LayoutBuilder(
      key: getUniqueKey(),
      builder: (context, constraints) {
        print('-----------------------------------');
        print('WTLayoutVerticalExpandedAndScrollable');
        print('width:  ${constraints.maxWidth}');
        print('height: ${constraints.maxHeight}');
        print('-----------------------------------');
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
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: mainAxisAlignment!,
                crossAxisAlignment: crossAxisAlignment!,
                children: <Widget>[
                  ...components!,
                ],
              ),
            ),
          ),
        );
      }
    );
  }

}