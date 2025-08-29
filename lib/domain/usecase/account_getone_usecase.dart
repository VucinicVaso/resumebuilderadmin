import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/clean_architecture/usecase/wtw_usecase.dart';
import '../entity/account/account.dart';
import '../repository/account/account_repository.dart';

class AccountGetOneUseCase extends WTWUseCase<Account> {

  @override
  Future<Account> call() async {
    Account? response = Get.find<AccountRepository>().account;
    return response!;
  }

}