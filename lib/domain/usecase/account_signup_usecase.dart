import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/clean_architecture/usecase/wtw_usecase_with_params.dart';
import 'package:resumebuilderadmin/domain/repository/account/account_repository.dart';

class AccountSignUpUseCase extends WTWUseCaseWithParams<bool, AccountSignUpUseCaseParams> {

  @override
  Future<bool> call(AccountSignUpUseCaseParams? params) async {
    print('---------------------------');
    print('AccountSignUpUseCase');
    print('username: ${params!.username}');
    print('password: ${params.password}');
    print('---------------------------');

    bool? response = await Get.find<AccountRepository>().signUp(username: params.username, password: params.password);
    return response!;
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