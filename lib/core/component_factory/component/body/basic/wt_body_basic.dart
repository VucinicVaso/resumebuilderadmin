import 'package:flutter/material.dart';
import '../wt_body.dart';

class WTBodyBasic extends WTBody {

  void isKeyboardOpen() {
    if(buildContext != null) {
      final keyboardOpen = MediaQuery.of(buildContext!).viewInsets.bottom > 0.0;
      if(keyboardOpen) { FocusScope.of(buildContext!).unfocus(); }
    }
  }

  @override
  Widget? build() {
    return SafeArea(
      key: getUniqueKey(),
      child: GestureDetector(
        onTap: () => isKeyboardOpen(),
        child: LayoutBuilder(
          builder: (context, constraints) {
            print('-----------------------------------');
            print('WTBodyBasic');
            print('width:  ${constraints.maxWidth}');
            print('height: ${constraints.maxHeight}');
            print('-----------------------------------');
            width  = constraints.maxWidth;
            height = constraints.maxHeight;
            
            return Container(
              color: backgroundColor,
              width: width,
              height: height,
              child: SizedBox.expand(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ...components!,
                  ],
                ),
              ),
            );
          }
        ),
      ),
    );
  }

}