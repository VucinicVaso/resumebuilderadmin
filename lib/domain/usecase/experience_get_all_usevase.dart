import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/clean_architecture/usecase/wtw_usecase.dart';
import '../entity/experience/experience.dart';
import '../repository/experience/experience_repository.dart';

class ExperienceGetAllUseCase extends WTWUseCase<List<Experience>> {

  @override
  Future<List<Experience>> call() async {
    try {
      List<Experience>? response = await Get.find<ExperienceRepository>().getAll();
      return response!;
    } catch(e) {
      throw Exception(e);
    }
  }

}