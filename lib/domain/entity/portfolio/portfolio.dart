import 'package:wtoolboxweb/clean_architecture/entity/wtw_entity.dart';

class Portfolio extends WTWEntity<Portfolio> {

  Portfolio({
    super.key,
    super.date,
    this.title,
    this.description,
    this.type,
    this.links,
    this.files,
  });

  String? title;
  void setTitle(String? v) { title = v; }

  String? description;
  void setDescription(String? v) { description = v; }

  String? type;
  void setType(String? v) { type = v; }

  List<String>? links = List<String>.empty(growable: true); 
  void setDateFrom(List<String>? v) { links = v; }

  List<String>? files = List<String>.empty(growable: true); 
  void setFiles(List<String>? v) { files = v; }

  @override
  Map<String, dynamic>? toJson() {
    return {
      'key':         key,
      'date':        date,
      'title':       title,
      'description': description,
      'type':        type,
      'links':       links,
      'files':       files,
    };
  }  

  @override
  Portfolio? fromJson(Map? json) {
    return Portfolio(
      key:         json!['key'],
      date:        json['date'],
      title:       json['title'],
      description: json['description'],
      type:        json['type'],
      links:       json['links'],
      files:       json['files'],
    );
  }

  @override
  Portfolio? empty() {
    return Portfolio(
      key:         0,
      date:        '',
      title:       '',
      description: '',
      type:        '',
      links:       [],
      files:       [],
    );
  }
  
}