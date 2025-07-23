import 'package:flutter/material.dart';

class WTFormInputFieldHelper {

  static InputBorder? getBorder({ Color? borderColor, double? borderWidth = 1.0 }) {
    return UnderlineInputBorder(
      borderSide: BorderSide(color: borderColor!, width: borderWidth!)
    );
  }

  static InputBorder? getRoundedBorder({ Color? borderColor, double? borderWidth = 1.0, double? borderRadius = 4.0 }) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent, width: borderWidth!),
      borderRadius: BorderRadius.circular(borderRadius!),
    );
  }

  static UnderlineInputBorder? getFocusedBorder({ Color? borderColor, double? borderWidth = 1.0 }) {
    return UnderlineInputBorder(
      borderSide: BorderSide(color: borderColor!, width: borderWidth!)
    );
  }

  static UnderlineInputBorder? getErrorBorder({ Color? borderColor, double? borderWidth = 1.0 }) {
    return UnderlineInputBorder(
      borderSide: BorderSide(color: borderColor!, width: borderWidth!)
    );
  }

}