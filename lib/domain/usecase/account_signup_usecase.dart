import 'package:resumebuilderadmin/wtoolbox/external/lib_getx.dart';
import 'package:resumebuilderadmin/domain/repository/account/account_repository.dart';
import 'package:resumebuilderadmin/wtoolbox/clean_architecture/usecase/wt_usecase_with_params.dart';

class AccountSignUpUseCase extends WTUseCaseWithParams<bool, AccountSignUpUseCaseParams> {

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