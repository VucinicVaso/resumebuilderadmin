import 'package:wtoolboxweb/base/entity/wtw_entity.dart';
import 'package:wtoolboxweb/base/entity/wtw_object_mapper.dart';
import '../../../domain/entity/skill/skill.dart';

class SkillMapper extends WTWObjectMapper<Skill, SkillModel> {

  @override
  Skill toEntity(SkillModel model) {
    return Skill(
      key:       model.key,
      date:      model.date,
      title:     model.title,
      icon:      model.icon,
      subskills: model.subskills,
    );
  }

  @override
  SkillModel toModel(Skill entity) {
    return SkillModel(
      key:       entity.key,
      date:      entity.date,
      title:     entity.title,
      icon:      entity.icon,
      subskills: entity.subskills,
    );
  }

}

class SkillModel extends WTWEntity<SkillModel> {

  SkillModel({
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
  void setSubSkills(List<String>? v) { subskills = v; }

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
  SkillModel? fromJson(Map? json) {
    return SkillModel(
      key:       json!['key'],
      date:      json['date'],
      title:     json['title'],
      icon:      json['icon'],
      subskills: json['subskills'],
    );
  }

  @override
  SkillModel? empty() {
    return SkillModel(
      key:       0,
      date:      '',
      title:     '',
      icon:      '',
      subskills: [],
    );
  }
  
}