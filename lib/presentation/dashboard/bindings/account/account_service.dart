import 'package:resumebuilderadmin/domain/entity/account/account.dart';

abstract class AccountService {

  Account? account = Account().empty();

  Future<void> initialize();

  Future<void> login();

  Future<void> logout();

}