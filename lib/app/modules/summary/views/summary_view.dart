import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:open_pit/app/data/dummy.dart';
import 'package:open_pit/app/modules/Pickup/controllers/pickup_controller.dart';
import 'package:open_pit/app/modules/home/controllers/home_controller.dart';
import 'package:open_pit/app/modules/path_concert/controllers/path_concert_controller.dart';
import 'package:open_pit/app/routes/app_pages.dart';

import '../controllers/summary_controller.dart';

class SummaryView extends GetView<SummaryController> {
  SummaryView({Key? key}) : super(key: key);
  PathConcertController pathC = Get.find<PathConcertController>();
  HomeController homeC = Get.find<HomeController>();

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
                    '${data[homeC.index]['image']}',
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
                      '${data[homeC.index]['title']}',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text('${data[homeC.index]['date']}'),
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
            Obx(() {
              List<Widget> widgets = [];

              if (controller.detailC.basic != 0) {
                widgets.add(ListTile(
                  title: Text('Basic Plan',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
                  subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'IDR. ${controller.pathC.price} x ${controller.detailC.basic} person'),
                        SizedBox(
                          height: 3,
                        ),
                        Text('IDR. ${controller.pathC.total.value}')
                      ]),
                  trailing: Image.asset('images/Component 15.png'),
                ));
              }

              if (controller.detailC.enjoy != 0) {
                widgets.add(ListTile(
                  title: Text('Enjoy Plan',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
                  subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'IDR. ${controller.pathC.price} x ${controller.detailC.enjoy} person'),
                        SizedBox(
                          height: 3,
                        ),
                        Text('IDR. ${controller.pathC.total.value}')
                      ]),
                  trailing: Image.asset('images/Group 1.png'),
                ));
              }

              if (controller.detailC.happy_meal != 0) {
                widgets.add(ListTile(
                  title: Text('Happy Meal',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
                  subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'IDR. 50000 X ${controller.detailC.happy_meal.value} Person'),
                        SizedBox(
                          height: 3,
                        ),
                        Text('IDR. ${controller.happyMealPrice}')
                      ]),
                  trailing: Image.asset('images/Group 2.png'),
                ));
              }

              return Column(
                children: widgets,
              );
            }),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text('Total IDR. ${controller.totalOrders}',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
            ),
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
                      backgroundColor: Color(0xff1A2ABC),
                    ),
                    onPressed: () async {
                      String snapToken =
                          await controller.getSnapToken(controller.totalOrders);
                      controller.midtrans?.startPaymentUiFlow(
                        token: snapToken,
                      );
                    },
                    child: const Text(
                      'Choose Payment',
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
