import 'package:flutter/material.dart';
import '../wt_scaffold.dart';

class WTScaffoldImpl extends WTScaffold {

  @override
  Widget? build() {
    if(sidebar != null) {
      header!
        ..withSidebar()
        ..setSidebarAction(() { globalKey!.currentState!.openDrawer(); });
    }

    return LayoutBuilder(
      key: getUniqueKey(),
      builder: (context, constriants) {
        print('--------------------------------------------');
        print('WTSidebarBasic(width: ${constriants.maxWidth}, height: ${constriants.maxHeight})');
        print('--------------------------------------------');

        width  = constriants.maxWidth;
        height = constriants.maxHeight;

        header?.setWidth(width);
        sidebar?..setWidth(width)..setHeight(height);
        body?..setWidth(width)..setHeight(height);
        floatingMenu?..setWidth(width)..setHeight(height);
        footer?..setWidth(width)..setHeight(height);

        return Scaffold(
          key: globalKey,
          backgroundColor: backgroundColor,
          appBar: header?.build(),
          drawer: sidebar?.build(),
          body: body?.build(),
          floatingActionButton: floatingMenu?.build(),
          bottomNavigationBar: footer?.build(),
        );
      }
    );
  }

}