import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPickerPage extends StatefulWidget {
  @override
  _MapPickerPageState createState() => _MapPickerPageState();
}

class _MapPickerPageState extends State<MapPickerPage> {
  LatLng? selectedLocation;
  late GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('เลือกตำแหน่งบนแผนที่')),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(13.736717, 100.523186), // เริ่มที่กรุงเทพฯ
              zoom: 14,
            ),
            onTap: (LatLng position) {
              setState(() {
                selectedLocation = position;
              });
            },
            markers: selectedLocation != null
                ? {
                    Marker(
                      markerId: MarkerId("selected"),
                      position: selectedLocation!,
                    ),
                  }
                : {},
            onMapCreated: (controller) {
              mapController = controller;
            },
          ),
          if (selectedLocation != null)
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, selectedLocation);
                },
                child: Text("ยืนยันตำแหน่งนี้"),
              ),
            ),
        ],
      ),
    );
  }
}
