import 'package:geolocator/geolocator.dart';

class LocationService {
  static Future<String> getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    return "${position.latitude}, ${position.longitude}";
  }
}
