import '../../../domain/entity/language/language.dart';
import '../../../domain/repository/language/language_repository.dart';

class LanguageRepositoryImpl extends LanguageRepository {

  @override
  Future<bool?> init(int? accountKey) async {
    throw UnimplementedError();
  }

  @override
  Future<void> close() async {
    throw UnimplementedError();
  }

  @override
  Future<bool?> insert(Language? entity) async {
    throw UnimplementedError();
  }
  
  @override
  Future<bool?> update(Language? entity) async {
    throw UnimplementedError();
  }

  @override
  Future<bool?> delete(Language? entity) async {
    throw UnimplementedError();
  }

  @override
  Future<bool?> deleteAll() async {
    throw UnimplementedError();
  }

  @override
  Future<Language?> getByKey(int? key) async {
    throw UnimplementedError();
  }

  @override
  Future<List<Language>?> getAll() async {
    throw UnimplementedError();
  }

  @override
  Future<bool?> isEmpty() async {
    throw UnimplementedError();
  }

}