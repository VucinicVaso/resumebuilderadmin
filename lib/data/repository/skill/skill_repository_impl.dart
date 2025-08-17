import '../../../domain/entity/skill/skill.dart';
import '../../../domain/repository/skill/skill_repository.dart';

class SkillRepositoryImpl extends SkillRepository {

  @override
  Future<bool?> init(int? accountKey) async {
    throw UnimplementedError();
  }

  @override
  Future<void> close() async {
    throw UnimplementedError();
  }

  @override
  Future<bool?> insert(Skill? entity) async {
    throw UnimplementedError();
  }
  
  @override
  Future<bool?> update(Skill? entity) async {
    throw UnimplementedError();
  }

  @override
  Future<bool?> delete(Skill? entity) async {
    throw UnimplementedError();
  }

  @override
  Future<bool?> deleteAll() async {
    throw UnimplementedError();
  }

  @override
  Future<Skill?> getByKey(int? key) async {
    throw UnimplementedError();
  }

  @override
  Future<List<Skill>?> getAll() async {
    throw UnimplementedError();
  }

  @override
  Future<bool?> isEmpty() async {
    throw UnimplementedError();
  }

}