import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/clean_architecture/usecase/wtw_usecase_with_params.dart';
import '../entity/education/education.dart';
import '../repository/education/education_repository.dart';

class EducationInsertUseCase extends WTWUseCaseWithParams<bool, EducationInsertUseCaseParams> {

  @override
  Future<bool> call(EducationInsertUseCaseParams? params) async {
    bool? response = await Get.find<EducationRepository>().insert(params!.entity!);
    return response!;
  }

}

class EducationInsertUseCaseParams {

  Education? entity;

  EducationInsertUseCaseParams({
    this.entity,
  });

}