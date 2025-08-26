import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/clean_architecture/usecase/wtw_usecase_with_params.dart';
import '../entity/skill/skill.dart';
import '../repository/skill/skill_repository.dart';

class SkillInsertUseCase extends WTWUseCaseWithParams<bool, SkillInsertUseCaseParams> {

  @override
  Future<bool> call(SkillInsertUseCaseParams? params) async {
    try {
      bool? response = await Get.find<SkillRepository>().insert(params!.entity!);
      return response!;
    } catch(e) {
      throw Exception(e);
    }
  }

}

class SkillInsertUseCaseParams {

  Skill? entity;

  SkillInsertUseCaseParams({
    this.entity,
  });

}