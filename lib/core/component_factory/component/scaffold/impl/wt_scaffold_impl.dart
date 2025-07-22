import 'package:flutter/material.dart';
import '../wt_scaffold.dart';

class WTScaffoldImpl extends WTScaffold {

  @override
  Widget? build() {
    if(header!.sidebar!) {
      header!.setSidebarAction(() {
        globalKey!.currentState!.openDrawer();
      });
    }

    return Scaffold(
      key: globalKey,
      backgroundColor: backgroundColor,
      appBar: header?.build(),
      drawer: sidebar?.build(),
      body: body,
      floatingActionButton: floatingMenu?.build(),
      bottomNavigationBar: footer?.build(),
    );
  }

}