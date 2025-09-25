import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/base/usecase/wtw_usecase_with_params.dart';
import '../../entity/experience/experience.dart';
import '../../repository/experience/experience_repository.dart';

class ExperienceInsertUseCase extends WTWUseCaseWithParams<bool, ExperienceInsertUseCaseParams> {

  @override
  Future<bool> call(ExperienceInsertUseCaseParams? params) async {
    try {
      bool? response = await Get.find<ExperienceRepository>().insert(params!.entity!);
      return response!;
    } catch(e) {
      throw Exception(e);
    }
  }

}

class ExperienceInsertUseCaseParams {

  Experience? entity;

  ExperienceInsertUseCaseParams({
    this.entity,
  });

}