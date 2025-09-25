import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/base/usecase/wtw_usecase_with_params.dart';
import '../../entity/cv/cv.dart';
import '../../repository/cv/cv_repository.dart';

class CVGetByKeyUseCase extends WTWUseCaseWithParams<CV, CVGetByKeyUseCaseParams> {

  @override
  Future<CV> call(CVGetByKeyUseCaseParams? params) async {
    try {
      CV? response = await Get.find<CVRepository>().getByKey(params!.key!);
      return response!;
    } catch(e) {
      throw Exception(e);
    }
  }

}

class CVGetByKeyUseCaseParams {

  int? key;

  CVGetByKeyUseCaseParams({
    this.key,
  });

}