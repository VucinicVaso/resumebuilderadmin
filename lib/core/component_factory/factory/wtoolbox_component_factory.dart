import 'wtoolbox_component_factory_config.dart';
import '../type/impl1/wtoolbox_component_type.dart';
import '../component/scaffold/wt_scaffold.dart';
import '../component/header/wt_header.dart';
import '../component/body/wt_body.dart';
import '../component/footer/wt_footer.dart';
import '../component/layout/wt_layout.dart';
import '../component/empty/wt_empty.dart';
import '../component/space/wt_space.dart';
import '../component/divider/wt_divider.dart';
import '../component/form_builder/form/wt_form.dart';
import '../component/form_builder/input_field/wt_form_input_filed.dart';

abstract class WTComponentFactory with WTComponentFactoryConfig {

  WTScaffold? createScaffold(WTScaffoldType type);

  WTHeader? createHeader(WTHeaderType type);

  WTBody? createBody(WTBodyType type);

  WTFooter? createFooter(WTFooterType type);

  WTLayout? createLayout(WTLayoutType type);

  WTEmpty? createEmpty(WTEmptyType type);

  WTDivider? createDivider(WTDividerType type);

  WTSpace? createSpace(WTSpaceType type);

  WTForm? createForm(WTFormType type);

  WTFormInputField? createFormInputFiled(WTFormInputFieldType type);

}