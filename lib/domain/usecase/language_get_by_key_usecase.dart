import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/clean_architecture/usecase/wtw_usecase_with_params.dart';
import '../entity/language/language.dart';
import '../repository/language/language_repository.dart';

class LanguageGetByKeyUseCase extends WTWUseCaseWithParams<Language, LanguageGetByKeyUseCaseParams> {

  @override
  Future<Language> call(LanguageGetByKeyUseCaseParams? params) async {
    try {
      Language? response = await Get.find<LanguageRepository>().getByKey(params!.key!);
      return response!;
    } catch(e) {
      throw Exception(e);
    }
  }

}

class LanguageGetByKeyUseCaseParams {

  int? key;

  LanguageGetByKeyUseCaseParams({
    this.key,
  });

}