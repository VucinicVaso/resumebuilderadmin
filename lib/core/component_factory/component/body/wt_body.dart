import '../wt_component.dart';

abstract class WTBody extends WTComponent {

  List<WTComponent>? components = List<WTComponent>.empty(growable: true);
  void addComponent(WTComponent? v) { components!.add(v!); }
  void addComponents(List<WTComponent>? v) { components!.addAll(v!); }

}