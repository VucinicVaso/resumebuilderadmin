import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/base/usecase/wtw_usecase_with_params.dart';
import '../../entity/portfolio/portfolio.dart';
import '../../repository/portfolio/portfolio_repository.dart';

class PortfolioInsertUseCase extends WTWUseCaseWithParams<bool, PortfolioInsertUseCaseParams> {

  @override
  Future<bool> call(PortfolioInsertUseCaseParams? params) async {
    try {
      bool? response = await Get.find<PortfolioRepository>().insert(params!.entity!);
      return response!;
    } catch(e) {
      throw Exception(e);
    }
  }

}

class PortfolioInsertUseCaseParams {

  Portfolio? entity;

  PortfolioInsertUseCaseParams({
    this.entity,
  });

}