import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapMain extends StatefulWidget {
  const MapMain({Key? key}) : super(key: key);

  @override
  _MapMainState createState() => _MapMainState();
}

class _MapMainState extends State<MapMain> {
  late GoogleMapController mapController;
  //임의로 창조관 설정, 후에 사용자 위치로 변경
  final LatLng _center = const LatLng(37.282470, 127.900079);
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Maps Sample App'),
              backgroundColor: const Color.fromARGB(255, 0, 68, 2),
            ),
            body: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition:
                  CameraPosition(target: _center, zoom: 17.0),
            )));
  }
}
