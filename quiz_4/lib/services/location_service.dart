class LocationService {
  static Future<String> getLocation() async {
    await Future.delayed(Duration(milliseconds: 500));
    return "40.7128, -74.0060"; // Sample location
  }
}
