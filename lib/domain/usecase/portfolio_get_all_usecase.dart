import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/clean_architecture/usecase/wtw_usecase.dart';
import '../entity/portfolio/portfolio.dart';
import '../repository/portfolio/portfolio_repository.dart';

class PortfolioGetAllUseCase extends WTWUseCase<List<Portfolio>> {

  @override
  Future<List<Portfolio>> call() async {
    try {
      List<Portfolio>? response = await Get.find<PortfolioRepository>().getAll();
      return response!;
    } catch(e) {
      throw Exception(e);
    }
  }

}