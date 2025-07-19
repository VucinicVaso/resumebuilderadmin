import 'package:flutter/material.dart';
import 'package:resumebuilderadmin/core/component_factory/component/form_builder/input_field/wt_form_input_filed.dart';
import 'package:resumebuilderadmin/core/component_factory/component/form_builder/input_field/wt_form_input_filed_helper.dart';

class WTFormInputFieldText extends WTFormInputField {

  @override
  Widget? build() {
    return ComponentWidget(
      key: getUniqueKey(),
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      backgroundColor: backgroundColor,
      alignment: alignment,
      focusNode: focusNode,
      secondaryFocusNode: secondaryFocusNode,
      validator: validator,
      controller: controller,
      enabled: enabled,
      asterixRequired: asterixRequired,
      asterixColor: asterixColor,
      prefix: prefix,
      prefixSize: prefixSize,
      prefixColor: prefixColor,
      prefixAction: prefixAction,
      suffix: suffix,
      suffixSize: suffixSize,
      suffixColor: suffixColor,
      suffixAction: suffixAction,
      label: label,
      labelSize: labelSize,
      labelColor: labelColor,
      inputText: inputText,
      inputTextColor: inputTextColor,
      inputTextSize: inputTextSize,
      hintLabel: hintLabel,
      hintLabelColor: hintLabelColor,
      hintLabelSize: hintLabelSize,
      errorTextSize: errorTextSize,
      errorTextColor: errorTextColor,
      textAlign: textAlign,
      textInputType: textInputType,
      validationMode: validationMode,
      textCapitalization: textCapitalization,
      inputBorderColor: inputBorderColor,
      inputFocusBorderColor: inputFocusBorderColor,
      inputErrorBorderColor: inputErrorBorderColor,
      inputBorderWidth: inputBorderWidth,
      inputFocusBorderWidth: inputFocusBorderWidth,
      inputErrorBorderWidth: inputErrorBorderWidth,
    );
  }

}

// ignore: must_be_immutable
class ComponentWidget extends StatefulWidget {

  ComponentWidget({
    super.key,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.backgroundColor,
    this.alignment,
    this.focusNode,
    this.secondaryFocusNode,
    this.validator,
    this.controller,
    this.enabled,
    this.asterixRequired,
    this.asterixColor,
    this.prefix,
    this.prefixSize,
    this.prefixColor,
    this.prefixAction,
    this.suffix,
    this.suffixSize,
    this.suffixColor,
    this.suffixAction,
    this.label,
    this.labelSize,
    this.labelColor,
    this.inputText,
    this.inputTextColor,
    this.inputTextSize,
    this.hintLabel,
    this.hintLabelColor,
    this.hintLabelSize,
    this.errorTextSize,
    this.errorTextColor,
    this.textAlign,
    this.textInputType,
    this.validationMode,
    this.textCapitalization,
    this.inputBorderColor,
    this.inputFocusBorderColor,
    this.inputErrorBorderColor,
    this.inputBorderWidth,
    this.inputFocusBorderWidth,
    this.inputErrorBorderWidth,
  });

  Alignment? alignment;
  EdgeInsets? padding, margin;
  Color? backgroundColor, asterixColor, prefixColor, suffixColor, inputTextColor, labelColor, hintLabelColor, errorTextColor,
    inputBorderColor, inputFocusBorderColor, inputErrorBorderColor;
  double? width, height, prefixSize, suffixSize, 
    inputTextSize, labelSize, hintLabelSize, errorTextSize, inputBorderWidth, inputFocusBorderWidth, inputErrorBorderWidth;
  bool? enabled, asterixRequired;
  IconData? prefix, suffix;
  String? inputText, label, hintLabel;
  TextAlign? textAlign;
  TextInputType? textInputType;
  AutovalidateMode? validationMode;
  TextCapitalization? textCapitalization;
  FocusNode? focusNode, secondaryFocusNode;
  Function? validator, prefixAction, suffixAction;
  TextEditingController? controller;

  @override
  State<ComponentWidget> createState() => _ComponentState();

}

class _ComponentState extends State<ComponentWidget> {

  @override
  void initState() {
    setSizes();
    super.initState();
  }

  @override
  void dispose() {
    // if(widget.focusNode != null) {
    //   widget.focusNode!.dispose();
    // }

    super.dispose();
  }

