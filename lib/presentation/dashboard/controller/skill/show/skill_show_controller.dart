import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/clean_architecture/controller/wtw_controller.dart';
import 'package:wtoolboxweb/logger/wtw_logger.dart';
import '../../../../../domain/entity/skill/skill.dart';
import '../../../../../domain/usecase/skill_get_by_key_usecase.dart';
import '../../../../../domain/usecase/skill_get_all_usecase.dart';

class SkillShowController extends WTWController<SkillShowController> {

  SkillShowController() {
    init();
    initState();
  }

  @override
  Future<void> initState() async {
    params!.containsKey('key') ? await setEntity() : await setList();
  }

  @override
  Future<void> clearState() async {
    entity.value = Skill().empty();
    list.clear();
  }

  @override
  Future<void> listener(Map<String, dynamic>? message) async {}

  var entity = Skill().empty().obs;
  Future<void> setEntity() async {
    try {
      entity.value = await SkillGetByKeyUseCase().call(SkillGetByKeyUseCaseParams(key: int.parse(params!['key'])));
    } catch (e) {
      WTWLogger.write('SkillShowController.setEntity() faild: $e');
    }
  }

  var list = List<Skill>.empty(growable: true).obs;
  Future<void> setList() async {
    try { 
      list.value = await SkillGetAllUseCase().call();
    } catch (e) {
      WTWLogger.write('SkillShowController.setList() faild: $e');
    }
  }

}