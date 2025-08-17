import '../../../domain/entity/portfolio/portfolio.dart';
import '../../../domain/repository/portfolio/portfolio_repository.dart';

class PortfolioRepositoryImpl extends PortfolioRepository {

  @override
  Future<bool?> init(int? accountKey) async {
    throw UnimplementedError();
  }

  @override
  Future<void> close() async {
    throw UnimplementedError();
  }

  @override
  Future<bool?> insert(Portfolio? entity) async {
    throw UnimplementedError();
  }
  
  @override
  Future<bool?> update(Portfolio? entity) async {
    throw UnimplementedError();
  }

  @override
  Future<bool?> delete(Portfolio? entity) async {
    throw UnimplementedError();
  }

  @override
  Future<bool?> deleteAll() async {
    throw UnimplementedError();
  }

  @override
  Future<Portfolio?> getByKey(int? key) async {
    throw UnimplementedError();
  }

  @override
  Future<List<Portfolio>?> getAll() async {
    throw UnimplementedError();
  }

  @override
  Future<bool?> isEmpty() async {
    throw UnimplementedError();
  }

}