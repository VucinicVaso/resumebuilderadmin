import 'package:flutter/material.dart';
import '../wt_component.dart';

abstract class WTLayout extends WTComponent {

  bool? scrollable = false;
  void setScrollable() { scrollable = true; }

  bool? expandable = false;
  void setExpandable() { expandable = true; }

  // size of a layout
  bool? small, medium, large = false;
  void sm() { small = true; }
  void md() { medium = true; }
  void lg() { large = true; }

  // 0 padding and margin
  void flat() {
    setPadding(left: 0.0, top: 0.0, right: 0.0, bottom: 0.0);
    setMargin(left: 0.0, top: 0.0, right: 0.0, bottom: 0.0);
  }

  List<Widget>? components = List<Widget>.empty(growable: true);
  void addComponent(Widget? v) { components!.add(v!); }
  void addComponents(List<Widget>? v) { components!.addAll(v!); }

}