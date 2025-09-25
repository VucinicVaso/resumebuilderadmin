import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/base/usecase/wtw_usecase_with_params.dart';
import '../../repository/account/account_repository.dart';

class AccountSignInUseCase extends WTWUseCaseWithParams<bool, AccountSignInUseCaseParams> {

  @override
  Future<bool> call(AccountSignInUseCaseParams? params) async {
    try {
      bool? response = await Get.find<AccountRepository>().singIn(username: params!.username, password: params.password);
      return response!;
    } catch(e) {
      throw Exception(e);
    }
  }

}

class AccountSignInUseCaseParams {

  String? username;
  String? password;

  AccountSignInUseCaseParams({
    this.username,
    this.password,
  });

}