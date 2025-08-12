import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/clean_architecture/usecase/wtw_usecase.dart';
import '../repository/account/account_repository.dart';

class AccountSignOutUseCase extends WTWUseCase<bool> {

  @override
  Future<bool> call() async {
    bool? response = await Get.find<AccountRepository>().signOut();
    return response!;
  }

}