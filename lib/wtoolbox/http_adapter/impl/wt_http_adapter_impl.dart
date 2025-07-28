import 'dart:convert';
import 'package:resumebuilderadmin/wtoolbox/external/lib_http.dart' as http;
import 'package:resumebuilderadmin/wtoolbox/external/lib_email.dart';
import '../wt_http_adapter.dart';

class WTHttpAdapterImpl extends WTHttpAdapter {

  @override
  Future<dynamic> post(String? url, Map<String, String>? headers, Map<String, dynamic>? body) async {
    try {
      Uri uri = Uri.parse(url!);

      Map<String, String> headersMap = <String, String>{};
      headersMap['Content-Type']     = 'application/json; charset=UTF-8';
      headersMap['Charset']          = 'utf-8';
      if(headers!.isNotEmpty) { headersMap.addAll(headers); }

      String encodedBody = jsonEncode(body);

      final http.Response response = await http.post(uri, headers: headersMap, body: encodedBody);
      if(response.statusCode != 200) { throw('WTHttpAdapter.post() error: ${response.statusCode}'); }
      return jsonDecode(response.body);
    }on FormatException catch(e) {
      throw('WTHttpAdapter.post() FormatException: ${e.message}');
    }on Error catch(e) {
      throw('WTHttpAdapter.post() Error: ${e.toString()}');
    }
  }

  @override
  Future<dynamic> get(String? url, Map<String, String>? headers) async {
    try {
      Uri uri = Uri.parse(url!);
      
      Map<String, String> headersMap = <String, String>{};
      headersMap['Content-Type']     = 'application/json; charset=UTF-8';
      headersMap['Charset']          = 'utf-8';
      if(headers!.isNotEmpty) { headersMap.addAll(headers); }

      final http.Response response = await http.get(uri, headers: headers);
      if(response.statusCode != 200) { throw('WTHttpAdapter.post() error: ${response.statusCode}'); }
      return jsonDecode(response.body);
    }on FormatException catch(e) {
      throw('WTHttpAdapter.get() FormatException: ${e.message}');
    }on Error catch(e) {
      throw('WTHttpAdapter.get() Error: ${e.toString()}');
    }
  }

  @override
  Future<void> email({ String? subject, String? body, String? filePath }) async {
    if(filePath == null) {
      await Share.share(body!, subject: subject);
    }

    if(filePath != null) {
      XFile? xfile = XFile(filePath);
      List<XFile>? xFileList = List.empty(growable: true);
      xFileList.addAll([ xfile ]);

      await Share.shareXFiles(xFileList, subject: subject, text: body);
    }
  }

}
