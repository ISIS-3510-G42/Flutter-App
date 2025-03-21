import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../viewmodels/map_viewmodel.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MapViewModel(),
      child: Consumer<MapViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(title: const Text("Map View")),
            body: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: viewModel.bogotaLocation,
                zoom: 12,
              ),
              onMapCreated: viewModel.onMapCreated,
              markers: {
                Marker(
                  markerId: const MarkerId("Bogota"),
                  position: viewModel.bogotaLocation,
                  infoWindow: const InfoWindow(title: "Bogotá, Colombia"),
                ),
              },
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(icon: Icon(Icons.map), label: "Map"),
              ],
              onTap: (index) {
                // Add navigation logic here
              },
            ),
          );
        },
      ),
    );
  }
}
