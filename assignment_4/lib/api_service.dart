import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://dummyjson.com";

  static Future<http.Response> uploadActivity(Map data) {
    return http.post(Uri.parse("$baseUrl/posts"), body: data);
  }

  static Future<http.Response> fetchActivities() {
    return http.get(Uri.parse("$baseUrl/posts"));
  }
}
