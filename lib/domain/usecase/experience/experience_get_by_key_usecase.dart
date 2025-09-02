import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/clean_architecture/usecase/wtw_usecase_with_params.dart';
import '../../entity/experience/experience.dart';
import '../../repository/experience/experience_repository.dart';

class ExperienceGetByKeyUseCase extends WTWUseCaseWithParams<Experience, ExperienceGetByKeyUseCaseParams> {

  @override
  Future<Experience> call(ExperienceGetByKeyUseCaseParams? params) async {
    try {
      Experience? response = await Get.find<ExperienceRepository>().getByKey(params!.key!);
      return response!;
    } catch(e) {
      throw Exception(e);
    }
  }

}

class ExperienceGetByKeyUseCaseParams {

  int? key;

  ExperienceGetByKeyUseCaseParams({
    this.key,
  });

}