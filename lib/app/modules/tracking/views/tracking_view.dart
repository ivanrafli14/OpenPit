import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:image/image.dart' as IMG;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:open_pit/app/services/geolocation_service.dart';
import 'package:open_pit/app/services/location_service.dart';


import '../controllers/tracking_controller.dart';

class TrackingView extends StatefulWidget {
  const TrackingView({super.key});

  @override
  State<TrackingView> createState() => MapSampleState();
}

class MapSampleState extends State<TrackingView> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  Set<Marker> _markers = Set<Marker>();
  Set<Polygon> _polygon = Set<Polygon>();
  Set<Polyline> _polyline = Set<Polyline>();
  double latuser = -6.200000;
  double lnguser = 106.816666;
  int cnt_poly = 1;
  late BitmapDescriptor markerbitmap;
  //late BitmapDescriptor markerbitmapbus;

  GeolocationService _geolocationService = GeolocationService();

  late Position mypos;
  late LatLng poslatlang;

  late StreamController<Position> _positionStreamController;
  late Position _currentPosition;
  late var documents;

  StreamController<List<Map<String, dynamic>>> _documentsStreamController =
      StreamController<List<Map<String, dynamic>>>.broadcast();

  Stream<List<Map<String, dynamic>>> get documentsStream =>
      _documentsStreamController.stream;

  Stream<List<Map<String, dynamic>>> getDocumentsStream() {
    return FirebaseFirestore.instance
        .collection('drivers')
        .doc('6D9tr4J2scPN7pmieguV6ZucRFk2')
        .snapshots()
        .map((DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
      Map<String, dynamic> data = documentSnapshot.data() ?? {};
      return [data];
    });
  }

  Future<List<Map<String, dynamic>>> getDocuments() async {
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await FirebaseFirestore.instance
            .collection('drivers')
            .doc('6D9tr4J2scPN7pmieguV6ZucRFk2')
            .get();

    Map<String, dynamic> data = documentSnapshot.data() ?? {};
    return [data];
  }

  Uint8List? resizeImage(Uint8List data, width, height) {
    Uint8List? resizedData = data;
    IMG.Image? img = IMG.decodeImage(data);
    IMG.Image resized = IMG.copyResize(img!, width: width, height: height);
    resizedData = Uint8List.fromList(IMG.encodePng(resized));
    return resizedData;
  }

  Future<void> addMarkerLogo() async {
    try {
    markerbitmap = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      "images/map_icon.png",
    );

  } catch (error) {
    print('Error loading marker images: $error');
    // Handle the error or throw an exception if needed
  }
  }

  Future<void> _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    setState(() {
      _currentPosition = position;
    });
  }

  Future<void> initRoute(latuser, lnguser, latdriver, lngdriver) async {
    var directions = await LocationService()
        .getDirections(latuser, lnguser, latdriver, lngdriver);

    _goToThePlace(
        directions['start_location']['lat'],
        directions['start_location']['lng'],
        directions['bounds_ne'],
        directions['bounds_sw']);
    _setPolyline(directions['polyline_decode']);
  }

  void _initLocationStream() {
    Geolocator.getPositionStream().listen((Position position) {
      _positionStreamController.add(position);
    });
  }

  Future<void> _getLocation() async {
    try {
      Position position = await _geolocationService.determinePosition();
      //print(position);
      _setMarker(LatLng(position.latitude, position.longitude));

      setState(() {
        poslatlang = LatLng(position.latitude, position.longitude);
        print(poslatlang);
      });

      final GoogleMapController controller = await _controller.future;
      await controller.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(target: poslatlang, zoom: 10)));
    } catch (e) {
      // Handle errors here
      print(e.toString());
    }
  }

  void _setMarker(LatLng point) {
    setState(() {
      _markers.add(Marker(markerId: MarkerId('marker'), position: point));
    });
  }

  void _setPolyline(List<PointLatLng> points) {
    print(points);
    final String polylineId = 'polyline_$cnt_poly';
    cnt_poly++;
    _polyline.add(Polyline(
        polylineId: PolylineId(polylineId),
        width: 2,
        color: Colors.blue,
        points: points.map((e) => LatLng(e.latitude, e.longitude)).toList()));
  }

  Future<List<Map<String, dynamic>>> getDocumentsFirst() async {
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await FirebaseFirestore.instance
            .collection('drivers')
            .doc('6D9tr4J2scPN7pmieguV6ZucRFk2')
            .get();

    Map<String, dynamic> data = documentSnapshot.data() ?? {};
    return [data];
  }

  @override
  void initState() {
    super.initState();
    // addMarkerLogo();
    // _positionStreamController = StreamController<Position>();
    // _getCurrentLocation();
    // _initLocationStream();

    _initializeState();
  }

  Future<void> _initializeState() async {
     await addMarkerLogo();
    _positionStreamController = StreamController<Position>();
    await _getCurrentLocation();
    _initLocationStream();

    var data = await getDocumentsFirst();

    await initRoute(_currentPosition.latitude, _currentPosition.longitude,
        data.first['lat'], data.first['lng']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<List<Map<String, dynamic>>>(
      stream: getDocumentsStream(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final position = snapshot.data;
          print(position!.toString());

          //_goToMe(position.latitude, position.longitude);

          Marker userMarker = Marker(
              markerId: MarkerId('user_location'),
              position:
                  LatLng(_currentPosition.latitude, _currentPosition.longitude),
              icon: markerbitmap);
          _markers.add(userMarker);

          Marker driverMarker = Marker(
            markerId: MarkerId('driver_location'),
            position: LatLng(position.first['lat'], position.first['lng']),
            icon: BitmapDescriptor.defaultMarkerWithHue(200),
          
          );
          _markers.add(driverMarker);

          return GoogleMap(
            mapType: MapType.normal,
            markers: _markers,
            polylines: _polyline,
            zoomGesturesEnabled: true,
            initialCameraPosition: CameraPosition(
              target: LatLng(position.first['lat'], position.first['lng']),
              zoom: 10.0,
            ),
            //markers: Set<Marker>.from([userMarker]),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          );
        }
        return CircularProgressIndicator();
      },
    ));
  }

  Future<void> _goToThePlace(double lat, double lng,
      Map<String, dynamic> boundsNe, Map<String, dynamic> boundsSw) async {
    // final double lat = place['geometry']['location']['lat'];
    // final double lng = place['geometry']['location']['lng'];

    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, lng), zoom: 10)));

    await controller.animateCamera(CameraUpdate.newLatLngBounds(
        LatLngBounds(
          southwest: LatLng(boundsSw['lat'], boundsSw['lng']),
          northeast: LatLng(boundsNe['lat'], boundsNe['lng']),
        ),
        25));

    _setMarker(LatLng(lat, lng));
  }
}
