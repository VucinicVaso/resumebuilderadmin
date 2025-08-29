import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/clean_architecture/controller/wtw_controller.dart';
import 'package:wtoolboxweb/logger/wtw_logger.dart';
import '../../../../../domain/entity/portfolio/portfolio.dart';
import '../../../../../domain/usecase/portfolio_get_by_key_usecase.dart';
import '../../../../../domain/usecase/portfolio_get_all_usecase.dart';

class PortfolioShowController extends WTWController<PortfolioShowController> {

  PortfolioShowController() {
    init();
    initState();
  }

  @override
  Future<void> initState() async {
    params!.containsKey('key') ? await setEntity() : await setList();
  }

  @override
  Future<void> clearState() async {
    entity.value = Portfolio().empty();
    list.clear();
  }

  @override
  Future<void> listener(Map<String, dynamic>? message) async {}

  var entity = Portfolio().empty().obs;
  Future<void> setEntity() async {
    try {
      entity.value = await PortfolioGetByKeyUseCase().call(PortfolioGetByKeyUseCaseParams(key: int.parse(params!['key'])));
    } catch (e) {
      WTWLogger.write('PortfolioShowController.setEntity() faild: $e');
    }
  }

  var list = List<Portfolio>.empty(growable: true).obs;
  Future<void> setList() async {
    try { 
      list.value = await PortfolioGetAllUseCase().call();
    } catch (e) {
      WTWLogger.write('PortfolioShowController.setList() faild: $e');
    }
  }

}