import 'package:wtoolboxweb/base/entity/wtw_entity.dart';

class CV extends WTWEntity<CV> {

  CV({
    super.key,
    super.date,
    this.file,
    this.isActive,
  });

  String? file;
  void setFile(String? v) { file = v; }

  bool? isActive;
  void setIsActive(bool? v) { isActive = v; }

  @override
  Map<String, dynamic>? toJson() {
    return {
      'key':      key,
      'date':     date,
      'file':     file,
      'isActive': isActive,
    };
  }  

  @override
  CV? fromJson(Map? json) {
    return CV(
      key:      json!['key'],
      date:     json['date'],
      file:     json['file'],
      isActive: json['isActive'],
    );
  }

  @override
  CV? empty() {
    return CV(
      key:      0,
      date:     '',
      file:     '',
      isActive: false,
    );
  }
  
}