import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:resumebuilderadmin/core/external/lib_svg.dart';
import '../../wtoolbox_component_builder.dart';
import '../wtoolbox_header.dart';
import '../wtoolbox_header_builder.dart';

class WTHeaderImpl extends WTHeader {

  @override
  PreferredSizeWidget? build() {
    return ComponentWidget(
      key:                          getUniqueKey(),
      width:                        width,
      backgroundColor:              backgroundColor,
      shadow:                       shadow,
      fontFamily:                   googleFonts,
      backAction:                   backAction,
      backActionNetworkImage:       backActionNetworkImage,
      backActionAssetImage:         backActionAssetImage,
      backActionMemoryImage:        backActionMemoryImage,
      backActionSvgMemory:          backActionSvgMemory,
      backActionSvgString:          backActionSvgString,
      backActionSvgNetwork:         backActionSvgNetwork,
      backActionSvgAsset:           backActionSvgAsset,
      backActionSvgBackgroundColor: backActionSvgBackgroundColor,
      backActionIcon:               backActionIcon,
      backActionIconSize:           backActionIconSize,
      backActionIconColor:          backActionIconColor,
      backActionLabelSize:          backActionLabelSize,
      backActionLabelColor:         backActionLabelColor,
      backActionLabel:              backActionLabel,
      backActionLinkLabelSize:      backActionLinkLabelSize,
      backActionLinkLabelColor:     backActionLinkLabelColor,
      backActionLinkLabel:          backActionLinkLabel,
      label:                        label,
      labelSize:                    labelSize,
      labelColor:                   labelColor,
      actionIconSize:               actionIconSize,
      actionIconColor:              actionIconColor,
      actionIconBackgroundColor:    actionIconBackgroundColor,
      actionLabelSize:              actionLabelSize,
      actionLabelColor:             actionLabelColor,
      actionLinkLabelSize:          actionLinkLabelSize,
      actionLinkLabelColor:         actionLinkLabelColor,
      actions:                      actions,
      menuIcon:                     menuIcon,
      menuIconSize:                 menuIconSize,
      menuLabelSize:                menuLabelSize,
      menuIconColor:                menuIconColor,
      menuBackgroundColor:          menuBackgroundColor,
      menuItemIconColor:            menuItemIconColor,
      menuItemLabelColor:           menuItemLabelColor,
      menuItems:                    menuItems,
    );
  }

}

// ignore: must_be_immutable
class ComponentWidget extends StatefulWidget implements PreferredSizeWidget {

  double? width;
  bool? shadow;
  Color? backgroundColor, borderColor;
  String? fontFamily;

  VoidCallback? backAction;
  IconData? backActionIcon;
  String? backActionLabel, backActionLinkLabel;
  double? backActionIconSize, backActionLabelSize, backActionLinkLabelSize;
  Color? backActionIconColor, backActionLabelColor, backActionLinkLabelColor;

  String? backActionNetworkImage, backActionAssetImage;
  Uint8List? backActionMemoryImage;

  Uint8List? backActionSvgMemory;
  String? backActionSvgString, backActionSvgNetwork, backActionSvgAsset;
  Color? backActionSvgBackgroundColor;

  String? label;
  double? labelSize;
  Color? labelColor;

  List<Map>? actions;
  double? actionIconSize, actionLabelSize, actionLinkLabelSize;
  Color? actionIconColor, actionIconBackgroundColor, actionLabelColor, actionLinkLabelColor;

  IconData? menuIcon;
  List<Map>? menuItems;
  double? menuIconSize, menuLabelSize;
  Color? menuIconColor, menuBackgroundColor, menuItemIconColor, menuItemLabelColor;

