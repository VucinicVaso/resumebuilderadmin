import 'package:flutter/material.dart';
import 'package:resumebuilderadmin/core/external/lib_getx.dart';
import 'package:resumebuilderadmin/core/component_factory/factory/wtoolbox_component_factory.dart';
import '../wt_body.dart';

class WTBodyImpl extends WTBody {

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
            print('WTBodyDynamic');
            print('width:  ${constraints.maxWidth}');
            print('height: ${constraints.maxHeight}');
            print('-----------------------------------');

            Get.find<WTComponentFactory>()
              ..setDeviceWidth(constraints.maxWidth)
              ..setDeviceHeight(constraints.maxHeight);

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