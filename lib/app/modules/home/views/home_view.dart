import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';
import 'package:open_pit/app/data/dummy.dart';
import 'package:open_pit/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('images/openpitlogo1 1.png'),
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
                              color: Color(0xff1A2ABC))),
                      Icon(
                        Icons.arrow_drop_down,
                        color: Color(0xff1A2ABC),
                      ),
                      Icon(
                        Icons.notifications,
                        color: Color(0xff1A2ABC),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 3, left: 15),
            child: Obx(() => Text(
                  controller.isLogin.value == false
                      ? 'Hello Guest'
                      : 'Hello, ${controller.fireAuthC.user!.displayName}',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: 16),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, bottom: 5),
            child: Text(
              'Which concert will you discover?',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontSize: 14),
            ),
          ),
          Expanded(
            child: MasonryGridView.builder(
              itemCount: 4,
              gridDelegate:
                  const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
              itemBuilder: (context, index) {
                return Container(
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
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.asset(
                '${data[index]['image']}',
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14),
            child: Text(
              '${data[index]['title']}',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  fontSize: 12),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14, top: 3),
            child: Text('${data[index]['date']}',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    fontSize: 10)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14, top: 3),
            child: Text('· Bus',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Color(0xff1A2ABC),
                    fontSize: 10)),
          ),
          if (show) ...[
            Padding(
              padding: const EdgeInsets.only(left: 14, top: 3),
              child: Text('· Tickets',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Color(0xff1A2ABC),
                      fontSize: 10)),
            ),
          ],
          Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  controller.clickButton(index);
                },
                child: Text('Book',
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        fontSize: 12)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff1A2ABC),
                  padding: EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                ),
              )),
        ],
      ),
    );
  }
}
