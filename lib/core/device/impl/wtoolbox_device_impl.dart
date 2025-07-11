import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:resumebuilderadmin/core/external/lib_uuid.dart';
import 'package:resumebuilderadmin/core/external/lib_device_info_plus.dart';
import 'package:resumebuilderadmin/core/logger/wtoolbox_logger.dart';
import '../wtoolbox_device.dart';

class WTDeviceImpl extends WTDevice {

  @override
  Future<void> getDeviceData() async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    try {
      if(kIsWeb) {
        var info = await deviceInfo.webBrowserInfo;
        Map<dynamic, dynamic> infoMap = webBrowserData(info);
        setDevice({ 'id': uuid.v4(), 'platform': 'WEB', 'data': infoMap });
      }
      if(!kIsWeb) {
        setDevice({ 'id': '', 'platform': '', 'data': {} });
      }
    } on PlatformException {
      WTLogger.write('WTDevice.getDeviceData() error: Failed to get platform version.');
    }
  }

  @override
  Map<String, dynamic> webBrowserData(WebBrowserInfo data) {
    return <String, dynamic>{
      'browserName':         data.browserName.name,
      'appCodeName':         data.appCodeName,
      'appName':             data.appName,
      'appVersion':          data.appVersion,
      'deviceMemory':        data.deviceMemory,
      'language':            data.language,
      'languages':           data.languages,
      'platform':            data.platform,
      'product':             data.product,
      'productSub':          data.productSub,
      'userAgent':           data.userAgent,
      'vendor':              data.vendor,
      'vendorSub':           data.vendorSub,
      'hardwareConcurrency': data.hardwareConcurrency,
      'maxTouchPoints':      data.maxTouchPoints,
    };
  }

}