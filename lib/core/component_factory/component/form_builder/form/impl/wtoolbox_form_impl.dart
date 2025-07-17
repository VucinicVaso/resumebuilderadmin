import 'package:flutter/material.dart';
import 'package:resumebuilderadmin/core/component_factory/component/form_builder/form/wtoolbox_form.dart';
import 'package:resumebuilderadmin/core/component_factory/component/form_builder/form/wtoolbox_form_input_field_builder.dart';

class WTFormImpl extends WTForm {

  @override
  Widget? build() {
    return ComponentWidget(
      key:                getUniqueKey(),
      width:              width,
      padding:            padding,
      margin:             margin,
      alignment:          alignment,
      backgroundColor:    backgroundColor,
      mainAxisAlignment:  mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      formKey:            formKey,
      autovalidateMode:   autoValidateMode,
      scrollController:   scrollController,
      fields:             fields,
    );
  }

}

// ignore: must_be_immutable
class ComponentWidget extends StatefulWidget {

  ComponentWidget({
    super.key,
    this.width,
    this.padding,
    this.margin,
    this.alignment,
    this.backgroundColor,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.formKey,
    this.autovalidateMode,
    this.scrollController,
    this.fields,
  });

  double? width;
  EdgeInsets? padding, margin;
  Alignment? alignment;
  Color? backgroundColor;
  MainAxisAlignment? mainAxisAlignment;
  CrossAxisAlignment? crossAxisAlignment;
  Key? formKey;
  AutovalidateMode? autovalidateMode;
  ScrollController? scrollController;
  Map<String, WTFormInputFieldBuilder>? fields = <String, WTFormInputFieldBuilder>{};

  @override
  State<ComponentWidget> createState() => ComponentWidgetState();

}

class ComponentWidgetState extends State<ComponentWidget> {

  @override
  void initState() {
    setFields();
    super.initState();
  }

  @override
  void dispose() {
    if(widget.scrollController != null) {
      widget.scrollController!.dispose();
    }

    if(widget.fields != null) {
      widget.fields!.forEach((k, f) {
        if(f.inputField != null) {
          f.focusNode!.dispose();
          f.inputField!.focusNode!.dispose();
        }
      });
    }

    super.dispose();
  }

  List<WTFormInputFieldBuilder>? fieldsList = List<WTFormInputFieldBuilder>.empty(growable: true);
  void setFields() {
    List<WTFormInputFieldBuilder>? list = List<WTFormInputFieldBuilder>.empty(growable: true);
    list = widget.fields!.values.toList()..sort((a, b) => (a.order ?? 1000).compareTo(b.order ?? 1000));

    for(var field in list) {
      if(field.inputField != null && field.order != list.last.order!) {
        var secondField = list.firstWhere((f) => f.inputField != null && f.order! > field.order!, orElse: () => WTFormInputFieldBuilder());
        if(secondField.inputField != null) {
          field.inputField!.setSecondaryFocusNode(secondField.inputField!.focusNode);
        }
      }
    }

    setState(() {
      fieldsList = list;
    });
  }

  Widget? generateInputFields() {
    List<Builder> wrappedFields = List<Builder>.empty(growable: true);

    if(fieldsList!.isNotEmpty) {
      wrappedFields = fieldsList!
        .map((field) {
          return Builder(
            builder: (context) {
              return Focus(
                focusNode: field.focusNode,
                onFocusChange: (hasFocus) {
                  if(hasFocus) {
                    Scrollable.ensureVisible(
                      context,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                child: field.build()!,
              );
            }
          );
        })
        .toList();
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: widget.mainAxisAlignment!,
      crossAxisAlignment: widget.crossAxisAlignment!,
      children: <Widget>[
        ...wrappedFields,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey!,
      autovalidateMode: widget.autovalidateMode,
      child: Container(
        color: widget.backgroundColor,
        width: widget.width,
        padding: widget.padding,
        margin: widget.margin,
        alignment: widget.alignment,
        child: SingleChildScrollView(
          controller: widget.scrollController,
          child: generateInputFields()!,
        ),
      ),
    );
  }

}