import 'package:wtoolboxweb/clean_architecture/entity/wtw_entity.dart';
import 'package:wtoolboxweb/clean_architecture/entity/wtw_object_mapper.dart';
import '../../../domain/entity/portfolio/portfolio.dart';

class PortfolioMapper extends WTWObjectMapper<Portfolio, PortfolioModel> {

  @override
  Portfolio toEntity(PortfolioModel model) {
    return Portfolio(
      key:         model.key,
      date:        model.date,
      title:       model.title,
      description: model.description,
      type:        model.type,
      links:       model.links,
      files:       model.files,
    );
  }

  @override
  PortfolioModel toModel(Portfolio entity) {
    return PortfolioModel(
      key:         entity.key,
      date:        entity.date,
      title:       entity.title,
      description: entity.description,
      type:        entity.type,
      links:       entity.links,
      files:       entity.files,
    );
  }

}

class PortfolioModel extends WTWEntity<PortfolioModel> {

  PortfolioModel({
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
  PortfolioModel? fromJson(Map? json) {
    return PortfolioModel(
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
  PortfolioModel? empty() {
    return PortfolioModel(
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