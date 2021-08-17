import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'src/locations.dart' as locations;
//

void main() {
  runApp(MyApp());
}
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title:"maps",
//       home: SimpleMap()
//     );
//   }
// }
//
//
// class SimpleMap extends StatefulWidget {
//   const SimpleMap({Key? key}) : super(key: key);
//
//   @override
//   _SimpleMapState createState() => _SimpleMapState();
// }
//
// class _SimpleMapState extends State<SimpleMap> {
//   static final LatLng _kMapCenter =
//       LatLng(19.018255973653343, 72.84793849278007);
//
//   static final CameraPosition _kInitialPosition =
//       CameraPosition(target: _kMapCenter, zoom: 11.0, tilt: 0, bearing: 0);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Google Maps Demo'),
//       ),
//       body: GoogleMap(
//         initialCameraPosition: _kInitialPosition,
//       ),
//     );
//   }
// }

// }
//
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Map<String, Marker> _markers = {};
  Future<void> _onMapCreated(GoogleMapController controller) async {
    final googleOffices = await locations.getGoogleOffices();
    setState(() {
      _markers.clear();
      for (final office in googleOffices.offices) {
        final marker = Marker(
          markerId: MarkerId(office.name),
          position: LatLng(office.lat, office.lng),
          infoWindow: InfoWindow(
            title: office.name,
            snippet: office.address,
          ),
        );
        _markers[office.name] = marker;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Google Office Locations'),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: const LatLng(0, 0),
            zoom: 2,
          ),
          markers: _markers.values.toSet(),
        ),
      ),
    );
  }
}
