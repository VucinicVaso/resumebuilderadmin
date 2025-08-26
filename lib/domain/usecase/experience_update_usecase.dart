import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/clean_architecture/usecase/wtw_usecase_with_params.dart';
import '../entity/experience/experience.dart';
import '../repository/experience/experience_repository.dart';

class ExperienceUpdateUseCase extends WTWUseCaseWithParams<bool, ExperienceUpdateUseCaseParams> {

  @override
  Future<bool> call(ExperienceUpdateUseCaseParams? params) async {
    try {
      bool? response = await Get.find<ExperienceRepository>().update(params!.entity!);
      return response!;
    } catch(e) {
      throw Exception(e);
    }
  }

}

class ExperienceUpdateUseCaseParams {

  Experience? entity;

  ExperienceUpdateUseCaseParams({
    this.entity,
  });

}