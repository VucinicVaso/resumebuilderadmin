import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/clean_architecture/controller/wtw_controller.dart';
import 'package:wtoolboxweb/logger/wtw_logger.dart';
import '../../../../../domain/entity/experience/experience.dart';
import '../../../../../domain/usecase/experience/experience_get_by_key_usecase.dart';
import '../../../../../domain/usecase/experience/experience_get_all_usecase.dart';

class ExperienceShowController extends WTWController<ExperienceShowController> {

  ExperienceShowController() {
    init();
    initState();
  }

  @override
  Future<void> initState() async {
    params!.containsKey('key') ? await setEntity() : await setList();
  }

  @override
  Future<void> clearState() async {
    entity.value = Experience().empty();
    list.clear();
  }

  @override
  Future<void> listener(Map<String, dynamic>? message) async {}

  var entity = Experience().empty().obs;
  Future<void> setEntity() async {
    try {
      entity.value = await ExperienceGetByKeyUseCase().call(ExperienceGetByKeyUseCaseParams(key: int.parse(params!['key'])));
    } catch (e) {
      WTWLogger.write('ExperienceShowController.setEntity() faild: $e');
    }
  }

  var list = List<Experience>.empty(growable: true).obs;
  Future<void> setList() async {
    try { 
      list.value = await ExperienceGetAllUseCase().call();
    } catch (e) {
      WTWLogger.write('ExperienceShowController.setList() faild: $e');
    }
  }

}