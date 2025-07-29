import 'package:resumebuilderadmin/wtoolbox/external/lib_getx.dart';
import 'package:resumebuilderadmin/domain/repository/account/account_repository.dart';
import 'package:resumebuilderadmin/wtoolbox/clean_architecture/usecase/wt_usecase.dart';

class AccountSignOutUseCase extends WTUseCase<bool> {

  @override
  Future<bool> call() async {
    bool? response = await Get.find<AccountRepository>().signOut();
    return response!;
  }

}