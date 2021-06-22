import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:makom_delivery_app/services/provider/locationprovider.dart';
import 'package:provider/provider.dart';

class Googlemaps extends StatefulWidget {
  @override
  _GooglemapsState createState() => _GooglemapsState();
}

class _GooglemapsState extends State<Googlemaps> {
  LatLng currentLocation;
  // ignore: unused_field
  GoogleMapController _mapController;
   double _originLatitude = 28.4861737, _originLongitude = 77.335173;
  double _destLatitude = 28.5395568, _destLongitude = 77.299191;
  Map<MarkerId, Marker> markers = {};
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  String googleAPiKey = "AIzaSyBFHjW6pgL0s8vUlIWxMbb1RXRzdgei65g";

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<LocationProvider>(builder: (context, loc, child) {
          if (loc.isLoading || loc.latitude == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            var currentLocation = LatLng(loc.latitude, loc.longitude);
            return Stack(
              children: [
                GoogleMap(
                  initialCameraPosition:
                      CameraPosition(target: currentLocation, zoom: 11),
                  zoomControlsEnabled: false,
                  minMaxZoomPreference: MinMaxZoomPreference(1.5, 20.8),
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  mapType: MapType.normal,
                  mapToolbarEnabled: true,
                  onCameraMove: (CameraPosition position) {
                    loc.onCameraMove(position);
                  },
                  onMapCreated: onCreated,
                  onCameraIdle: () {
                    loc.getMoveCamera();
                  },
                  markers: Set<Marker>.of(markers.values),
                  polylines: Set<Polyline>.of(polylines.values),
                ),
              ],
            );
          }
        }),
      ),
    );
  }
@override
  void initState() {
    super.initState();

    /// origin marker
    _addMarker(LatLng(_originLatitude, _originLongitude), "origin",
        BitmapDescriptor.defaultMarker);

    /// destination marker
    _addMarker(LatLng(_destLatitude, _destLongitude), "destination",
        BitmapDescriptor.defaultMarkerWithHue(90));
    _getPolyline();
  }
  void onCreated(GoogleMapController controller) {
      setState(() {
        _mapController = controller;
      });
    }
    _addMarker(LatLng position, String id, BitmapDescriptor descriptor) {
    MarkerId markerId = MarkerId(id);
    Marker marker =
        Marker(markerId: markerId, icon: descriptor, position: position);
    markers[markerId] = marker;
  }

  _addPolyLine() {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id, color: Colors.green, width:8,points: polylineCoordinates);
    polylines[id] = polyline;
    setState(() {});
  }

 void _getPolyline() async {
    List<LatLng> polylineCoordinates = [];
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        googleAPiKey,
        PointLatLng(_originLatitude, _originLongitude),
        PointLatLng(_destLatitude, _destLongitude),
        travelMode: TravelMode.driving,
        wayPoints: [PolylineWayPoint(location: "hello")]);
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    _addPolyLine();
  }
}
