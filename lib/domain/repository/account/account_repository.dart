import 'package:resumebuilderadmin/wtoolbox/clean_architecture/repository/wt_repository.dart';
import '../../entity/account/account.dart';

abstract class AccountRepository extends WTRepository<Account> {

  Account? account;

  Future<bool>? singIn({ String? username, String? password });

  Future<bool>? signUp({ String? username, String? password });

  Future<bool>? signOut();

}