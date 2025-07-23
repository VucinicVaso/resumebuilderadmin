import 'package:flutter/material.dart';
import '../wt_component.dart';
import '../header/wt_header.dart';
import '../sidebar/wt_sidebar.dart';
import '../body/wt_body.dart';
import '../footer/wt_footer.dart';
import '../floating_menu/wt_floating_menu.dart';

abstract class WTScaffold extends WTComponent {

  GlobalKey<ScaffoldState>? globalKey;
  void setGlobalKey() { globalKey = GlobalKey<ScaffoldState>(); }

  WTHeader? header;
  void setHeader(WTHeader? v) { header = v; }

  WTSidebar? sidebar;
  void setSidebar(WTSidebar? v) { sidebar = v; }

  WTBody? body;
  void setBody(WTBody? v) { body = v; }

  WTFloatingMenu? floatingMenu;
  void setFloatingMenu(WTFloatingMenu? v) { floatingMenu = v; }

  WTFooter? footer;
  void setFooter(WTFooter? v) { footer = v; }

}