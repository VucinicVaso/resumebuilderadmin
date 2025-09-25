import 'package:wtoolboxweb/base/entity/wtw_entity.dart';
import 'package:wtoolboxweb/base/entity/wtw_object_mapper.dart';
import '../../../domain/entity/education/education.dart';

class EducationMapper extends WTWObjectMapper<Education, EducationModel> {

  @override
  Education toEntity(EducationModel model) {
    return Education(
      key:         model.key,
      date:        model.date,
      title:       model.title,
      link:        model.link,
      description: model.description,
      dateTime:    model.dateTime,
    );
  }

  @override
  EducationModel toModel(Education entity) {
    return EducationModel(
      key:         entity.key,
      date:        entity.date,
      title:       entity.title,
      link:        entity.link,
      description: entity.description,
      dateTime:    entity.dateTime,
    );
  }

}

class EducationModel extends WTWEntity<EducationModel> {

  EducationModel({
    super.key,
    super.date,
    this.title,
    this.link,
    this.description,
    this.dateTime,
  });

  String? title;
  void setTitle(String? v) { title = v; }

  String? link;
  void setLink(String? v) { link = v; }

  String? description;
  void setDescription(String? v) { description = v; }

  String? dateTime;
  void setDateTime(String? v) { dateTime = v; }

  @override
  Map<String, dynamic>? toJson() {
    return {
      'key':         key,
      'date':        date,
      'title':       title,
      'link':        link,
      'description': description,
      'dateTime':    dateTime,
    };
  }  

  @override
  EducationModel? fromJson(Map? json) {
    return EducationModel(
      key:         json!['key'],
      date:        json['date'],
      title:       json['title'],
      link:        json['link'],
      description: json['description'],
      dateTime:    json['dateTime'],
    );
  }

  @override
  EducationModel? empty() {
    return EducationModel(
      key:         0,
      date:        '',
      title:       '',
      link:        '',
      description: '',
      dateTime:    '',
    );
  }
  
}