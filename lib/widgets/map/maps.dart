import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:radovis_tour/widgets/map/markers.dart';

class RadovisMaps extends StatefulWidget {
  static const routeName = '/maps';
  @override
  _RadovisMapsState createState() => _RadovisMapsState();
}

class _RadovisMapsState extends State<RadovisMaps> {
  Completer<GoogleMapController> _completer = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(41.637409, 22.466967),
    zoom: 10.4746,
  );

  // static final CameraPosition _kLake = CameraPosition(
  //     bearing: 0,
  //     target: LatLng(41.635035, 22.473490),
  //     tilt: 0,
  //     zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _completer.complete(controller);
          },
          markers: TheMarkers.markers,
        ),
        // floatingActionButton: FloatingActionButton.extended(
        //   onPressed: _goToTheLake,
        //   label: Text('To the lake!'),
        //   icon: Icon(Icons.directions_boat),
        // ),
      ),
    );
  }

  // Future<void> _goToTheLake() async {
  //   final GoogleMapController controller = await _completer.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  // }
}