  void setSizes() {
    setState(() {
      if(widget.width! > 1000) {
        widget.labelSize     = 20;
        widget.hintLabelSize = 18;
        widget.inputTextSize = 18;
        widget.prefixSize    = 27;
        widget.suffixSize    = 27;
      }
      if(widget.width! < 1000) {
        widget.labelSize     = 18;
        widget.inputTextSize = 16;
        widget.hintLabelSize = 16;
        widget.prefixSize    = 25;
        widget.suffixSize    = 25;
      }
    });
  }

  Widget? createLabelWidget() {
    if(widget.label == null) { return SizedBox.shrink(); }

    return Container(
      alignment: widget.alignment,
      color: widget.backgroundColor,
      margin: const EdgeInsets.fromLTRB(0.0, 7.5, 0.0, 0.0),
      child: Text(
        widget.label!,
        style: TextStyle(
          color: widget.labelColor,
          fontSize: widget.labelSize,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

  Widget? createHintLabelWidget() {
    if(widget.hintLabel == null) { return SizedBox.shrink(); }

    return Container(
      alignment: widget.alignment,
      color: widget.backgroundColor,
      margin: const EdgeInsets.fromLTRB(0.0, 7.5, 0.0, 0.0),
      child: Text(
        widget.hintLabel!,
        style: TextStyle(
          color: widget.labelColor,
          fontSize: widget.hintLabelSize,
          fontWeight: FontWeight.normal,
        ),
        textAlign: widget.textAlign,
      ),
    );
  }

  Widget? createPrefixWidget() {
    if(widget.prefix == null) { return SizedBox.shrink(); }

    return Container(
      width: widget.prefixSize,
      height: widget.prefixSize,
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      margin: const EdgeInsets.fromLTRB(0.0, 0.0, 7.5, 0.0),
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: widget.prefixAction != null ? widget.prefixAction!() : () {},
        child: Icon(
          widget.prefix,
          color: widget.prefixColor,
          size: widget.prefixSize,
        ),
      ),
    );
  }

  Widget? createSuffixWidget() {
    if(widget.suffix == null) { return SizedBox.shrink(); }

    return Container(
      width: widget.suffixSize,
      height: widget.suffixSize,
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      margin: const EdgeInsets.fromLTRB(7.5, 0.0, 0.0, 0.0),
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: widget.suffixAction != null ? widget.suffixAction!() : () {},
        child: Icon(
          widget.suffix,
          color: widget.suffixColor,
          size: widget.suffixSize,
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: widget.key,
      width: widget.width,
      padding: widget.padding,
      margin: widget.margin,
      alignment: Alignment.centerLeft,
      color: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          /// label
          createLabelWidget()!,

          /// prefix, input-field, suffix
          Container(
            width: widget.width,
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            color: Colors.transparent,
            alignment: Alignment.centerLeft,
            child: TextFormField(
              focusNode: widget.focusNode,
              onFieldSubmitted: (_) {
                if(widget.secondaryFocusNode != null) {
                  FocusScope.of(context).requestFocus(widget.secondaryFocusNode);
                }
              },
              enabled: widget.enabled,
              controller: widget.controller,
              obscureText: false,
              textAlign: widget.textAlign!,
              autovalidateMode: widget.validationMode,
              style: TextStyle(
                fontSize: widget.inputTextSize,
                color: widget.inputTextColor,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor:  widget.backgroundColor,
                contentPadding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                border: WTFormInputFieldHelper.getBorder(borderColor: widget.inputBorderColor, borderWidth: widget.inputBorderWidth),
                enabledBorder: WTFormInputFieldHelper.getBorder(borderColor: widget.inputBorderColor, borderWidth: widget.inputBorderWidth),
                focusedBorder: WTFormInputFieldHelper.getFocusedBorder(borderColor: widget.inputFocusBorderColor, borderWidth: widget.inputFocusBorderWidth),
                errorBorder: WTFormInputFieldHelper.getErrorBorder(borderColor: widget.inputErrorBorderColor, borderWidth: widget.inputErrorBorderWidth),
                focusedErrorBorder: WTFormInputFieldHelper.getErrorBorder(borderColor: widget.inputErrorBorderColor, borderWidth: widget.inputErrorBorderWidth),
                errorStyle: TextStyle(
                  fontSize: widget.errorTextSize,
                  color: widget.errorTextColor,
                ),
                prefix: createPrefixWidget()!,
                suffix: createSuffixWidget()!,
              ),
              textCapitalization: widget.textCapitalization!,
              keyboardType: widget.textInputType,
              validator: (v) => widget.validator != null ? widget.validator!(v) : null,
            ),
          ),

          /// hintLabel
          createHintLabelWidget()!,
        ],
      ),
    );
  }

}