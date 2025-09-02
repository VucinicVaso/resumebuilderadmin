import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/clean_architecture/usecase/wtw_usecase_with_params.dart';
import '../../entity/skill/skill.dart';
import '../../repository/skill/skill_repository.dart';

class SkillUpdateUseCase extends WTWUseCaseWithParams<bool, SkillUpdateUseCaseParams> {

  @override
  Future<bool> call(SkillUpdateUseCaseParams? params) async {
    try {
      bool? response = await Get.find<SkillRepository>().update(params!.entity!);
      return response!;
    } catch(e) {
      throw Exception(e);
    }
  }

}

class SkillUpdateUseCaseParams {

  Skill? entity;

  SkillUpdateUseCaseParams({
    this.entity,
  });

}