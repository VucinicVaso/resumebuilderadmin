import 'package:wtoolboxweb/base/entity/wtw_entity.dart';

class Language extends WTWEntity<Language> {

  Language({
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
  Language? fromJson(Map? json) {
    return Language(
      key:   json!['key'],
      date:  json['date'],
      title: json['title'],
      level: json['level'],
    );
  }

  @override
  Language? empty() {
    return Language(
      key:   0,
      date:  '',
      title: '',
      level: '',
    );
  }
  
}