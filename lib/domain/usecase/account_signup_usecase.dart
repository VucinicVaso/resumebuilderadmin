import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/clean_architecture/usecase/wtw_usecase_with_params.dart';
import '../repository/account/account_repository.dart';

class AccountSignUpUseCase extends WTWUseCaseWithParams<bool, AccountSignUpUseCaseParams> {

  @override
  Future<bool> call(AccountSignUpUseCaseParams? params) async {
    try {
      bool? response = await Get.find<AccountRepository>().signUp(username: params!.username, password: params.password);
      return response!;
    } catch(e) {
      throw Exception(e);
    }
  }

}

class AccountSignUpUseCaseParams {

  String? username;
  String? password;

  AccountSignUpUseCaseParams({
    this.username,
    this.password,
  });

}