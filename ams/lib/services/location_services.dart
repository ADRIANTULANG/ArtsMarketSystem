import 'package:get/get.dart';

import 'package:location/location.dart' as loc;

class LocationServices extends GetxController {
  @override
  void onInit() async {
    await getLocation();
    super.onInit();
  }

  double user_latitude = 0.0;
  double user_longitude = 0.0;

  getLocation() async {
    loc.Location location = new loc.Location();

    bool _serviceEnabled;
    loc.PermissionStatus _permissionGranted;
    loc.LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == loc.PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != loc.PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    user_latitude = _locationData.latitude!;
    user_longitude = _locationData.longitude!;
    print(user_latitude);
    print(user_longitude);
  }
}
