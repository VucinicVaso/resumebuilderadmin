import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/clean_architecture/usecase/wtw_usecase_with_params.dart';
import '../entity/language/language.dart';
import '../repository/language/language_repository.dart';

class LanguageUpdateUseCase extends WTWUseCaseWithParams<bool, LanguageUpdateUseCaseParams> {

  @override
  Future<bool> call(LanguageUpdateUseCaseParams? params) async {
    try {
      bool? response = await Get.find<LanguageRepository>().update(params!.entity!);
      return response!;
    } catch(e) {
      throw Exception(e);
    }
  }

}

class LanguageUpdateUseCaseParams {

  Language? entity;

  LanguageUpdateUseCaseParams({
    this.entity,
  });

}