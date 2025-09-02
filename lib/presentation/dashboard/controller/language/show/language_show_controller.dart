import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/clean_architecture/controller/wtw_controller.dart';
import 'package:wtoolboxweb/logger/wtw_logger.dart';
import '../../../../../domain/entity/language/language.dart';
import '../../../../../domain/usecase/language/language_get_by_key_usecase.dart';
import '../../../../../domain/usecase/language/language_get_all_usecase.dart';

class LanguageShowController extends WTWController<LanguageShowController> {

  LanguageShowController() {
    init();
    initState();
  }

  @override
  Future<void> initState() async {
    params!.containsKey('key') ? await setEntity() : await setList();
  }

  @override
  Future<void> clearState() async {
    entity.value = Language().empty();
    list.clear();
  }

  @override
  Future<void> listener(Map<String, dynamic>? message) async {}

  var entity = Language().empty().obs;
  Future<void> setEntity() async {
    try {
      entity.value = await LanguageGetByKeyUseCase().call(LanguageGetByKeyUseCaseParams(key: int.parse(params!['key'])));
    } catch (e) {
      WTWLogger.write('LanguageShowController.setEntity() faild: $e');
    }
  }

  var list = List<Language>.empty(growable: true).obs;
  Future<void> setList() async {
    try { 
      list.value = await LanguageGetAllUseCase().call();
    } catch (e) {
      WTWLogger.write('LanguageShowController.setList() faild: $e');
    }
  }

}