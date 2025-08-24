import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/clean_architecture/usecase/wtw_usecase_with_params.dart';
import '../entity/education/education.dart';
import '../repository/education/education_repository.dart';

class EducationGetByKeyUseCase extends WTWUseCaseWithParams<Education, EducationGetByKeyUseCaseParams> {

  @override
  Future<Education> call(EducationGetByKeyUseCaseParams? params) async {
    try {
      Education? response = await Get.find<EducationRepository>().getByKey(params!.key!);
      return response!;
    }catch(e) {
      throw Exception(e);
    }
  }

}

class EducationGetByKeyUseCaseParams {

  int? key;

  EducationGetByKeyUseCaseParams({
    this.key,
  });

}