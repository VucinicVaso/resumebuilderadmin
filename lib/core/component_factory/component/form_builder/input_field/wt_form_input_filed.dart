import 'package:flutter/material.dart';
import 'package:resumebuilderadmin/core/component_factory/component/wt_component.dart';

abstract class WTFormInputField extends WTComponent {

  FocusNode? focusNode, secondaryFocusNode;
  void setFocusNode() { focusNode = FocusNode(); }
  void setSecondaryFocusNode(FocusNode? v) { secondaryFocusNode = v; }

  Function? validator;
  void setValidator(Function? v) { validator = v; }

  TextEditingController? controller;
  void setController(TextEditingController? v) { controller = v; }

  bool? enabled = true;
  void enable() { enabled = true; }
  void disable() { enabled = false; }

  bool? asterixRequired = false;
  Color? asterixColor;
  void requireAsterix() { asterixRequired = true; }
  void setAsterixColor(Color? v) { asterixColor = v; }

  IconData? prefix;
  double? prefixSize;
  Color? prefixColor;
  Function? prefixAction;
  void setPrefixSize(double? v) { prefixSize = v; }
  void setPrefixColor(Color? v) { prefixColor = v; }
  void setPrefix({ IconData? iconData, Function? action }) {
    prefix       = iconData;
    prefixAction = action;
  }

  IconData? suffix;
  double? suffixSize;
  Color? suffixColor;
  Function? suffixAction;
  void setSuffixSize(double? v) { suffixSize = v; }
  void setSuffixColor(Color? v) { suffixColor = v; }
  void setSuffix({ IconData? iconData, Function? action }) {
    suffix       = iconData;
    suffixAction = action;
  }

  String? inputText, label, hintLabel;
  Color? inputTextColor, labelColor, hintLabelColor, errorTextColor;
  double? inputTextSize, labelSize, hintLabelSize, errorTextSize;
  void setInputText(String? v) { inputText = v; }
  void setInputTextColor(Color? v) { inputTextColor = v; }
  void setInputTextSize(double? v) { inputTextSize = v; }
  void setLabel(String? v) { label = v; }
  void setLabelColor(Color? v) { labelColor = v; }
  void setLabelSize(double? v) { labelSize = v; }
  void setHintLabel(String? v) { hintLabel = v; }
  void setHintColor(Color? v) { hintLabelColor = v; }
  void setHintLabelSize(double? v) { hintLabelSize = v; }
  void setErrorTextColor(Color? v) { errorTextColor = v; }
  void setErrorTextSize(double? v) { errorTextSize = v; }

  List<Map<String, dynamic>>? dropdownItems = List<Map<String, dynamic>>.empty(growable: true);
  void addDropdownItem({ String? label, bool? selected }) { dropdownItems!.add({ 'label': label, 'selected': selected }); }
  void addDropdownItems(List<Map<String, dynamic>>? v) { dropdownItems!.addAll(v!); }

  TextAlign? textAlign = TextAlign.left;
  void setTextAlign(TextAlign? v) { textAlign = v; }

  TextInputType? textInputType;
  void setTextInputType(TextInputType? v) { textInputType = v; }
  void useNumberKeyboard() { textInputType = TextInputType.number; }
  void useTextKeyboard() { textInputType = TextInputType.text; }
  void useEmailKeyboard() { textInputType = TextInputType.emailAddress; }

  TextCapitalization? textCapitalization = TextCapitalization.none;
  void withSentencesTextCapitalization() { textCapitalization = TextCapitalization.sentences; }
  void withWordsTextCapitalization() { textCapitalization = TextCapitalization.words; }
  void withCharactersTextCapitalization() { textCapitalization = TextCapitalization.characters; }
  void withNoneTextCapitalization() { textCapitalization = TextCapitalization.none; }

  AutovalidateMode? autoValidateMode;
  void setAutoValidation(AutovalidateMode? v) { autoValidateMode = v; }
  void autoValidateAlways() { autoValidateMode = AutovalidateMode.always; }
  void autoValidateDisabled() { autoValidateMode = AutovalidateMode.disabled; }
  void autoValidateOnUserInteraction() { autoValidateMode = AutovalidateMode.onUserInteraction; }

  Color? inputBorderColor, inputFocusBorderColor, inputErrorBorderColor;
  double? inputBorderWidth, inputFocusBorderWidth, inputErrorBorderWidth;
  void setInputBoder(Color? c, double? w) { 
    inputBorderColor = c;
    inputBorderWidth = w;
  }
  void setInputFocusBorder(Color? c, double? w) { 
    inputFocusBorderColor = c;
    inputFocusBorderWidth = w;
  }
  void setInputErrorFocusBorder(Color? c, double? w) { 
    inputErrorBorderColor = c;
    inputErrorBorderWidth = w;
  }

}