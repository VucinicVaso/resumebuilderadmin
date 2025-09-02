import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:resumebuilderadmin/domain/repository/account/account_repository.dart';
import 'package:wtoolboxweb/clean_architecture/usecase/wtw_usecase_with_params.dart';
import '../../entity/account/account.dart';

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