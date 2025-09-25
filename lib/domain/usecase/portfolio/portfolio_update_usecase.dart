import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/base/usecase/wtw_usecase_with_params.dart';
import '../../entity/portfolio/portfolio.dart';
import '../../repository/portfolio/portfolio_repository.dart';

class PortfolioUpdateUseCase extends WTWUseCaseWithParams<bool, PortfolioUpdateUseCaseParams> {

  @override
  Future<bool> call(PortfolioUpdateUseCaseParams? params) async {
    try {
      bool? response = await Get.find<PortfolioRepository>().update(params!.entity!);
      return response!;
    } catch(e) {
      throw Exception(e);
    }
  }

}

class PortfolioUpdateUseCaseParams {

  Portfolio? entity;

  PortfolioUpdateUseCaseParams({
    this.entity,
  });

}