import 'package:flutter/material.dart';
import '../wt_sidebar.dart';

class WTSidebarBasic extends WTSidebar {

  Widget? actionsList() {
    Widget? emptyWidget = SizedBox.shrink();
    if(actions!.isEmpty) { return emptyWidget; }

    List<Widget>? actionWidgets = List<Widget>.empty(growable: true);
    for(var a in actions!) {
      Widget? w = GestureDetector(
        onTap: a['action']! != null ? a['action'] : () {},
        child: Container(
          padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
          margin: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 5.0),
          color: Colors.transparent,
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              /// icon
              a['icon'] == null
                ? emptyWidget
                : Icon(
                    a['icon'],
                    color: iconColor,
                    size: iconSize,
                  ),

              /// space between
              a['icon'] == null || a['label'] == null ? emptyWidget : SizedBox(width: 10.0, height: 0.0),

              /// label
              a['label'] == null
                ? emptyWidget
                : Text(
                  a['label'],
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: labelColor,
                    fontSize: labelSize,
                  ),
                ),
            ],
          ),
        ),
      );

      actionWidgets.add(w);
    }

    return Container(
      padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
      width: sidebarWidth,
      alignment: Alignment.topLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ...actionWidgets,
        ],
      ),
    );
  }

  @override
  Widget? build() {
    return LayoutBuilder(
      key: getUniqueKey(),
      builder: (context, constraints) {
        width        = constraints.maxWidth;
        sidebarWidth = width! * 0.3;
        iconSize     = width! > 1000 ? 27 : 25;
        labelSize    = width! > 1000 ? 20 : 18;

        return Drawer(
          backgroundColor: backgroundColor,
          shadowColor: borderColor,
          width: sidebarWidth,
          child: actionsList(),
        );
      },
    );
  }

}