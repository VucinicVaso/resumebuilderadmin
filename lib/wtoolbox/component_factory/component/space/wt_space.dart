import '../wt_component.dart';

abstract class WTSpace extends WTComponent {

  double? horizontal, vertical;
  void setHorizontalSpace(double? v) { horizontal = v; }
  void setVerticalSpace(double? v) { vertical = v; }

}

