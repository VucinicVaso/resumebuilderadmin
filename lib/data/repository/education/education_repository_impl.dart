import '../../../domain/entity/education/education.dart';
import '../../../domain/repository/education/education_repository.dart';

class EducationRepositoryImpl extends EducationRepository {

  @override
  Future<bool?> init(int? accountKey) async {
    throw UnimplementedError();
  }

  @override
  Future<void> close() async {
    throw UnimplementedError();
  }

  @override
  Future<bool?> insert(Education? entity) async {
    throw UnimplementedError();
  }
  
  @override
  Future<bool?> update(Education? entity) async {
    throw UnimplementedError();
  }

  @override
  Future<bool?> delete(Education? entity) async {
    throw UnimplementedError();
  }

  @override
  Future<bool?> deleteAll() async {
    throw UnimplementedError();
  }

  @override
  Future<Education?> getByKey(int? key) async {
    throw UnimplementedError();
  }

  @override
  Future<List<Education>?> getAll() async {
    throw UnimplementedError();
  }

  @override
  Future<bool?> isEmpty() async {
    throw UnimplementedError();
  }

}