import 'package:flutter/material.dart';
import '../wt_layout.dart';

class WTLayoutHorizontal extends WTLayout {

  @override
  Widget? build() {
    return LayoutBuilder(
      key: getUniqueKey(),
      builder: (context, constraints) {
        print('-------------------------------------');
        print('WTLayoutHorizontal');
        print('width: ${constraints.maxWidth}');
        print('height: ${constraints.maxHeight}');
        print('-------------------------------------');

        width  = constraints.maxWidth;
        height = constraints.maxHeight;

        return Container(
          width: width,
          color: backgroundColor,
          padding: padding,
          margin: margin,
          child: components!.isEmpty
            ? SizedBox.shrink()
            : Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: mainAxisAlignment!,
                crossAxisAlignment: crossAxisAlignment!,
                children: <Widget>[
                  ...components!.map((c) {
                    c..setWidth(width)..setHeight(height);
                    return c.build()!;
                  }),
                ],
              ),
        );
      }
    );
  }

}