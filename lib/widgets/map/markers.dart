import 'package:google_maps_flutter/google_maps_flutter.dart';

class TheMarkers {
  static final LatLng radovisCross = LatLng(41.636561, 22.459556);
  static final LatLng holyTrinity = LatLng(41.635079, 22.467716);
  static final LatLng square = LatLng(41.638768, 22.460717);
  static final LatLng turbe = LatLng(41.641165, 22.460682);
  static final LatLng raklish = LatLng(41.630225, 22.482212);
  static final LatLng gabrevci = LatLng(41.564689, 22.378873);
  static final LatLng oraovica = LatLng(41.625361, 22.511806);
  static final LatLng smilanci = LatLng(41.696305, 22.604735);
  static final LatLng dedino = LatLng(41.570588, 22.425808);
  static final LatLng injevo = LatLng(41.613896, 22.427825);
  static final LatLng stgorgi = LatLng(41.645636, 22.509325);

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
        Marker(
      markerId: MarkerId(
        gabrevci.toString(),
      ),
      position: gabrevci,
      infoWindow: InfoWindow(title: 'Gabrevci'),
    ),
        Marker(
      markerId: MarkerId(
        oraovica.toString(),
      ),
      position: oraovica,
      infoWindow: InfoWindow(title: 'Oraovica'),
    ),
        Marker(
      markerId: MarkerId(
        smilanci.toString(),
      ),
      position: smilanci,
      infoWindow: InfoWindow(title: 'Smilanci'),
    ),
        Marker(
      markerId: MarkerId(
        dedino.toString(),
      ),
      position: dedino,
      infoWindow: InfoWindow(title: 'Dedino'),
    ),
        Marker(
      markerId: MarkerId(
        injevo.toString(),
      ),
      position: injevo,
      infoWindow: InfoWindow(title: 'Injevo'),
    ),
        Marker(
      markerId: MarkerId(
        stgorgi.toString(),
      ),
      position: stgorgi,
      infoWindow: InfoWindow(title: 'Monastery st. Gorgi'),
    ),
  };
}