  ComponentWidget({
    super.key,
    this.width,
    this.backgroundColor,
    this.borderColor,
    this.fontFamily,
    this.shadow,
    this.backAction,
    this.backActionNetworkImage,
    this.backActionAssetImage,
    this.backActionMemoryImage,
    this.backActionSvgMemory,
    this.backActionSvgString,
    this.backActionSvgNetwork,
    this.backActionSvgAsset,
    this.backActionSvgBackgroundColor,
    this.backActionIcon,
    this.backActionIconSize,
    this.backActionIconColor,
    this.backActionLabelSize,
    this.backActionLabelColor,
    this.backActionLabel,
    this.backActionLinkLabelSize,
    this.backActionLinkLabelColor,
    this.backActionLinkLabel,
    this.label,
    this.labelSize,
    this.labelColor,
    this.actionIconSize,
    this.actionIconColor,
    this.actionIconBackgroundColor,
    this.actionLabelSize,
    this.actionLabelColor,
    this.actionLinkLabelSize,
    this.actionLinkLabelColor,
    this.actions,
    this.menuIcon,
    this.menuIconSize,
    this.menuLabelSize,
    this.menuIconColor,
    this.menuBackgroundColor,
    this.menuItemIconColor,
    this.menuItemLabelColor,
    this.menuItems,
  });

  @override
  State<ComponentWidget> createState() => _ComponentState();

  @override
  Size get preferredSize => const Size.fromHeight(50);

}

class _ComponentState extends State<ComponentWidget> {

  double? width, height;
  bool? shadow;
  Function? textStyle;
  Color? backgroundColor;
  String? fontFamily;

  VoidCallback? backAction;
  IconData? backActionIcon;
  String? backActionLabel, backActionLinkLabel;
  double? backActionIconSize, backActionLabelSize, backActionLinkLabelSize;
  Color? backActionIconColor, backActionLabelColor, backActionLinkLabelColor;

  String? backActionNetworkImage, backActionAssetImage;
  Uint8List? backActionMemoryImage;

  Uint8List? backActionSvgMemory;
  String? backActionSvgString, backActionSvgNetwork, backActionSvgAsset;
  Color? backActionSvgBackgroundColor;

  String? label;
  double? labelSize;
  Color? labelColor;

  List<Map>? actions;
  double? actionIconSize, actionLabelSize, actionLinkLabelSize;
  Color? actionIconColor, actionIconBackgroundColor, actionLabelColor, actionLinkLabelColor;

  IconData? menuIcon;
  List<Map>? menuItems;
  double? menuIconSize, menuLabelSize;
  Color? menuIconColor, menuBackgroundColor, menuItemIconColor, menuItemLabelColor;

  @override
  void initState() {
    setState(() {
      width                        = widget.width;
      height                       = 50.0;
      backActionIconSize           = height! * 0.5;
      backActionLabelSize          = height! * 0.3;
      backActionLinkLabelSize      = height! * 0.3;
      labelSize                    = height! * 0.3;
      actionIconSize               = height! * 0.5;
      actionLabelSize              = height! * 0.3;
      actionLinkLabelSize          = height! * 0.3;
      menuIconSize                 = height! * 0.5;
      menuLabelSize                = height! * 0.3;
      backgroundColor              = widget.backgroundColor;
      shadow                       = widget.shadow;
      backAction                   = widget.backAction;
      backActionNetworkImage       = widget.backActionNetworkImage;
      backActionAssetImage         = widget.backActionAssetImage;
      backActionMemoryImage        = widget.backActionMemoryImage;
      backActionSvgMemory          = widget.backActionSvgMemory;
      backActionSvgString          = widget.backActionSvgString;
      backActionSvgNetwork         = widget.backActionSvgNetwork;
      backActionSvgAsset           = widget.backActionSvgAsset;
      backActionSvgBackgroundColor = widget.backActionSvgBackgroundColor;
      backActionIcon               = widget.backActionIcon;
      backActionIconColor          = widget.backActionIconColor;
      backActionLabelColor         = widget.backActionLabelColor;
      backActionLabel              = widget.backActionLabel;
      backActionLinkLabelColor     = widget.backActionLinkLabelColor;
      backActionLinkLabel          = widget.backActionLinkLabel;
      label                        = widget.label;
      labelColor                   = widget.labelColor;
      actionIconColor              = widget.actionIconColor;
      actionIconBackgroundColor    = widget.actionIconBackgroundColor;
      actionLabelColor             = widget.actionLabelColor;
      actionLinkLabelColor         = widget.actionLinkLabelColor;
      actions                      = widget.actions;
      menuIcon                     = widget.menuIcon;
      menuIconColor                = widget.menuIconColor;
      menuBackgroundColor          = widget.menuBackgroundColor;
      menuItemIconColor            = widget.menuItemIconColor;
      menuItemLabelColor           = widget.menuItemLabelColor;
      menuItems                    = widget.menuItems;
    });

    super.initState();
  }

