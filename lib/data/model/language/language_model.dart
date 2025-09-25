import 'package:wtoolboxweb/base/entity/wtw_entity.dart';
import 'package:wtoolboxweb/base/entity/wtw_object_mapper.dart';
import '../../../domain/entity/language/language.dart';

class LanguageMapper extends WTWObjectMapper<Language, LanguageModel> {

  @override
  Language toEntity(LanguageModel model) {
    return Language(
      key:   model.key,
      date:  model.date,
      title: model.title,
      level: model.level,
    );
  }

  @override
  LanguageModel toModel(Language entity) {
    return LanguageModel(
      key:   entity.key,
      date:  entity.date,
      title: entity.title,
      level: entity.level,
    );
  }

}

class LanguageModel extends WTWEntity<LanguageModel> {

  LanguageModel({
    super.key,
    super.date,
    this.title,
    this.level,
  });

  String? title;
  void setTitle(String? v) { title = v; }

  String? level;
  void setLevel(String? v) { level = v; }

  @override
  Map<String, dynamic>? toJson() {
    return {
      'key':   key,
      'date':  date,
      'title': title,
      'level': level,
    };
  }

  @override
  LanguageModel? fromJson(Map? json) {
    return LanguageModel(
      key:   json!['key'],
      date:  json['date'],
      title: json['title'],
      level: json['level'],
    );
  }

  @override
  LanguageModel? empty() {
    return LanguageModel(
      key:   0,
      date:  '',
      title: '',
      level: '',
    );
  }
  
}