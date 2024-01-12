import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:open_pit/app/modules/home/views/home_view.dart';
import 'package:open_pit/app/modules/order/views/order_view.dart';
import 'package:open_pit/app/modules/payment/views/payment_view.dart';
import 'package:open_pit/app/modules/profile/views/profile_view.dart';
import 'package:open_pit/app/routes/app_pages.dart';

import '../controllers/bar_controller.dart';

class BarView extends GetView<BarController> {
  BarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: buildBottomNavigationMenu(context),
        body: Obx(() => IndexedStack(
              index: controller.tabIndex.value,
              children: [
                HomeView(),
                OrderView(),
                PaymentView(),
                ProfileView(),
              ],
            )),
      ),
    );
  }

  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  final TextStyle selectedLabelStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

  buildBottomNavigationMenu(context) {
    return Obx(() => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: SizedBox(
          height: 54,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: controller.changeIndex,
            currentIndex: controller.tabIndex.value,
            backgroundColor: Colors.white,
            unselectedItemColor: Color(0xff747474),
            selectedItemColor: Color(0xff1ABC54),
            unselectedLabelStyle: unselectedLabelStyle,
            selectedLabelStyle: selectedLabelStyle,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 4),
                  child: Icon(
                    Icons.home_filled,
                    size: 20.0,
                  ),
                ),
                label: 'Home',
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 4),
                  child: Icon(Icons.approval, size: 20.0),
                ),
                label: 'Orders',
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 4),
                  child: Icon(Icons.wallet, size: 20.0),
                ),
                label: 'Payment',
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 4),
                  child: Icon(
                    Icons.location_history,
                    size: 20.0,
                  ),
                ),
                label: 'Profile',
                //backgroundColor: Colors.white,
              ),
            ],
          ),
        )));
  }
}
