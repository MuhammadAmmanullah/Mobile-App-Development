class ApiService {
  static const String baseUrl = "https://dummyjson.com";

  static Future<void> uploadActivity(Map data) async {
    await Future.delayed(Duration(milliseconds: 500));
    print("Activity uploaded: $data");
  }

  static Future<List<dynamic>> fetchActivities() async {
    await Future.delayed(Duration(milliseconds: 500));
    return [
      {"id": 1, "title": "Sample Activity"},
    ];
  }
}
