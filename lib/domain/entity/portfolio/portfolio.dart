import 'package:wtoolboxweb/clean_architecture/entity/wtw_entity.dart';

class Portfolio extends WTWEntity<Portfolio> {

  Portfolio({
    super.key,
    super.date,
    this.title,
    this.description,
    this.links,
  });

  String? title;
  void setTitle(String? v) { title = v; }

  String? description;
  void setDescription(String? v) { description = v; }

  List<String>? links = List<String>.empty(growable: true); 
  void setDateFrom(List<String>? v) { links = v; }

  @override
  Map<String, dynamic>? toJson() {
    return {
      'key':         key,
      'date':        date,
      'title':       title,
      'description': description,
      'links':       links,
    };
  }  

  @override
  Portfolio? fromJson(Map? json) {
    return Portfolio(
      key:         json!['key'],
      date:        json['date'],
      title:       json['title'],
      description: json['description'],
      links:       json['links'],
    );
  }

  @override
  Portfolio? empty() {
    return Portfolio(
      key:         0,
      date:        '',
      title:       '',
      description: '',
      links:       [],
    );
  }
  
}