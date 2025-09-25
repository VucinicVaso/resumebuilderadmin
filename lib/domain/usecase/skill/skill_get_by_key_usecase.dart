import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/base/usecase/wtw_usecase_with_params.dart';
import '../../entity/skill/skill.dart';
import '../../repository/skill/skill_repository.dart';

class SkillGetByKeyUseCase extends WTWUseCaseWithParams<Skill, SkillGetByKeyUseCaseParams> {

  @override
  Future<Skill> call(SkillGetByKeyUseCaseParams? params) async {
    try {
      Skill? response = await Get.find<SkillRepository>().getByKey(params!.key!);
      return response!;
    } catch(e) {
      throw Exception(e);
    }
  }

}

class SkillGetByKeyUseCaseParams {

  int? key;

  SkillGetByKeyUseCaseParams({
    this.key,
  });

}