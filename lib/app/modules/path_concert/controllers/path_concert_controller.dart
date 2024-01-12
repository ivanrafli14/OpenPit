import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:open_pit/app/modules/Pickup/controllers/pickup_controller.dart';

class PathConcertController extends GetxController {
  //TODO: Implement PathConcertController
  int cnt = 0;
  final count = 0.obs;
  final String key = 'AIzaSyD70kaxV0TaMWeKNwxAdSQNO8fvdsZF6YU';
  final Completer<GoogleMapController> _controller = Completer();
  RxSet<Marker> markers = <Marker>{}.obs;
  RxSet<Polyline> polyline = <Polyline>{}.obs;
  Rx<String> distance = RxString("");

  PickupController pickupC = Get.find<PickupController>();

  void onCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  Future<Map<String, dynamic>> getDirections(
      String origin, String destination) async {
    final String url =
        'https://maps.googleapis.com/maps/api/directions/json?destination=$destination&origin=$origin&key=$key';
    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);

    var results = {
      'distance': json['routes'][0]['legs'][0]['distance']['text'],
      'bounds_ne': json['routes'][0]['bounds']['northeast'],
      'bounds_sw': json['routes'][0]['bounds']['southwest'],
      'start_location': json['routes'][0]['legs'][0]['start_location'],
      'end_location': json['routes'][0]['legs'][0]['end_location'],
      'polyline': json['routes'][0]['overview_polyline']['points'],
      'polyline_decode': PolylinePoints().decodePolyline(
        json['routes'][0]['overview_polyline']['points'],
      )
    };
    _setMarker(
        LatLng(results['end_location']['lat'], results['end_location']['lng']));
    distance.value = results['distance'];
    debugPrint("inires" + results['distance'].toString());

    return results;
  }

  Future<void> prepare(String origin, String destination) async {
    var directions = await getDirections(origin, destination);

    _goToThePlace(
        directions['start_location']['lat'],
        directions['start_location']['lng'],
        directions['bounds_ne'],
        directions['bounds_sw']);

    debugPrint('Halo' + directions.toString());

    _setPolyline(directions['polyline_decode']);
  }

  Future<void> _goToThePlace(double lat, double lng,
      Map<String, dynamic> boundsNe, Map<String, dynamic> boundsSw) async {
    // final double lat = place['geometry']['location']['lat'];
    // final double lng = place['geometry']['location']['lng'];

    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, lng), zoom: 12)));

    await controller.animateCamera(CameraUpdate.newLatLngBounds(
        LatLngBounds(
          southwest: LatLng(boundsSw['lat'], boundsSw['lng']),
          northeast: LatLng(boundsNe['lat'], boundsNe['lng']),
        ),
        25));

    _setMarker(LatLng(lat, lng));
  }

  void _setMarker(LatLng point) {
    cnt++;
    markers.add(
        Marker(markerId: MarkerId('marker' + cnt.toString()), position: point));
  }

  void _setPolyline(List<PointLatLng> points) {
    print("Ini points:" + points.toString());
    final String polylineId = 'polyline_1';
    polyline.add(Polyline(
        polylineId: PolylineId(polylineId),
        width: 2,
        color: Colors.blue,
        points: points.map((e) => LatLng(e.latitude, e.longitude)).toList()));
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    Marker userMarker = Marker(
      markerId: MarkerId('user_location'),
      position: LatLng(pickupC.currentTemp.value!.latitude,
          pickupC.currentTemp.value!.longitude),
      icon: BitmapDescriptor.defaultMarkerWithHue(120),
    );

    markers.add(userMarker);
    await prepare(pickupC.currentAddress.value!, 'Gelora Bung Karno');
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