  Widget? widgetsLeft() {
    /// backActionIcon
    Widget? backActionIconWidget = WTComponentBuilder.emptyComponent();
    if(backActionIcon != null) {
      backActionIconWidget = Container(
        margin: const EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0),
        alignment: Alignment.center,
        width: backActionIconSize,
        height: backActionIconSize,
        child: WTComponentBuilder.createIcon(
          iconData: backActionIcon,
          size: backActionIconSize,
          color: backActionIconColor
        ),
      );
    }

    /// backActionNetworkImage
    Widget? backActionNetworkImageWidget = WTComponentBuilder.emptyComponent();
    if(backActionNetworkImage != null) {
      backActionNetworkImageWidget = WTHeaderBuilder.createNetworkImage(
        margin: const EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0),
        size: backActionIconSize,
        image: backActionNetworkImage
      );
    }

    /// backActionAssetImage
    Widget? backActionAssetImageWidget = WTComponentBuilder.emptyComponent();
    if(backActionAssetImage != null) {
      backActionAssetImageWidget = WTHeaderBuilder.createAssetsImage(
        margin: const EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0),
        size: backActionIconSize,
        image: backActionAssetImage
      )!;
    }

    /// backActionMemoryImage
    Widget? backActionMemoryImageWidget = WTComponentBuilder.emptyComponent();
    if(backActionMemoryImage != null) {
      backActionMemoryImageWidget = WTHeaderBuilder.createMemoryImage(
        margin: const EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0),
        size: backActionIconSize,
        image: backActionMemoryImage
      )!;
    }

    /// backActionSvgMemory, backActionSvgString, backActionSvgNetwork, backActionSvgAsset
    Widget? svgImageWidget = WTComponentBuilder.emptyComponent();
    if(backActionSvgMemory != null || backActionSvgString != null || backActionSvgNetwork != null || backActionSvgAsset != null) {
      Widget? widget  = WTComponentBuilder.emptyComponent();
      double? svgSize = backActionIconSize;

      if(backActionSvgMemory != null) {
        widget = SvgPicture.memory(
          backActionSvgMemory!,
          fit: BoxFit.cover,
          width: svgSize,
          height: svgSize,
        );
      }

      if(backActionSvgString != null) {
        widget = SvgPicture.string(
          backActionSvgString!,
          fit: BoxFit.cover,
          width: svgSize,
          height: svgSize,
        );
      }

      if(backActionSvgNetwork != null) {
        widget = SvgPicture.network(
          backActionSvgNetwork!,
          fit: BoxFit.cover,
          width: svgSize,
          height: svgSize,
        );
      }

      if(backActionSvgAsset != null) {
        widget = SvgPicture.asset(
          backActionSvgAsset!,
          fit: BoxFit.fill,
          width: svgSize,
          height: svgSize,
        );
      }

      svgImageWidget = Container(
        width: svgSize! + 15,
        height: svgSize + 15,
        padding: const EdgeInsets.fromLTRB(2.5, 2.5, 2.5, 2.5),
        margin: const EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: backActionSvgBackgroundColor,
          border: Border.all(
            color: backActionSvgBackgroundColor!,
            width: 1,
          ),
        ),
        child: widget,
      );
    }

    /// backActionLabel
    Widget? backActionLabelWidget = WTComponentBuilder.emptyComponent();
    if(backActionLabel != null) {
      backActionLabel = backActionLabel!.length > 20 ? '${backActionLabel!.substring(0, 20)}...' : backActionLabel;

      backActionLabelWidget = Container(
        margin: const EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0),
        child: WTComponentBuilder.createText(
          text: backActionLabel!,
          textAlign: TextAlign.left,
          textStyle: WTHeaderBuilder.textStyle(
            textColor: backActionLabelColor,
            fontSize: backActionLabelSize,
          ),
        )!,
      );
    }

    /// backActionLinkLabel
    Widget? backActionLinkLabelWidget = WTComponentBuilder.emptyComponent();
    if(backActionLinkLabel != null) {
      backActionLinkLabel = backActionLinkLabel!.length > 20 ? '${backActionLinkLabel!.substring(0, 20)}...' : backActionLinkLabel;

      backActionLinkLabelWidget = Container(
        margin: const EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0),
        child: WTComponentBuilder.createText(
          text: backActionLinkLabel!,
          textAlign: TextAlign.left,
          textStyle: WTHeaderBuilder.textStyle(
            textColor: backActionLinkLabelColor,
            fontSize: backActionLinkLabelSize,
          ),
        )!
      );
    }

    return GestureDetector(
      onTap: backAction ?? () {},
      child: Container(
        padding: const EdgeInsets.all(0.0),
        margin: const EdgeInsets.fromLTRB(15.0, 0.0, 5.0, 0.0),
        color: Colors.transparent,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            backActionIconWidget!,

            svgImageWidget!,

            backActionAssetImageWidget!,

            backActionMemoryImageWidget!,

            backActionNetworkImageWidget!,

            backActionLabelWidget!,

            backActionLinkLabelWidget!,
          ],
        ),
      ),
    );
  }

  Widget? widgetsCenter() {
    if(label == null) { return const Expanded(child: SizedBox.shrink()); }

    label = label!.length > 20 ? '${label!.substring(0, 20)}...' : label;

    return Expanded(
      child: Container(
        color: Colors.transparent,
        width: double.infinity,
        alignment: Alignment.center,
        child: WTComponentBuilder.createText(
          text: label!,
          textAlign: TextAlign.center,
          textStyle: WTHeaderBuilder.textStyle(
            textColor: labelColor,
            fontSize: labelSize
          ),
        ),
      ),
    );
  }

  Widget? createActionsList() {
    if(actions!.isEmpty) { return const SizedBox.shrink(); }

    List<Widget>? actionList = List<Widget>.empty(growable: true);
    for(int i = 0; i < actions!.length; i++) {
      var a = actions![i];
      var actionPadding = const EdgeInsets.all(0.0);
      var actionMargin  = i == actions!.length -1 && menuItems!.isNotEmpty ? const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0) : const EdgeInsets.fromLTRB(0.0, 0.0, 15.0, 0.0);

      Widget? iconWidget, labelWidget, linkLabelWidget;

      if(a['icon'] != null) {
        iconWidget = WTComponentBuilder.createIcon(
          iconData: a['icon'],
          size: actionIconSize,
          color: actionIconColor
        );
      }

      if(a['label'] != null) {
        labelWidget = WTComponentBuilder.createText(
          text: a['label']!,
          textAlign: TextAlign.center,
            textStyle: WTHeaderBuilder.textStyle(
            textColor: actionLabelColor,
            fontSize: actionLabelSize
          ),
        );
      }

      if(a['linkLabel'] != null) {
        linkLabelWidget = WTComponentBuilder.createText(
          text: a['linkLabel']!,
          textAlign: TextAlign.center,
          textStyle: WTHeaderBuilder.textStyle(
            textColor: actionLinkLabelColor,
            fontSize: actionLinkLabelSize
          ),
        );
      }

      if(labelWidget == null && linkLabelWidget == null) {
        actionList.add(
          GestureDetector(
            onTap: a['action'],
            child: Container(
              padding: actionPadding,
              margin: actionMargin,
              child: iconWidget,
            ),
          )
        );
      }

      if(labelWidget != null || linkLabelWidget != null) {
        actionList.add(
          Container(
            padding: actionPadding,
            margin: actionMargin,
            child: TextButton.icon(
              onPressed: a['action'],
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(0.0),
              ),
              icon: iconWidget ?? WTComponentBuilder.emptyComponent(),
              label: labelWidget ?? linkLabelWidget ?? WTComponentBuilder.emptyComponent()!,
            ),
          ),
        );
      }
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ...actionList,
      ],
    );
  }

  Widget? createMenuList() {
    if(menuItems!.isEmpty) { return const SizedBox.shrink(); }

    List<PopupMenuItem>? popupMenuItems = List.empty(growable: true);
    for(var m in menuItems!) {
      if(m['icon'] != null && m['label'] == null) {
        popupMenuItems.add(
          PopupMenuItem(
            onTap: m['action'],
            padding: const EdgeInsets.all(0.0),
            child: Container(
              color: menuBackgroundColor,
              width: double.infinity,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(0.0),
              margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
              child: WTComponentBuilder.createIcon(
                iconData: m['icon'],
                size: menuIconSize,
                color: menuItemIconColor
              ),
            ),
          )
        );
      }

      if(m['icon'] == null && m['label'] != null) {
        popupMenuItems.add(
          PopupMenuItem(
            onTap: m['action'],
            padding: const EdgeInsets.all(0.0),
            child: Container(
              color: menuBackgroundColor,
              width: double.infinity,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(0.0),
              margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
              child: WTComponentBuilder.createText(
                text: m['label']!,
                textAlign: TextAlign.left,
                textStyle: WTHeaderBuilder.textStyle(
                  textColor: menuItemIconColor,
                  fontSize: menuLabelSize
                ),
              ),
            ),
          )
        );
      }

      if(m['icon'] != null && m['label'] != null) {
        popupMenuItems.add(
          PopupMenuItem(
            onTap: m['action'],
            padding: const EdgeInsets.all(0.0),
            child: Container(
              color: menuBackgroundColor,
              width: double.infinity,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(0.0),
              margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  WTComponentBuilder.createIcon(
                    iconData: m['icon'],
                    size: menuIconSize,
                    color: menuItemIconColor
                  )!,
                  WTComponentBuilder.sizedComponent(width: 5.0)!,
                  WTComponentBuilder.createText(
                    text: m['label']!,
                    textAlign: TextAlign.left,
                    textStyle: WTHeaderBuilder.textStyle(
                      textColor: menuItemIconColor,
                      fontSize: menuLabelSize
                    )
                  )!,
                ],
              ),
            ),
          )
        );
      }
    }

    return PopupMenuButton(
      iconSize:    menuIconSize,
      color:       menuBackgroundColor,
      shadowColor: menuBackgroundColor!,
      padding:     const EdgeInsets.all(0.0),
      menuPadding: const EdgeInsets.all(0.0),
      position:    PopupMenuPosition.under,
      onOpened:    () => setState(() { menuIconColor = Colors.blueGrey; }),
      onCanceled:  () => setState(() { menuIconColor = widget.menuIconColor; }),
      icon:        WTComponentBuilder.createIcon(iconData: menuIcon, size: menuIconSize, color: menuIconColor)!,
      itemBuilder: (BuildContext context) => [ ...popupMenuItems ],
    );
  }

  Widget? widgetsRight() {
    if(actions!.isEmpty && menuItems!.isEmpty) { return SizedBox(height: 50.0, width: menuIconSize! + 10); }

    return Container(
      padding: const EdgeInsets.all(0.0),
      margin: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
      color: Colors.transparent,
      alignment: Alignment.center,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          createActionsList()!,
          createMenuList()!,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      key: widget.key,
      elevation: shadow! ? 2.0 : 0.0,
      titleSpacing: 0.0,
      automaticallyImplyLeading: false,
      shadowColor: shadow! ? Colors.grey.shade50 : Colors.transparent,
      backgroundColor: backgroundColor,
      title: Container(
        color: backgroundColor,
        width: width,
        height: height,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            widgetsLeft()!,   /// back action
            widgetsCenter()!, /// header label
            widgetsRight()!,  /// actions and menu list
          ],
        ),
      ),
    );
  }

}