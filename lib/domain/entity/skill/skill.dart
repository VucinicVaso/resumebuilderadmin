import 'package:wtoolboxweb/base/entity/wtw_entity.dart';

class Skill extends WTWEntity<Skill> {

  Skill({
    super.key,
    super.date,
    this.title,
    this.icon,
    this.subskills,
  });

  String? title;
  void setTitle(String? v) { title = v; }

  String? icon;
  void setIcon(String? v) { icon = v; }

  List<String>? subskills = List<String>.empty(growable: true);
  void setSubskills(List<String>? v) { subskills = v; }

  @override
  Map<String, dynamic>? toJson() {
    return {
      'key':       key,
      'date':      date,
      'title':     title,
      'icon':      icon,
      'subskills': subskills,
    };
  }

  @override
  Skill? fromJson(Map? json) {
    return Skill(
      key:       json!['key'],
      date:      json['date'],
      title:     json['title'],
      icon:      json['icon'],
      subskills: json['subskills'],
    );
  }

  @override
  Skill? empty() {
    return Skill(
      key:       0,
      date:      '',
      title:     '',
      icon:      '',
      subskills: [],
    );
  }
  
}