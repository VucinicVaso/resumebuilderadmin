import 'package:flutter/material.dart';
import '../wt_component.dart';

abstract  class WTSidebar extends WTComponent {

  Color? iconColor, labelColor;
  double? iconSize, labelSize;
  void setIconColor(Color? v) { iconColor = v; }
  void setIconSize(double? v) { iconSize = v; }
  void setLabelColor(Color? v) { labelColor = v; }
  void setLabelSize(double? v) { labelSize = v; }

  List<Map<String, dynamic>>? actions = List<Map<String, dynamic>>.empty(growable: true);
  void addAction({ VoidCallback? action, IconData? icon, String? label }) {
    actions!.add({ 'action': action, 'icon': icon, 'label': label });
  }

}