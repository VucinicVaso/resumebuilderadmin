import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/base/usecase/wtw_usecase_with_params.dart';
import '../../entity/cv/cv.dart';
import '../../repository/cv/cv_repository.dart';

class CVInsertUseCase extends WTWUseCaseWithParams<bool, CVInsertUseCaseParams> {

  @override
  Future<bool> call(CVInsertUseCaseParams? params) async {
    try {
      bool? response = await Get.find<CVRepository>().insert(params!.entity!);
      return response!;
    } catch(e) {
      throw Exception(e);
    }
  }

}

class CVInsertUseCaseParams {

  CV? entity;

  CVInsertUseCaseParams({
    this.entity,
  });

}