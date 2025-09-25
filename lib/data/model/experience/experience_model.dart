import 'package:wtoolboxweb/base/entity/wtw_entity.dart';
import 'package:wtoolboxweb/base/entity/wtw_object_mapper.dart';
import '../../../domain/entity/experience/experience.dart';

class ExperienceMapper extends WTWObjectMapper<Experience, ExperienceModel> {

  @override
  Experience toEntity(ExperienceModel model) {
    return Experience(
      key:         model.key,
      date:        model.date,
      title:       model.title,
      link:        model.link,
      position:    model.position,
      description: model.description,
      dateFrom:    model.dateFrom,
      dateTo:      model.dateTo,
      totalTime:   model.totalTime,
    );
  }

  @override
  ExperienceModel toModel(Experience entity) {
    return ExperienceModel(
      key:         entity.key,
      date:        entity.date,
      title:       entity.title,
      link:        entity.link,
      position:    entity.position,
      description: entity.description,
      dateFrom:    entity.dateFrom,
      dateTo:      entity.dateTo,
      totalTime:   entity.totalTime,
    );
  }

}

class ExperienceModel extends WTWEntity<ExperienceModel> {

  ExperienceModel({
    super.key,
    super.date,
    this.title,
    this.link,
    this.position,
    this.description,
    this.dateFrom,
    this.dateTo,
    this.totalTime,
  });

  String? title;
  void setTitle(String? v) { title = v; }

  String? link;
  void setLink(String? v) { link = v; }

  String? position;
  void setPosition(String? v) { position = v; }

  String? description;
  void setDescription(String? v) { description = v; }

  String? dateFrom;
  void setDateFrom(String? v) { dateFrom = v; }

  String? dateTo;
  void setDateTo(String? v) { dateTo = v; }

  String? totalTime;
  void setTotalTime(String? v) { totalTime = v; }

  @override
  Map<String, dynamic>? toJson() {
    return {
      'key':         key,
      'date':        date,
      'title':       title,
      'link':        link,
      'position':    position,
      'description': description,
      'dateFrom':    dateFrom,
      'dateTo':      dateTo,
      'totalTime':   totalTime,
    };
  }  

  @override
  ExperienceModel? fromJson(Map? json) {
    return ExperienceModel(
      key:         json!['key'],
      date:        json['date'],
      title:       json['title'],
      link:        json['link'],
      position:    json['position'],
      description: json['description'],
      dateFrom:    json['dateFrom'],
      dateTo:      json['dateTo'],
      totalTime:   json['totalTime'],
    );
  }

  @override
  ExperienceModel? empty() {
    return ExperienceModel(
      key:         0,
      date:        '',
      title:       '',
      link:        '',
      position:    '',
      description: '',
      dateFrom:    '',
      dateTo:      '',
      totalTime:   '',
    );
  }
  
}