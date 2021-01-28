import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:radovis_tour/provider/firebase_provider.dart';

class RadovisMaps extends StatefulWidget {
  static const routeName = '/maps';
  @override
  _RadovisMapsState createState() => _RadovisMapsState();
}

class _RadovisMapsState extends State<RadovisMaps> {
  Completer<GoogleMapController> _completer = Completer();

  static final CameraPosition _radovisPosition = CameraPosition(
    target: LatLng(41.637409, 22.466967),
    zoom: 10.4746,
  );

  @override
  Widget build(BuildContext context) {
    final markers = Provider.of<FirebaseProvider>(context).mark;
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: Provider.of<FirebaseProvider>(context, listen: false)
              .getMarkers(),
          builder: (ctx, snapShot) => GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _radovisPosition,
            onMapCreated: (GoogleMapController controller) {
              _completer.complete(controller);
            },
            markers: markers,
          ),
        ),
      ),
    );
  }
}
