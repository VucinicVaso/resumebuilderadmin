import 'package:wtoolboxweb/base/entity/wtw_entity.dart';

class Experience extends WTWEntity<Experience> {

  Experience({
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
  Experience? fromJson(Map? json) {
    return Experience(
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
  Experience? empty() {
    return Experience(
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