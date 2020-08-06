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
  static final LatLng downtown = LatLng(41.634305, 22.464697);
  static final LatLng tiamo = LatLng(41.638344, 22.461211);
  static final LatLng escape = LatLng(41.639108, 22.460195);
  static final LatLng element = LatLng(41.634091, 22.464918);
  static final LatLng galactic = LatLng(41.633986, 22.465525);
  static final LatLng tiamogarden = LatLng(41.638210, 22.461315);
  static final LatLng joker = LatLng(41.640972, 22.460421);
  static final LatLng diamondgarden = LatLng(41.632913, 22.455895);
  static final LatLng ambasador = LatLng(41.635539, 22.459730);
  static final LatLng dclub = LatLng(41.633953, 22.469849);

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
    Marker(
      markerId: MarkerId(
        downtown.toString(),
      ),
      position: downtown,
      infoWindow: InfoWindow(title: 'Downtown coffee bar'),
    ),
    Marker(
      markerId: MarkerId(
        tiamo.toString(),
      ),
      position: tiamo,
      infoWindow: InfoWindow(title: 'Ti-amo coffee bar'),
    ),
    Marker(
      markerId: MarkerId(
        escape.toString(),
      ),
      position: escape,
      infoWindow: InfoWindow(title: 'Escape coffee bar'),
    ),
    Marker(
      markerId: MarkerId(
        element.toString(),
      ),
      position: element,
      infoWindow: InfoWindow(title: 'Element coffee bar'),
    ),
    Marker(
      markerId: MarkerId(
        galactic.toString(),
      ),
      position: galactic,
      infoWindow: InfoWindow(title: 'Galactic coffee bar'),
    ),
    Marker(
      markerId: MarkerId(
        tiamogarden.toString(),
      ),
      position: tiamogarden,
      infoWindow: InfoWindow(title: 'Ti-amo Garden'),
    ),
    Marker(
      markerId: MarkerId(
        joker.toString(),
      ),
      position: joker,
      infoWindow: InfoWindow(title: 'Joker Pizzeria'),
    ),
    Marker(
      markerId: MarkerId(
        diamondgarden.toString(),
      ),
      position: diamondgarden,
      infoWindow: InfoWindow(title: 'Diamond Garden'),
    ),
    Marker(
      markerId: MarkerId(
        ambasador.toString(),
      ),
      position: ambasador,
      infoWindow: InfoWindow(title: 'Ambasador Restaurant'),
    ),
    Marker(
      markerId: MarkerId(
        dclub.toString(),
      ),
      position: dclub,
      infoWindow: InfoWindow(title: 'D Club Restaurant'),
    ),
  };
}
