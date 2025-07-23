import 'package:flutter/material.dart';
import 'package:resumebuilderadmin/core/component_factory/component/form_builder/form/wt_form.dart';
import 'package:resumebuilderadmin/core/component_factory/component/form_builder/form/wt_form_input_field_builder.dart';

class WTFormImpl extends WTForm {

  @override
  Widget? build() {
    return ComponentWidget(
      key:                getUniqueKey(),
      width:              width,
      height:             height,
      padding:            padding,
      margin:             margin,
      alignment:          alignment,
      backgroundColor:    backgroundColor,
      mainAxisAlignment:  mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      context:            buildContext,
      formKey:            formKey,
      autovalidateMode:   validationMode,
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
    this.height,
    this.padding,
    this.margin,
    this.alignment,
    this.backgroundColor,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.context,
    this.formKey,
    this.autovalidateMode,
    this.scrollController,
    this.fields,
  });

  BuildContext? context;
  double? width, height;
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
    setScrollingController();
    setFormInputFieldsList();

    super.initState();
  }

  @override
  void dispose() {
    if(widget.scrollController != null) {
      widget.scrollController!.dispose();
    }

    super.dispose();
  }

  void setScrollingController() {
    if(widget.scrollController == null) {
      widget.scrollController = ScrollController();
    }
  }

  List<WTFormInputFieldBuilder>? formInputFields = List<WTFormInputFieldBuilder>.empty(growable: true);
  void setFormInputFieldsList() {
    List<WTFormInputFieldBuilder>? list = List<WTFormInputFieldBuilder>.empty(growable: true);
    list = widget.fields!.values.toList()..sort((a, b) => (a.order ?? 1000).compareTo(b.order ?? 1000));

    for(var field in list) {
      field.setFocusNode();

      if(field.inputField != null && field.order != list.last.order!) {
        var secondField = list.firstWhere((f) => f.inputField != null && f.order! > field.order!, orElse: () => WTFormInputFieldBuilder());
        if(secondField.inputField != null) {
          field.inputField!.setSecondaryFocusNode(secondField.inputField!.focusNode);
        }
      }
    }

    setState(() {
      formInputFields = list;
    });
  }  

  Widget? generateInputFields() {
    List<Builder>? builderList = List<Builder>.empty(growable: true);

    for(var field in formInputFields!) {
      if(field.component != null) {
        field.component!
          ..setWidth(widget.width)
          ..setHeight(widget.height);
      }

      if(field.inputField != null) {
        field.inputField!
          ..setWidth(widget.width)
          ..setHeight(widget.height);
      }

      builderList.add(
        Builder(
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
        )
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: widget.mainAxisAlignment!,
      crossAxisAlignment: widget.crossAxisAlignment!,
      children: <Widget>[
        ...builderList,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: widget.key,
      color: widget.backgroundColor,
      padding: widget.padding,
      margin: widget.margin,
      alignment: widget.alignment,
      child: Form(
        key: widget.formKey!,
        child: SingleChildScrollView(
          controller: widget.scrollController,
          child: generateInputFields()!,
        ),
      ),
    );
  }

}