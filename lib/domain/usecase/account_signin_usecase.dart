import 'package:resumebuilderadmin/core/wtoolbox/external/lib_getx.dart';
import 'package:resumebuilderadmin/domain/repository/account/account_repository.dart';
import 'package:resumebuilderadmin/core/wtoolbox/clean_architecture/usecase/wt_usecase_with_params.dart';

class AccountSignInUseCase extends WTUseCaseWithParams<bool, AccountSignInUseCaseParams> {

  @override
  Future<bool> call(AccountSignInUseCaseParams? params) async {
    print('---------------------------');
    print('AccountSignInUseCase');
    print('username: ${params!.username}');
    print('password: ${params.password}');
    print('---------------------------');

    bool? response = await Get.find<AccountRepository>().singIn(username: params.username, password: params.password);
    return response!;
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