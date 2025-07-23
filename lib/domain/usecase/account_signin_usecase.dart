import 'package:resumebuilderadmin/core/clean_architecture/usecase/wtoolbox_usecase_with_params.dart';

class AccountSignInUseCase extends WTUseCaseWithParams<bool, AccountSignInUseCaseParams> {

  @override
  Future<bool> call(AccountSignInUseCaseParams? params) async {
    print('---------------------------');
    print('AccountSignInUseCase');
    print('username: ${params!.username}');
    print('password: ${params.password}');
    print('---------------------------');

    return true;
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