import 'package:flutter/material.dart';
import '../../wt_component.dart';
import '../input_field/wt_form_input_filed.dart';

class WTFormInputFieldBuilder {

  String? key;
  void setKey(String? v) { key = v; }

  int? order;
  void setOrder(int? v) { order = v; }

  bool? show = true;
  void showField() { show = true; }
  void hideField() { show = false; }

  FocusNode? focusNode;
  void setFocusNode() { focusNode = FocusNode(); }

  WTComponent? component;
  void setComponent(WTComponent? v) { component = v; }

  WTFormInputField? inputField;
  void setInputField(WTFormInputField? v) { inputField = v; }

  Widget? build() {
    if(component != null) { return component!.build(); }
    if(inputField != null) { return inputField!.build(); }
    return const SizedBox.shrink();
  }

}