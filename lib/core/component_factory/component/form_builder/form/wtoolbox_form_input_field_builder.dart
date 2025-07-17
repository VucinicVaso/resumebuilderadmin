import 'package:flutter/material.dart';
import 'package:resumebuilderadmin/core/component_factory/component/wtoolbox_component.dart';
import 'package:resumebuilderadmin/core/component_factory/component/form_builder/form_input_field/wtoolbox_form_input_filed.dart';

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