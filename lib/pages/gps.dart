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
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Google Maps in Flutter'),
        ),
        body: CycleStationMapPage(),
      ),
    );
  }
}

class CycleStationMapPage extends StatelessWidget {
  final List<LatLng> cycleStationLocations = [
    LatLng(12.9716, 79.1582), // VIT Vellore
    LatLng(12.9711, 79.1594), // Stop 1
    LatLng(12.9719, 79.1572), // Stop 2
    // Add more cycle station locations as needed
  ];

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(12.9716, 79.1582), // Initial map position (VIT Vellore)
        zoom: 14, // Initial zoom level
      ),
      markers: cycleStationLocations.map((location) {
        return Marker(
          markerId: MarkerId(location.toString()),
          position: location,
          infoWindow: InfoWindow(title: 'Cycle Station'),
        );
      }).toSet(),
    );
  }
}

