import 'package:flutter/material.dart';
import '../wt_component.dart';

abstract class WTButton extends WTComponent {

  VoidCallback? action;
  void setAction(VoidCallback? v) { action = v; }

  String? label;
  Color? labelColor;
  double? labelSize;
  void setLabel(String? v) { label = v; }
  void setLabelColor(Color? v) { labelColor = v; }
  void setLabelSize(double? v) { labelSize = v; }

  IconData? icon, actionIcon;
  Color? iconColor, actionIconColor;
  double? iconSize, actionIconSize;
  void setIcon(IconData? v) { icon = v; }
  void setIconColor(Color? v) { iconColor = v; }
  void setIconSize(double? v) { iconSize = v; }
  void setActionIcon(IconData? v) { icon = v; }
  void setActionIconColor(Color? v) { iconColor = v; }
  void setActionIconSize(double? v) { iconSize = v; }

}