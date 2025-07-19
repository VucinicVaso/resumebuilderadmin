import 'package:flutter/material.dart';
import '../wt_footer.dart';

class WTFooterFixed extends WTFooter {

  BottomNavigationBarItem? createBarItem(Map<dynamic, dynamic>? e) {
    return BottomNavigationBarItem(
      icon: Container(
        padding: itemPadding,
        margin: itemMargin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: Colors.transparent,
        ),
        foregroundDecoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: Icon(
          e!['icon'],
          size: itemIconSize,
          color: unselectedItemIconColor
        ),
      ),
      label: e['label'],
      activeIcon: Container(
        padding: itemPadding,
        margin: itemMargin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: selectedItemBackgroundColor,
        ),
        child: Icon(
          e['icon'],
          size: itemIconSize,
          color: selectedItemIconColor
        ),
      ),
    );
  }

  @override
  Widget? build() {
    return LayoutBuilder(
      key: getUniqueKey(),
      builder: (context, constraints) {
        itemPadding = itemPadding ?? const EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 6.0);
        itemMargin  = itemMargin ?? const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0);

        width = constraints.maxWidth;
        if(width! > 1000) {
          itemIconSize  = 27;
          itemLabelSize = 20;
        }
        if(width! < 1000) {
          itemIconSize  = 25;
          itemLabelSize = 18;
        }

        return BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            ...items!.map((i) => createBarItem(i)!),
          ],
          onTap: (int i) => selectedItemAction!(i),
          type: BottomNavigationBarType.fixed,
          backgroundColor: backgroundColor,
          currentIndex: selectedItem!,
          selectedItemColor: selectedItemLabelColor,
          unselectedItemColor: unselectedItemIconColor,
          selectedLabelStyle: TextStyle(
            color: selectedItemLabelColor,
            fontSize: itemLabelSize,
            fontWeight: FontWeight.bold
          ),
          unselectedLabelStyle: TextStyle(
            color: unselectedItemLabelColor,
            fontSize: itemLabelSize,
            fontWeight: FontWeight.normal
          ),
        );
      }
    );
  }

}