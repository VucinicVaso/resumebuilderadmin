import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/clean_architecture/usecase/wtw_usecase_with_params.dart';
import '../entity/education/education.dart';
import '../repository/education/education_repository.dart';

class EducationUpdateUseCase extends WTWUseCaseWithParams<bool, EducationUpdateUseCaseParams> {

  @override
  Future<bool> call(EducationUpdateUseCaseParams? params) async {
    try {
      bool? response = await Get.find<EducationRepository>().update(params!.entity!);
      return response!;
    }catch(e) {
      throw Exception(e);
    }
  }

}

class EducationUpdateUseCaseParams {

  Education? entity;

  EducationUpdateUseCaseParams({
    this.entity,
  });

}