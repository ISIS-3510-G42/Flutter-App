import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../viewmodels/map_viewmodel.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
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
              markers: viewModel.markers,
            ),
          );
        },
      ),
    );
  }
}
