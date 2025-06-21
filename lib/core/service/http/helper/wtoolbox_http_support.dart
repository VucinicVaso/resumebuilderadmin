import 'dart:io';
import '../../../3rd_party/lib_getx.dart';
import '../../../helper/device/wtoolbox_device.dart';
import 'wtoolbox_http_overrides.dart';

class WTHttpSupport {

  WTHttpSupport._();

  static WTHttpSupport? _instance;

  static WTHttpSupport get instance {
    _instance ??= WTHttpSupport._();
    return _instance!;
  }

  Future<void> check() async {
    var device = Get.find<WTDevice>().getDevice();

    if(device!['platform'] == 'ANDROID') {
      if(device['data']['version.sdkInt'] < 29) {
        HttpOverrides.global = WTHttpOverrides();
      }
    }
  }

}