import 'package:flutter/material.dart';
import 'package:resumebuilderadmin/core/component_factory/component/wtoolbox_component.dart';
import 'package:resumebuilderadmin/core/component_factory/component/form_builder/form/wtoolbox_form_input_field_builder.dart';
import 'package:resumebuilderadmin/core/component_factory/component/form_builder/form_input_field/wtoolbox_form_input_filed.dart';

abstract class WTForm extends WTComponent {

  Key? formKey;
  void setFormKey(Key? v) { formKey = v; }

  ScrollController? scrollController;
  void setScrollController() { scrollController = ScrollController(); }

  AutovalidateMode? autoValidateMode;
  void setAutoValidation(AutovalidateMode? v) { autoValidateMode = v; }
  void autoValidateAlways() { autoValidateMode = AutovalidateMode.always; }
  void autoValidateDisabled() { autoValidateMode = AutovalidateMode.disabled; }
  void autoValidateOnUserInteraction() { autoValidateMode = AutovalidateMode.onUserInteraction; }

  Map<String, WTFormInputFieldBuilder>? fields = <String, WTFormInputFieldBuilder>{};
  void addField({ String? key, int? order, WTFormInputField? inputField, WTComponent? component }) {
    WTFormInputFieldBuilder field = WTFormInputFieldBuilder()
      ..setKey(key)
      ..setOrder(order)
      ..setFocusNode()
      ..showField();
    if(inputField != null) { field.setInputField(inputField); }
    if(component != null) { field.setComponent(component); }
    fields![key!] = field;
  }
  
  void removeField(String key) {
    fields!.remove(key);
  }

  WTFormInputFieldBuilder? getField(String key) {
    return fields![key];
  }

}