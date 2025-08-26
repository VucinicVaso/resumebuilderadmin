import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/clean_architecture/usecase/wtw_usecase.dart';
import '../entity/skill/skill.dart';
import '../repository/skill/skill_repository.dart';

class SkillGetAllUseCase extends WTWUseCase<List<Skill>> {

  @override
  Future<List<Skill>> call() async {
    try {
      List<Skill>? response = await Get.find<SkillRepository>().getAll();
      return response!;
    } catch(e) {
      throw Exception(e);
    }
  }

}