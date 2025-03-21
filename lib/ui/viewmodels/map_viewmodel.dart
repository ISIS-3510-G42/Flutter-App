import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapViewModel extends ChangeNotifier {
  late GoogleMapController _mapController;

  final LatLng bogotaLocation = const LatLng(4.7110, -74.0721);

  void onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    notifyListeners();
  }

  GoogleMapController get mapController => _mapController;
}
