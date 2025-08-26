import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/clean_architecture/usecase/wtw_usecase_with_params.dart';
import '../entity/cv/cv.dart';
import '../repository/cv/cv_repository.dart';

class CVUpdateUseCase extends WTWUseCaseWithParams<bool, CVUpdateUseCaseParams> {

  @override
  Future<bool> call(CVUpdateUseCaseParams? params) async {
    try {
      bool? response = await Get.find<CVRepository>().update(params!.entity!);
      return response!;
    } catch(e) {
      throw Exception(e);
    }
  }

}

class CVUpdateUseCaseParams {

  CV? entity;

  CVUpdateUseCaseParams({
    this.entity,
  });

}