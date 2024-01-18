import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:open_pit/app/modules/Pickup/controllers/pickup_controller.dart';
import 'package:open_pit/app/routes/app_pages.dart';

import '../controllers/path_concert_controller.dart';

class PathConcertView extends GetView<PathConcertController> {
  PathConcertView({Key? key}) : super(key: key);

  //final Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = Set<Marker>();
  Set<Polyline> _polyline = Set<Polyline>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Obx(() {
          Set<Marker> _markers = controller.markers;
          Set<Polyline> _polyline = controller.polyline;
          if (_polyline.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }
          return Container(
              height: 1000, // This line solved the issue
              child: GoogleMap(
                  markers: _markers,
                  polylines: _polyline,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(0, 0),
                    zoom: 10.0,
                  ),
                  onMapCreated: controller.onCreated));
        }),
        Container(
          child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.3,
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Obx(() => Text(
                                  "${controller.distance.value} to Venue",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800),
                                )),
                          ),
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
                            subtitle:
                                Text("${controller.pickupC.currentAddress}")
                            // Other properties like leading, trailing, onTap, etc.
                            ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                          'The price of basic plan automatically depends on distance between pick up location and venue.',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 10,
                              color: Color(0xff1A2ABC))),
                      Divider(
                        color: Colors.black,
                      ),
                      ListTile(
                        title: Obx(() => Text('${controller.detailC.basic.value != 0 ? 'Basic Plan' : 'Enjoy Plan'}',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 15))),
                        subtitle: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Obx(() {
                                if (controller.price.value == 0) {
                                  return Text('Calculating...');
                                }

                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        'IDR ${controller.price.value} X ${controller.detailC.basic.value == 0 ? controller.detailC.enjoy.value : controller.detailC.basic.value} Person'),
                                    Text('IDR ${controller.total.value}'),
                                  ],
                                );
                              }),
                            ]),
                        trailing: Image.asset(controller.detailC.basic !=0 ? 'images/Component 15.png' : 'images/Group 1.png'),
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.SUMMARY);
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Color(0xff1A2ABC),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Text(
                              'Go to Payment',
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
