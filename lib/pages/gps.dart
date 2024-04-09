import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CycleStationMapPage(),
    );
  }
}

class CycleStationMapPage extends StatelessWidget {
  final List<LatLng> cycleStationLocations = [
    LatLng(37.7749, -122.4194), // Cycle Station 1 (San Francisco)
    LatLng(37.7749, -122.3897), // Cycle Station 2 (San Francisco)
    LatLng(37.7599, -122.4148), // Cycle Station 3 (San Francisco)
    // Add more cycle station locations as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cycle Stations Map'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(37.7749, -122.4194), // Initial map position (San Francisco)
          zoom: 12, // Initial zoom level
        ),
        markers: cycleStationLocations.map((location) {
          return Marker(
            markerId: MarkerId(location.toString()),
            position: location,
            infoWindow: InfoWindow(title: 'Cycle Station'),
          );
        }).toSet(),
      ),
    );
  }
}
