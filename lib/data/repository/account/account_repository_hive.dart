import 'package:resumebuilderadmin/core/wtoolbox/logger/wt_logger.dart';
import '../../../domain/entity/account/account.dart';
import '../../../domain/repository/account/account_repository.dart';

class AccountRepositoryHive extends AccountRepository {

  @override
  Future<bool?> init(int? accountKey) async {
    throw UnimplementedError();
  }

  @override
  Future<void> close() async {
    throw UnimplementedError();
  }

  @override
  Future<bool?> insert(Account? entity) async {
    throw UnimplementedError();
  }
  
  @override
  Future<bool?> update(Account? entity) async {
    throw UnimplementedError();
  }

  @override
  Future<bool?> delete(Account? entity) async {
    throw UnimplementedError();
  }

  @override
  Future<bool?> deleteAll() async {
    throw UnimplementedError();
  }

  @override
  Future<Account?> getByKey(int? key) async {
    throw UnimplementedError();
  }

  @override
  Future<List<Account>?> getAll() async {
    throw UnimplementedError();
  }

  @override
  Future<bool?> isEmpty() async {
    throw UnimplementedError();
  }

  @override
  Future<bool>? singIn({ String? username, String? password }) async {
    // send http request and receive account and token
    return true;
  }

  @override
  Future<bool>? signUp({ String? username, String? password }) async {
    // send http request and receive account and token
    return true;
  }

  @override
  Future<bool>? signOut() async {
    // send http request to remove token
    account = Account().empty();
    return true;
  }

}