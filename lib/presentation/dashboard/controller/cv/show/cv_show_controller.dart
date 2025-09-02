import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/clean_architecture/controller/wtw_controller.dart';
import 'package:wtoolboxweb/logger/wtw_logger.dart';
import '../../../../../domain/entity/cv/cv.dart';
import '../../../../../domain/usecase/cv/cv_get_by_key_usecase.dart';
import '../../../../../domain/usecase/cv/cv_get_all_usecase.dart';

class CVShowController extends WTWController<CVShowController> {

  CVShowController() {
    init();
    initState();
  }

  @override
  Future<void> initState() async {
    params!.containsKey('key') ? await setEntity() : await setList();
  }

  @override
  Future<void> clearState() async {
    entity.value = CV().empty();
    list.clear();
  }

  @override
  Future<void> listener(Map<String, dynamic>? message) async {}

  var entity = CV().empty().obs;
  Future<void> setEntity() async {
    try {
      entity.value = await CVGetByKeyUseCase().call(CVGetByKeyUseCaseParams(key: int.parse(params!['key'])));
    } catch (e) {
      WTWLogger.write('CVShowController.setEntity() faild: $e');
    }
  }

  var list = List<CV>.empty(growable: true).obs;
  Future<void> setList() async {
    try { 
      list.value = await CVGetAllUseCase().call();
    } catch (e) {
      WTWLogger.write('CVShowController.setList() faild: $e');
    }
  }

}