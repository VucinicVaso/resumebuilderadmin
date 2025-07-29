import 'package:resumebuilderadmin/wtoolbox/clean_architecture/repository/wt_repository.dart';
import '../../entity/account/account.dart';

abstract class AccountRepository extends WTRepository<Account> {

  Account? account;

  // login
  Future<bool>? singIn({ String? username, String? password });

  // register
  Future<bool>? signUp({ String? username, String? password });

  // logout
  Future<bool>? signOut();

}