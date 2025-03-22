// map_page.dart
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../viewmodels/map_viewmodel.dart';
import 'commonscaffold.dart';
import 'home_page.dart'; // Importa el layout base

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    int currentIndex = 3; // índice correspondiente a la pestaña "Mapa"
    return ChangeNotifierProvider(
      create: (_) => MapViewModel(),
      child: Consumer<MapViewModel>(
        builder: (context, viewModel, child) {
          return CommonScaffold(
            currentIndex: currentIndex,
            onItemTapped: (int index) {
              // Define la navegación según el índice
              if (index != currentIndex) {
                switch (index) {
                  case 0:
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const HomePage()));
                    break;
                  case 3:
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const MapPage()));
                    break;
                // Agrega los casos para las demás vistas
                  default:
                    break;
                }
              }
            },
            title: 'Mapa',
            body: Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: viewModel.bogotaLocation,
                    zoom: 12,
                  ),
                  onMapCreated: viewModel.onMapCreated,
                  markers: viewModel.markers,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                ),
                if (!viewModel.isMapReady)
                  const Center(child: CircularProgressIndicator()),
              ],
            ),
          );
        },
      ),
    );
  }
}
