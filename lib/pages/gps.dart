import 'package:flutter/material.dart';

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
      ),
      body: Center(
        child: InteractiveViewer(
          boundaryMargin: EdgeInsets.all(20.0), // Margin around the map
          minScale: 0.5, // Minimum zoom scale
          maxScale: 4.0, // Maximum zoom scale
          constrained: false, // Allow the map to exceed the screen size
          child: Image.asset(
            "lib/images/map.png", // Replace with your map image
            fit: BoxFit.contain, // Ensure the image fills the screen
            height: screenSize.height, // Set the height to screen height
            width: screenSize.width, // Set the width to screen width
          ),
        ),
      ),
    );
  }
}
