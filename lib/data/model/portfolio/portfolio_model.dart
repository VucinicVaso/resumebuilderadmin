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
      links:       model.links,
    );
  }

  @override
  PortfolioModel toModel(Portfolio entity) {
    return PortfolioModel(
      key:         entity.key,
      date:        entity.date,
      title:       entity.title,
      description: entity.description,
      links:       entity.links,
    );
  }

}

class PortfolioModel extends WTWEntity<PortfolioModel> {

  PortfolioModel({
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
  PortfolioModel? fromJson(Map? json) {
    return PortfolioModel(
      key:         json!['key'],
      date:        json['date'],
      title:       json['title'],
      description: json['description'],
      links:       json['links'],
    );
  }

  @override
  PortfolioModel? empty() {
    return PortfolioModel(
      key:         0,
      date:        '',
      title:       '',
      description: '',
      links:       [],
    );
  }
  
}