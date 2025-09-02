import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/clean_architecture/usecase/wtw_usecase_with_params.dart';
import '../../entity/portfolio/portfolio.dart';
import '../../repository/portfolio/portfolio_repository.dart';

class PortfolioGetByKeyUseCase extends WTWUseCaseWithParams<Portfolio, PortfolioGetByKeyUseCaseParams> {

  @override
  Future<Portfolio> call(PortfolioGetByKeyUseCaseParams? params) async {
    try {
      Portfolio? response = await Get.find<PortfolioRepository>().getByKey(params!.key!);
      return response!;
    } catch(e) {
      throw Exception(e);
    }
  }

}

class PortfolioGetByKeyUseCaseParams {

  int? key;

  PortfolioGetByKeyUseCaseParams({
    this.key,
  });

}