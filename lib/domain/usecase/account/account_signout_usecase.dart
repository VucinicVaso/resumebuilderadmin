import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/base/usecase/wtw_usecase.dart';
import '../../repository/account/account_repository.dart';

class AccountSignOutUseCase extends WTWUseCase<bool> {

  @override
  Future<bool> call() async {
    try {
      bool? response = await Get.find<AccountRepository>().signOut();
      return response!;
    } catch(e) {
      throw Exception(e);
    }
  }

}