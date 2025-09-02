import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/clean_architecture/usecase/wtw_usecase.dart';
import '../entity/language/language.dart';
import '../repository/language/language_repository.dart';

class LanguageGetAllUseCase extends WTWUseCase<List<Language>> {

  @override
  Future<List<Language>> call() async {
    try {
      List<Language>? response = await Get.find<LanguageRepository>().getAll();
      return response!;
    } catch(e) {
      throw Exception(e);
    }
  }

}