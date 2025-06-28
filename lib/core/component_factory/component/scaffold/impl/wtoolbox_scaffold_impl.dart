import 'package:flutter/material.dart';
import '../wtoolbox_scaffold.dart';

class WTScaffoldImpl extends WTScaffold {
  
  @override
  Widget? build() {
    return Scaffold(
      key:                  globalKey,
      backgroundColor:      backgroundColor,
      appBar:               header,
      body:                 body,
      floatingActionButton: flyMenu,
      bottomNavigationBar:  footer,
    );
  }

}