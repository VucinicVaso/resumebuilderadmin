import '../wt_component.dart';

abstract class WTLayout extends WTComponent {

  // size of a layout
  bool? small, medium, large = false;
  void sm() { small = true; }
  void md() { medium = true; }
  void lg() { large = true; }

  // 0 padding and margin
  void flat() {
    setPadding(left: 0.0, top: 0.0, right: 0.0, bottom: 0.0);
    setMargin(left: 0.0, top: 0.0, right: 0.0, bottom: 0.0);
  }

  List<WTComponent>? components = List<WTComponent>.empty(growable: true);
  void addComponent(WTComponent? v) { components!.add(v!); }
  void addComponents(List<WTComponent>? v) { components!.addAll(v!); }

}