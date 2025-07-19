import 'package:flutter/material.dart';

class WTFormInputFieldHelper {

  static InputBorder? getBorder({ Color? borderColor, double? borderWidth }) {
    return UnderlineInputBorder(
      borderSide: BorderSide(color: borderColor!, width: borderWidth!)
    );
  }

  static InputBorder? getRoundedBorder({ Color? borderColor, double? borderWidth }) {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent, width: 1.0),
      borderRadius: BorderRadius.circular(4.0),
    );
  }

  static UnderlineInputBorder? getFocusedBorder({ Color? borderColor, double? borderWidth }) {
    return UnderlineInputBorder(
      borderSide: BorderSide(color: borderColor!, width: borderWidth!)
    );
  }

  static UnderlineInputBorder? getErrorBorder({ Color? borderColor, double? borderWidth }) {
    return UnderlineInputBorder(
      borderSide: BorderSide(color: borderColor!, width: borderWidth!)
    );
  }

}