import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/clean_architecture/usecase/wtw_usecase_with_params.dart';
import '../../entity/language/language.dart';
import '../../repository/language/language_repository.dart';

class LanguageInsertUseCase extends WTWUseCaseWithParams<bool, LanguageInsertUseCaseParams> {

  @override
  Future<bool> call(LanguageInsertUseCaseParams? params) async {
    try {
      bool? response = await Get.find<LanguageRepository>().insert(params!.entity!);
      return response!;
    } catch(e) {
      throw Exception(e);
    }
  }

}

class LanguageInsertUseCaseParams {

  Language? entity;

  LanguageInsertUseCaseParams({
    this.entity,
  });

}