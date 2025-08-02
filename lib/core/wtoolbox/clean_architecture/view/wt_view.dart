import 'package:flutter/material.dart';
import '../../external/lib_getx.dart';
import '../../component_factory/factory/wt_component_factory.dart';

//ignore: must_be_immutable
abstract class WTView<T> extends StatelessWidget {

  WTView({ super.key }) {
    setComponentFactory();
  }

  T? controller;
  void setController(T? wtController) { controller = wtController; }

  WTComponentFactory? componentFactory;
  void setComponentFactory() { componentFactory = Get.find<WTComponentFactory>(); }

}