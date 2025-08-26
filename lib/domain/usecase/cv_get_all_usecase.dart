import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/clean_architecture/usecase/wtw_usecase.dart';
import '../entity/cv/cv.dart';
import '../repository/cv/cv_repository.dart';

class CVGetAllUseCase extends WTWUseCase<List<CV>> {

  @override
  Future<List<CV>> call() async {
    try {
      List<CV>? response = await Get.find<CVRepository>().getAll();
      return response!;
    } catch(e) {
      throw Exception(e);
    }
  }

}