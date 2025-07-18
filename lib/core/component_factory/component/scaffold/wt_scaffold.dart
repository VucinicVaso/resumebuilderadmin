import 'package:flutter/material.dart';
import '../wt_component.dart';

abstract class WTScaffold extends WTComponent {

  GlobalKey? globalKey;
  void setGlobalKey() { globalKey = GlobalKey<ScaffoldState>(); }

  PreferredSizeWidget? header;
  void setHeader(PreferredSizeWidget? v) { header = v; }

  Widget? body;
  void setBody(Widget? v) { body = v; }

  Widget? flyMenu;
  void setFlyMenu(Widget? v) { flyMenu = v; }

  Widget? footer;
  void setFooter(Widget? v) { footer = v; }

}