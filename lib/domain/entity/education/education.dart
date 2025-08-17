import 'package:wtoolboxweb/clean_architecture/entity/wtw_entity.dart';

class Education extends WTWEntity<Education> {

  Education({
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
  Education? fromJson(Map? json) {
    return Education(
      key:         json!['key'],
      date:        json['date'],
      title:       json['title'],
      link:        json['link'],
      description: json['description'],
      dateTime:    json['dateTime'],
    );
  }

  @override
  Education? empty() {
    return Education(
      key:         0,
      date:        '',
      title:       '',
      link:        '',
      description: '',
      dateTime:    '',
    );
  }
  
}