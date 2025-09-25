import 'package:wtoolboxweb/base/entity/wtw_entity.dart';
import 'package:wtoolboxweb/base/entity/wtw_object_mapper.dart';
import '../../../domain/entity/cv/cv.dart';

class CVMapper extends WTWObjectMapper<CV, CVModel> {

  @override
  CV toEntity(CVModel model) {
    return CV(
      key:      model.key,
      date:     model.date,
      file:     model.file,
      isActive: model.isActive,
    );
  }

  @override
  CVModel toModel(CV entity) {
    return CVModel(
      key:      entity.key,
      date:     entity.date,
      file:     entity.file,
      isActive: entity.isActive,
    );
  }

}

class CVModel extends WTWEntity<CVModel> {

  CVModel({
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
  CVModel? fromJson(Map? json) {
    return CVModel(
      key:      json!['key'],
      date:     json['date'],
      file:     json['file'],
      isActive: json['isActive'],
    );
  }

  @override
  CVModel? empty() {
    return CVModel(
      key:      0,
      date:     '',
      file:     '',
      isActive: false,
    );
  }

}