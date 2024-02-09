import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice_ex/places.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  Set<Marker> markers = {};

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Future<void> _searchNearbyPharmacies(LatLng userLocation) async {
    final places = GoogleMapsPlaces(
        apiKey:
            'AIzaSyCgPKQLMejBmamI9uHHDPJkylVynz28zXY'); // استبدل بمفتاح API الخاص بك
    final response = await places.searchNearbyWithRadius(
      Location(
        lat: userLocation.latitude,
        lng: userLocation.longitude,
      ),
      5000, // مسافة البحث بالأمتار (هنا 5000 متر أو 5 كيلومتر)
      type: 'pharmacy', // نوع الأماكن المراد البحث عنها (هنا صيدلية)
    );

    setState(() {
      markers = response.results.map((result) {
        return Marker(
          markerId: MarkerId(result.placeId),
          position: LatLng(
            result.geometry!.location.lat,
            result.geometry!.location.lng,
          ),
          infoWindow: InfoWindow(
            title: result.name,
            snippet: result.vicinity,
          ),
        );
      }).toSet();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(37.43296265331129, -122.08832357078792),
          zoom: 10,
        ),
        markers: markers,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // الحصول على موقع المستخدم الحالي وتنفيذ البحث عن الصيدليات
          LatLng userLocation = LatLng(37.43296265331129,
              -122.08832357078792); // استبدل بموقع المستخدم الفعلي
          _searchNearbyPharmacies(userLocation);
        },
        child: Icon(
          Icons.search,
        ),
      ),
    );
  }
}
