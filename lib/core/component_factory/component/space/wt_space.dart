import '../wt_component.dart';

abstract class WTSpace extends WTComponent {

  double? horizontalSpace, verticalSpace;
  void setHorizontalSpace(double? v) { horizontalSpace = v; }
  void setVerticalSpace(double? v) { verticalSpace = v; }

}

