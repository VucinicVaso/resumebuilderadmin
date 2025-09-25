import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/base/controller/wtw_controller.dart';
import 'package:wtoolboxweb/logger/wtw_logger.dart';
import '../../../../../domain/entity/education/education.dart';
import '../../../../../domain/usecase/education/education_get_by_key_usecase.dart';
import '../../../../../domain/usecase/education/education_get_all_usecase.dart';

class EducationShowController extends WTWController<EducationShowController> {

  EducationShowController() {
    init();
    initState();
  }

  @override
  Future<void> initState() async {
    params!.containsKey('key') ? await setEntity() : await setList();
  }

  @override
  Future<void> clearState() async {
    entity.value = Education().empty();
    list.clear();
  }

  @override
  Future<void> listener(Map<String, dynamic>? message) async {}

  var entity = Education().empty().obs;
  Future<void> setEntity() async {
    try {
      entity.value = await EducationGetByKeyUseCase().call(EducationGetByKeyUseCaseParams(key: int.parse(params!['key'])));
    } catch (e) {
      WTWLogger.write('EducationShowController.setEntity() faild: $e');
    }
  }

  var list = List<Education>.empty(growable: true).obs;
  Future<void> setList() async {
    try { 
      list.value = await EducationGetAllUseCase().call();
    } catch (e) {
      WTWLogger.write('EducationShowController.setList() faild: $e');
    }
  }

}