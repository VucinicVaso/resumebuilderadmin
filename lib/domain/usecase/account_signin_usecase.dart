import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/clean_architecture/usecase/wtw_usecase_with_params.dart';
import 'package:resumebuilderadmin/domain/repository/account/account_repository.dart';

class AccountSignInUseCase extends WTWUseCaseWithParams<bool, AccountSignInUseCaseParams> {

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