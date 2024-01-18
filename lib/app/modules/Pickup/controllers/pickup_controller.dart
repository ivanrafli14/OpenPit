import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:open_pit/app/models/coordinate.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:image/image.dart' as IMG;

class PickupController extends GetxController {
  //TODO: Implement PickupController

  Rx<Coordinate?> currentTemp = Rx<Coordinate?>(null);
  Rx<Position?> currentLocation = Rx<Position?>(null);
  Rx<String?> currentAddress = Rx<String?>(null);
  final Completer<GoogleMapController> _controller = Completer();
  RxSet<Marker> markers = RxSet<Marker>();
  late BitmapDescriptor markerbitmap;

  void onCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  Uint8List? resizeImage(Uint8List data, width, height) {
    Uint8List? resizedData = data;
    IMG.Image? img = IMG.decodeImage(data);
    IMG.Image resized = IMG.copyResize(img!, width: width, height: height);
    resizedData = Uint8List.fromList(IMG.encodePng(resized));
    return resizedData;
  }

  Future<void> addMarkerLogo() async {
    markerbitmap = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      "images/map_icon.png",
    );
  }

  Future<void> getCurrentLocation() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return Future.error('Location Not Available');
      }
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    currentLocation.value = position;
    currentTemp.value = Coordinate(position.latitude, position.longitude);

    currentAddress.value =
        await getAddressFromLatLng(position.latitude, position.longitude);

    await _goToTheNewPosition(position.latitude, position.longitude);
  }

  Future<String?> getAddressFromLatLng(
      double latitude, double longitude) async {
    final apiKey = dotenv.env['GOOGLE_MAPS_API'];
    final url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = convert.jsonDecode(response.body);
        if (data['status'] == 'OK' && data['results'].isNotEmpty) {
          final address = data['results'][0]['formatted_address'];
          return address;
        }
      }
    } catch (e) {
      print('Error encoding location: $e');
    }

    return null;
  }

  Future<void> _goToTheNewPosition(double lat, double lng) async {
    markers.clear();

    if (currentTemp.value != null) {
      Marker userMarker = Marker(
        markerId: MarkerId('user_location'),
        position:
            LatLng(currentTemp.value!.latitude, currentTemp.value!.longitude),
        icon: BitmapDescriptor.defaultMarkerWithHue(120),
      );

      markers.add(userMarker);
    }

    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(
                currentTemp.value!.latitude, currentTemp.value!.longitude),
            zoom: 12)));
  }

  void updateCoordinate(double lat, double long, String description) {
    currentTemp.value = Coordinate(lat, long);
    currentAddress.value = description;

    _goToTheNewPosition(lat, long);
  }

  Future<void> getPlace(String placeId) async {
    final apiKey = 'AIzaSyD70kaxV0TaMWeKNwxAdSQNO8fvdsZF6YU';
    final String url =
        'https://maps.googleapis.com/maps/api/place/details/json?placeid=$placeId&key=$apiKey';

    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var result = json['result'] as Map<String, dynamic>;

    double latPlace = result['geometry']['location']['lat'];
    double lngPlace = result['geometry']['location']['lng'];
    String addressFormat = result['formatted_address'];

    updateCoordinate(latPlace, lngPlace, addressFormat);
  }

  @override
  void onInit() async {
    super.onInit();
    await addMarkerLogo();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
