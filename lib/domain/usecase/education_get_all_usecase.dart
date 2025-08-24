import 'package:wtoolboxweb/external/lib_getx.dart';
import 'package:wtoolboxweb/clean_architecture/usecase/wtw_usecase.dart';
import '../entity/education/education.dart';
import '../repository/education/education_repository.dart';

class AccountEducationUseCase extends WTWUseCase<List<Education>> {

  @override
  Future<List<Education>> call() async {
    try {
      List<Education>? response = await Get.find<EducationRepository>().getAll();
      return response!;
    }catch(e) {
      throw Exception(e);
    }
  }

}