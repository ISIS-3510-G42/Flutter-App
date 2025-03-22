import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapViewModel extends ChangeNotifier {
  late GoogleMapController _mapController;
  bool isMapReady = false; // Flag to track if the map is ready

  final LatLng bogotaLocation = const LatLng(4.7110, -74.0721);

  // List of shops
  final List<Shop> shops = [
    Shop("E-Social", LatLng(4.653340400226082, -74.06102567572646)),
    Shop("Planeta Vintage", LatLng(4.623326334617368, -74.06886427667965)),
    Shop("El Segundazo", LatLng(4.674183693422512, -74.05288283864145)),
    Shop("El Baulito de Mr.Bean", LatLng(4.653041858350189, -74.06386070551471)),
    Shop("Closet Up", LatLng(4.654346890637457, -74.06057896133835)),
    Shop("El Cuchitril", LatLng(4.693857895240825, -74.03082026318502)),
    Shop("Herbario Vintage", LatLng(4.624205328397987, -74.07014419017378)),
  ];

  Set<Marker> get markers {
    return shops.map((shop) {
      return Marker(
        markerId: MarkerId(shop.name),
        position: shop.location,
        infoWindow: InfoWindow(title: shop.name),
      );
    }).toSet();
  }

  void onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    isMapReady = true; // Set the map as ready
    notifyListeners();
  }

  GoogleMapController get mapController {
    if (!isMapReady) {
      throw Exception('Map controller is not ready yet.');
    }
    return _mapController;
  }
}

class Shop {
  final String name;
  final LatLng location;

  Shop(this.name, this.location);
}
