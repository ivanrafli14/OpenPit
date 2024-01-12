import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';
import 'package:open_pit/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FlutterCarousel(
            options: CarouselOptions(
              height: 188,
              showIndicator: true,
              enlargeCenterPage: true,
              aspectRatio: 16 / 9,
              viewportFraction: 1,
              slideIndicator: const CircularSlideIndicator(
                  currentIndicatorColor: Colors.black,
                  indicatorBorderColor: Colors.black),
            ),
            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      //width: 700,
                      //height: 188,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: const BoxDecoration(color: Colors.amber),
                      child: Image.asset('images/image4.png'));
                },
              );
            }).toList(),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Color(0xff169E00), width: 4)),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Announced',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          color: Color(0xff252525)),
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.white, width: 4)),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Upcoming',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          color: Color(0xff252525)),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Concert in',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Color(0xff252525))),
                      Container(
                        margin: EdgeInsets.only(left: 4),
                      ),
                      Text('Jakarta',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                              color: Color(0xff252525))),
                      Icon(
                        Icons.arrow_drop_down,
                        color: Color(0xff169E00),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MasonryGridView.builder(
              itemCount: 4,
              gridDelegate:
                  const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: _buildItem(context, index));
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    bool show = index % 2 == 1;
    return Card(
      color: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'images/image ${index + 8}.png',
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'YOASOBI: Asia Tour',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 12),
            ),
            Text('March 2, 2024',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    fontSize: 10)),
            Text('· Bus',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Color(0xff169E00),
                    fontSize: 10)),
            if (show) ...[
              Text('· Tickets',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Color(0xff169E00),
                      fontSize: 10)),
            ],
            TextButton(
              onPressed: () {
                Get.toNamed(Routes.PICKUP);
              },
              style: TextButton.styleFrom(
                  backgroundColor: Color(0xff169E00),
                  minimumSize: Size(MediaQuery.of(context).size.width, 30)),
              child: const Text(
                'Book Now',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
