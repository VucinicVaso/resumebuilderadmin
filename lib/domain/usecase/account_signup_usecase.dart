import 'package:resumebuilderadmin/core/clean_architecture/usecase/wtoolbox_usecase_with_params.dart';

class AccountSignUpUseCase extends WTUseCaseWithParams<bool, AccountSignUpUseCaseParams> {

  @override
  Future<bool> call(AccountSignUpUseCaseParams? params) async {
    print('---------------------------');
    print('AccountSignUpUseCase');
    print('username: ${params!.username}');
    print('password: ${params.password}');
    print('---------------------------');

    return true;
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