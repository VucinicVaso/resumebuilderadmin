abstract class WTHttpAdapter {

  Future<dynamic> post(String? url, Map<String, String>? headers, Map<String, dynamic>? body);

  Future<dynamic> get(String? url, Map<String, String>? headers);

  Future<void> email({ String? subject, String? body, String? filePath });

}