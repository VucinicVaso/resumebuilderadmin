import '../../../domain/entity/experience/experience.dart';
import '../../../domain/repository/experience/experience_repository.dart';

class ExperienceRepositoryImpl extends ExperienceRepository {

  @override
  Future<bool?> init(int? accountKey) async {
    throw UnimplementedError();
  }

  @override
  Future<void> close() async {
    throw UnimplementedError();
  }

  @override
  Future<bool?> insert(Experience? entity) async {
    throw UnimplementedError();
  }
  
  @override
  Future<bool?> update(Experience? entity) async {
    throw UnimplementedError();
  }

  @override
  Future<bool?> delete(Experience? entity) async {
    throw UnimplementedError();
  }

  @override
  Future<bool?> deleteAll() async {
    throw UnimplementedError();
  }

  @override
  Future<Experience?> getByKey(int? key) async {
    throw UnimplementedError();
  }

  @override
  Future<List<Experience>?> getAll() async {
    throw UnimplementedError();
  }

  @override
  Future<bool?> isEmpty() async {
    throw UnimplementedError();
  }

}