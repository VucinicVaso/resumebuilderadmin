import 'package:resumebuilderadmin/core/external/lib_device_info_plus.dart';

abstract class WTDevice {

  Map<String, dynamic>? _device = <String, dynamic>{};
  void setDevice(Map<String, dynamic>? v) { _device = v; }
  Map<String, dynamic>? getDevice() { return _device; }

  Future<void> getDeviceData();
  Map<String, dynamic>? webBrowserData(WebBrowserInfo data);

}