import 'package:google_maps_flutter/google_maps_flutter.dart';

class TheMarkers {
  static final LatLng radovisCross = LatLng(41.636561, 22.459556);
  static final LatLng holyTrinity = LatLng(41.635079, 22.467716);
  static final LatLng square = LatLng(41.638768, 22.460717);
  static final LatLng turbe = LatLng(41.641165, 22.460682);
  static final LatLng raklish = LatLng(41.630225, 22.482212);

  static Set<Marker> markers = {
    Marker(
      markerId: MarkerId(
        radovisCross.toString(),
      ),
      position: radovisCross,
      infoWindow: InfoWindow(
        title: 'Radovis Cross',
        // snippet: '5 Star Rating',
      ),
    ),
    Marker(
      markerId: MarkerId(
        holyTrinity.toString(),
      ),
      position: holyTrinity,
      infoWindow: InfoWindow(
        title: 'St. Holy Trinity Church',
        // snippet: '5 Star Rating',
      ),
    ),
    Marker(
      markerId: MarkerId(
        square.toString(),
      ),
      position: square,
      infoWindow: InfoWindow(
        title: 'Radovish Square St.Spaso',
        // snippet: '5 Star Rating',
      ),
    ),
    Marker(
      markerId: MarkerId(
        turbe.toString(),
      ),
      position: turbe,
      infoWindow: InfoWindow(title: 'Turbe'),
    ),
    Marker(
      markerId: MarkerId(
        raklish.toString(),
      ),
      position: raklish,
      infoWindow: InfoWindow(title: 'Hot Spring Raklish'),
    ),
  };
}
