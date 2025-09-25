import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/base/usecase/wtw_usecase_with_params.dart';
import '../../entity/account/account.dart';
import '../../repository/account/account_repository.dart';

class AccountUpdateUseCase extends WTWUseCaseWithParams<bool, AccountUpdateUseCaseParams> {

  @override
  Future<bool> call(AccountUpdateUseCaseParams params) async {
    try {
      bool? response = await Get.find<AccountRepository>().update(params.entity);
      return response!;
    } catch(e) {
      throw Exception(e);
    }
  }
}


class AccountUpdateUseCaseParams {

  Account? entity;

  AccountUpdateUseCaseParams({ 
    this.entity 
  });

}