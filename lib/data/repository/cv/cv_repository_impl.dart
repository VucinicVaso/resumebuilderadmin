import '../../../domain/entity/cv/cv.dart';
import '../../../domain/repository/cv/cv_repository.dart';

class CVRepositoryImpl extends CVRepository {

  @override
  Future<bool?> init(int? accountKey) async {
    throw UnimplementedError();
  }

  @override
  Future<void> close() async {
    throw UnimplementedError();
  }

  @override
  Future<bool?> insert(CV? entity) async {
    throw UnimplementedError();
  }
  
  @override
  Future<bool?> update(CV? entity) async {
    throw UnimplementedError();
  }

  @override
  Future<bool?> delete(CV? entity) async {
    throw UnimplementedError();
  }

  @override
  Future<bool?> deleteAll() async {
    throw UnimplementedError();
  }

  @override
  Future<CV?> getByKey(int? key) async {
    throw UnimplementedError();
  }

  @override
  Future<List<CV>?> getAll() async {
    throw UnimplementedError();
  }

  @override
  Future<bool?> isEmpty() async {
    throw UnimplementedError();
  }

}