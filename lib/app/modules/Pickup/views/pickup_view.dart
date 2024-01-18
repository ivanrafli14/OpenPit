import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:open_pit/app/routes/app_pages.dart';


import '../controllers/pickup_controller.dart';

class PickupView extends GetView<PickupController> {
  PickupView({Key? key}) : super(key: key);
  final Completer<GoogleMapController> _controller = Completer();

  final LatLng _center = const LatLng(45.521563, -122.677433);

  Set<Marker> _markers = Set<Marker>();
  

 

  @override
  Widget build(BuildContext context) {
    void getLocation() async {
      await controller.getCurrentLocation();
    }

    return Scaffold(
        body: Stack(
      children: <Widget>[
        Obx(() {
          Set<Marker> markers = controller.markers;

          if (controller.currentLocation.value == null) {
            controller.getCurrentLocation();
            return Center(child: CircularProgressIndicator());
          }

          return Container(
              height: 1000,
              child: GoogleMap(
                markers: {
                  Marker(
                    markerId: MarkerId('user_location'),
                    position: LatLng(controller.currentTemp.value!.latitude,
                        controller.currentTemp.value!.longitude),
                    icon: controller.markerbitmap,
                  )
                },
                onMapCreated: controller.onCreated,
                initialCameraPosition: CameraPosition(
                  target: LatLng(controller.currentTemp.value!.latitude,
                      controller.currentTemp.value!.longitude),
                  zoom: 10.0,
                ),
              ));
        }),
        Container(
          child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3.8,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Set Pickup Location',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Get.toNamed(Routes.SEARCH_PLACE);
                              },
                              child: Text('Edit'))
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              8.0), // Set your desired border radius
                          color: Color(
                              0xffD9D9D9), // Set your desired background color
                        ),
                        margin: EdgeInsets.all(4.0), // Set margin as needed
                        child: ListTile(
                            leading: Icon(Icons.location_on),
                            title: Text('Pick up address',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w700)),
                            subtitle: Obx(() => Text(
                                '${controller.currentAddress.value ?? "Fetching location..."}'))
                            // Other properties like leading, trailing, onTap, etc.
                            ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.PATH_CONCERT);
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Color(0xff1A2ABC),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Text(
                              'Next',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ) // My cards showing in front of the Map's
              ),
        )
      ],
    ));
  }
}
