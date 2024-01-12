import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:open_pit/app/modules/Pickup/controllers/pickup_controller.dart';
import 'package:open_pit/app/modules/path_concert/controllers/path_concert_controller.dart';
import 'package:open_pit/app/routes/app_pages.dart';

import '../controllers/summary_controller.dart';

class SummaryView extends GetView<SummaryController> {
  SummaryView({Key? key}) : super(key: key);
  PathConcertController pathC = Get.find<PathConcertController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Summary'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(
                    'images/image 8.png',
                    height: 144.0,
                    width: 144.0,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ed Sheeran: +-÷× Tour',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text('March 2, 2024'),
                    SizedBox(
                      height: 8,
                    ),
                    Text('Gelora Bung Karno'),
                    SizedBox(
                      height: 8,
                    ),
                    Text('Your bus seats:'),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'C3, C4',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                    )
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Obx(() => Text(
                        "${pathC.distance.value} to Venue",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w800),
                      )),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    8.0), // Set your desired border radius
                color: Color(0xffD9D9D9), // Set your desired background color
              ),
              margin: EdgeInsets.all(4.0), // Set margin as needed
              child: ListTile(
                  leading: Icon(Icons.location_on),
                  title: Text('Pick up address',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
                  subtitle: Text("${pathC.pickupC.currentAddress}")
                  // Other properties like leading, trailing, onTap, etc.
                  ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              title: Text('Basic Plan',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
              subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('IDR. 100000 X 2 Person'),
                    SizedBox(
                      height: 3,
                    ),
                    Text('IDR. 200000')
                  ]),
              trailing: Image.asset('images/Group 11.png'),
            ),
            ListTile(
              title: Text('Happy Meal',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
              subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('IDR. 100000 X 2 Person'),
                    SizedBox(
                      height: 3,
                    ),
                    Text('IDR. 200000')
                  ]),
              trailing: Image.asset('images/Group 11.png'),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text('Total IDR. 400.000',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
            ),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      8.0), // Set your desired border radius
                  color: Color(0xffD9D9D9), // Set your desired background color
                ),
                margin: EdgeInsets.all(4.0), // Set margin as needed
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Choose Payment',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w700)),
                      Text('Change',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff1ABC54))),
                    ],
                  ),
                )),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  //margin: const EdgeInsets.all(5),
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff1ABC54),
                    ),
                    onPressed: () {
                      Get.toNamed(Routes.HOME);
                    },
                    child: const Text(
                      'Confirm Book ',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ), // trying to move to the bottom
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
