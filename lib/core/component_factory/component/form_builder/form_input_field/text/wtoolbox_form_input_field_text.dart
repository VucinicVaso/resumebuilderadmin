import 'package:flutter/material.dart';
import 'package:resumebuilderadmin/core/component_factory/component/form_builder/form_input_field/wtoolbox_form_input_filed.dart';
import 'package:resumebuilderadmin/core/component_factory/component/form_builder/form_input_field/wtoolbox_form_input_filed_helper.dart';

class WTFormInputFieldText extends WTFormInputField {

  Widget? createLabelWidget() {
    if(label == null) { return SizedBox.shrink(); }

    return Container(
      alignment: alignment,
      color: backgroundColor,
      margin: const EdgeInsets.fromLTRB(0.0, 7.5, 0.0, 0.0),
      child: Text(
        label!,
        style: TextStyle(
          color: labelColor,
          fontSize: labelSize,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

  Widget? createHintLabelWidget() {
    if(hintLabel == null) { return SizedBox.shrink(); }

    return Container(
      alignment: alignment,
      color: backgroundColor,
      margin: const EdgeInsets.fromLTRB(0.0, 7.5, 0.0, 0.0),
      child: Text(
        hintLabel!,
        style: TextStyle(
          color: labelColor,
          fontSize: hintLabelSize,
          fontWeight: FontWeight.normal,
        ),
        textAlign: textAlign,
      ),
    );
  }

  Widget? createPrefixWidget() {
    if(prefix == null) { return SizedBox.shrink(); }

    return Container(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      margin: const EdgeInsets.fromLTRB(0.0, 0.0, 7.5, 0.0),
      child: GestureDetector(
        onTap: prefixAction != null ? prefixAction!() : () {},
        child: Icon(
          prefix,
          color: prefixColor,
          size: prefixSize,
        ),
      ),
    );
  }

  Widget? createSuffixWidget() {
    if(suffix == null) { return SizedBox.shrink(); }

    return Container(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      margin: const EdgeInsets.fromLTRB(7.5, 0.0, 0.0, 0.0),
      child: GestureDetector(
        onTap: suffixAction != null ? suffixAction!() : () {},
        child: Icon(
          suffix,
          color: suffixColor,
          size: suffixSize,
        ),
      )
    );
  }

  @override
  Widget? build() {
    return LayoutBuilder(
      key: getUniqueKey(),
      builder: (context, constraints) {
        width         = constraints.maxWidth;
        padding       = padding ?? const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0);
        margin        = margin ?? const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0);
        labelSize     = width! * 0.04;
        hintLabelSize = width! * 0.035;
        prefixSize    = width! * 0.045;
        inputTextSize = width! * 0.045;
        suffixSize    = width! * 0.045;

        return Container(
          width: width,
          padding: padding,
          margin: margin,
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
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                color: Colors.transparent,
                child: TextFormField(
                  focusNode: focusNode,
                  onFieldSubmitted: (_) {
                    if(secondaryFocusNode != null) {
                      FocusScope.of(context).requestFocus(secondaryFocusNode);
                    }
                  },
                  enabled: enabled,
                  controller: controller,
                  obscureText: false,
                  textAlign: textAlign!,
                  autovalidateMode: autoValidateMode,
                  style: TextStyle(
                    fontSize: inputTextSize,
                    color: inputTextColor,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor:  backgroundColor,
                    contentPadding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                    border: WTFormInputFiledHelper.getBorder(borderColor: inputBorderColor, borderWidth: inputBorderWidth),
                    enabledBorder: WTFormInputFiledHelper.getBorder(borderColor: inputBorderColor, borderWidth: inputBorderWidth),
                    focusedBorder: WTFormInputFiledHelper.getFocusedBorder(borderColor: inputFocusBorderColor, borderWidth: inputFocusBorderWidth),
                    errorBorder: WTFormInputFiledHelper.getErrorBorder(borderColor: inputErrorBorderColor, borderWidth: inputErrorBorderWidth),
                    focusedErrorBorder: WTFormInputFiledHelper.getErrorBorder(borderColor: inputErrorBorderColor, borderWidth: inputErrorBorderWidth),
                    errorStyle: TextStyle(
                      fontSize: errorTextSize,
                      color: errorTextColor,
                    ),
                    prefix: createPrefixWidget()!,
                    suffix: createSuffixWidget()!,
                  ),
                  textCapitalization: textCapitalization!,
                  keyboardType: textInputType,
                  validator: (v) => validator != null ? validator!(v) : null,
                ),
              ),

              /// hintLabel
              createHintLabelWidget()!,
            ],
          ),
        );
      }
    );
  }

}