import 'package:resumebuilderadmin/core/wtoolbox/logger/wt_logger.dart';
import '../../../domain/entity/account/account.dart';
import '../../../domain/repository/account/account_repository.dart';

class AccountRepositoryImpl extends AccountRepository {

  @override
  Future<bool?> init(int? accountKey) {
    // TODO: implement init
    throw UnimplementedError();
  }

  @override
  Future<void> close() {
    // TODO: implement close
    throw UnimplementedError();
  }

  @override
  Future<bool?> insert(Account? entity) {
    // TODO: implement insert
    throw UnimplementedError();
  }
  
  @override
  Future<bool?> update(Account? entity) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future<bool?> delete(Account? entity) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<bool?> deleteAll() {
    // TODO: implement deleteAll
    throw UnimplementedError();
  }

  @override
  Future<Account?> getByKey(int? key) {
    // TODO: implement getByKey
    throw UnimplementedError();
  }

  @override
  Future<List<Account>?> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<bool?> isEmpty() {
    // TODO: implement isEmpty
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