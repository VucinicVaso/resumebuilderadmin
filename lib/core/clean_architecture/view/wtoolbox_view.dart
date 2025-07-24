import 'package:flutter/material.dart';
import 'package:resumebuilderadmin/core/external/lib_getx.dart';
import 'package:resumebuilderadmin/core/component_factory/factory/wtoolbox_component_factory.dart';

//ignore: must_be_immutable
abstract class WTView<T> extends StatelessWidget {

  WTView({ super.key }) {
    setComponentFactory();
  }

  T? controller;
  void setController(T? wtController) { controller = wtController; }

  WTComponentFactory? componentFactory;
  void setComponentFactory() {
    componentFactory = Get.find<WTComponentFactory>();
  }

}