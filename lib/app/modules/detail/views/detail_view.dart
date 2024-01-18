import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:get/get.dart';
import 'package:open_pit/app/data/dummy.dart';
import 'package:open_pit/app/routes/app_pages.dart';

import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Concert in Jakarta",
          style: GoogleFonts.sofiaSans(
            textStyle: const TextStyle(
                color: Color.fromRGBO(57, 57, 57, 1.0), fontSize: 16),
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        // bottom: PreferredSize(
        //   preferredSize: Size.fromHeight(4.0), // Adjust the height as needed
        //   child: Container(
        //     width: double.infinity,
        //     height: 0.8,
        //     color: Color.fromRGBO(194, 201, 189, 1.0), // Border color
        //   ),
        // ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Column(
                children: [
                  // Images at the top
                  Image.asset(
                    '${data[controller.idx]['image']}', // Replace with your image path
                    width: 169.0,
                    height: 168.0,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height:
                        10.0, // Adjust the height to add space between the image and text
                  ),
                  Text(
                    '${data[controller.idx]['title']}',
                    style: GoogleFonts.inter(
                        fontSize: 16.0,
                        color: Color.fromRGBO(57, 57, 57, 1.0),
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    '${data[controller.idx]['date']}',
                    style: GoogleFonts.inter(
                        fontSize: 12.0, color: Color.fromRGBO(57, 57, 57, 1.0)),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    'Gelora Bung Karno',
                    style: GoogleFonts.inter(
                        fontSize: 12.0, color: Color.fromRGBO(57, 57, 57, 1.0)),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Choose Plan',
                      style: GoogleFonts.inter(
                          fontSize: 12.0,
                          color: Color.fromRGBO(57, 57, 57, 1.0),
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Color.fromRGBO(
                          217, 217, 217, 0.5), // Adjust the radius as needed
                    ),
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        // Image in the grey box
                        Image.asset(
                          'images/Component 15.png', // Replace with your image path
                          width: 80.0,
                          height: 80.0,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 16.0),
                        // Three texts to the right of the image
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Basic Plan',
                                style: GoogleFonts.sofiaSans(
                                  textStyle: const TextStyle(
                                      color: Color.fromRGBO(57, 57, 57, 1.0),
                                      fontSize: 12.0),
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              Text(
                                'Say goodbye to traffic worries! We will pick you up and take you with concert bus',
                                style: GoogleFonts.inter(
                                  fontSize: 10.0,
                                  color: Color.fromRGBO(57, 57, 57, 1.0),
                                ),
                              ),
                              SizedBox(height: 4.0),
                              Text(
                                'Start from 75k',
                                style: GoogleFonts.inter(
                                  fontSize: 10.0,
                                  color: Color.fromRGBO(26, 42, 188, 1.0),
                                ),
                              ),
                              Obx(() {
                                if (controller.basic.value == 0) {
                                  return Container(
                                    alignment: Alignment.centerRight,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        controller.enjoy.value = 0;
                                        controller.increment_basic();
                                      },
                                      style: ButtonStyle(
                                        minimumSize: MaterialStateProperty.all(Size(
                                            32.0,
                                            36.0)), // Adjust the size as needed
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Color(0xff1A2ABC)),
                                      ),
                                      child: Text(
                                        'Add',
                                        style: GoogleFonts.sofiaSans(
                                          textStyle: const TextStyle(
                                            color: Color.fromRGBO(
                                                247, 247, 247, 1.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }

                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(width: 1.0),
                                    GestureDetector(
                                      onTap: () {
                                        controller.decrement_basic();
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(right: 4.0),
                                        child: Image.asset(
                                          'images/Minus.png', // Replace with your image path
                                          width: 20.0,
                                          height: 20.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        child: Text(
                                          '${controller.basic} person',
                                          style: GoogleFonts.sofiaSans(
                                            textStyle: const TextStyle(
                                                color: Color.fromRGBO(
                                                    57, 57, 57, 1.0),
                                                fontSize: 12),
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => controller.increment_basic(),
                                      child: Container(
                                        margin: EdgeInsets.only(left: 4.0),
                                        // Adjust the margin as needed
                                        child: Image.asset(
                                          'images/Plus.png', // Replace with your image path
                                          width: 20.0,
                                          height: 20.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              })
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Color.fromRGBO(
                          217, 217, 217, 0.5), // Adjust the radius as needed
                    ),
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        // Image in the grey box
                        Image.asset(
                          'images/Group 1.png', // Replace with your image path
                          width: 80.0,
                          height: 80.0,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 16.0),
                        // Three texts to the right of the image
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Enjoy Plan',
                                style: GoogleFonts.sofiaSans(
                                  textStyle: const TextStyle(
                                      color: Color.fromRGBO(57, 57, 57, 1.0),
                                      fontSize: 12),
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              Text(
                                'You will receive our basic plan and won\'t have to worry about ordering tickets on other platforms.',
                                style: GoogleFonts.inter(
                                  fontSize: 10.0,
                                  color: Color.fromRGBO(57, 57, 57, 1.0),
                                ),
                              ),
                              SizedBox(height: 4.0),
                              Text(
                                'Start from 75k + ticket price',
                                style: GoogleFonts.inter(
                                  fontSize: 10.0,
                                  color: Color.fromRGBO(57, 57, 57, 1.0),
                                ),
                              ),
                              Obx(() {
                                if (controller.enjoy.value == 0) {
                                  return Container(
                                    alignment: Alignment.centerRight,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        controller.basic.value = 0;
                                        controller.increment_enjoy();
                                      },
                                      style: ButtonStyle(
                                        minimumSize: MaterialStateProperty.all(Size(
                                            32.0,
                                            36.0)), // Adjust the size as needed
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Color(0xff1A2ABC)),
                                      ),
                                      child: Text(
                                        'Add',
                                        style: GoogleFonts.sofiaSans(
                                          textStyle: const TextStyle(
                                            color: Color.fromRGBO(
                                                247, 247, 247, 1.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }

                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(width: 1.0),
                                    GestureDetector(
                                      onTap: () {
                                        controller.decrement_enjoy();
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(right: 4.0),
                                        child: Image.asset(
                                          'images/Minus.png', // Replace with your image path
                                          width: 20.0,
                                          height: 20.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        child: Text(
                                          '${controller.enjoy} person',
                                          style: GoogleFonts.sofiaSans(
                                            textStyle: const TextStyle(
                                                color: Color.fromRGBO(
                                                    57, 57, 57, 1.0),
                                                fontSize: 12),
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => controller.increment_enjoy(),
                                      child: Container(
                                        margin: EdgeInsets.only(left: 4.0),
                                        // Adjust the margin as needed
                                        child: Image.asset(
                                          'images/Plus.png', // Replace with your image path
                                          width: 20.0,
                                          height: 20.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              })
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Text(
                      'Add-on',
                      style: GoogleFonts.inter(
                          fontSize: 12.0,
                          color: Color.fromRGBO(57, 57, 57, 1.0),
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Color.fromRGBO(
                          217, 217, 217, 0.5), // Adjust the radius as needed
                    ),
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        // Image in the grey box
                        Image.asset(
                          'images/Group 2.png', // Replace with your image path
                          width: 80.0,
                          height: 80.0,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 16.0),
                        // Three texts to the right of the image
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Happy Meal',
                                style: GoogleFonts.sofiaSans(
                                  textStyle: const TextStyle(
                                      color: Color.fromRGBO(57, 57, 57, 1.0),
                                      fontSize: 12),
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              Text(
                                'Our solution if you want to enjoy the concert trip with a food service.',
                                style: GoogleFonts.inter(
                                  fontSize: 10.0,
                                  color: Color.fromRGBO(57, 57, 57, 1.0),
                                ),
                              ),
                              SizedBox(height: 4.0),
                              Text(
                                'Only 50k',
                                style: GoogleFonts.inter(
                                  fontSize: 10.0,
                                  color: Color.fromRGBO(26, 42, 188, 1.0),
                                ),
                              ),
                              Obx(() {
                                if (controller.happy_meal.value == 0) {
                                  return Container(
                                    alignment: Alignment.centerRight,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        controller.increment_happy();
                                      },
                                      style: ButtonStyle(
                                        minimumSize: MaterialStateProperty.all(Size(
                                            32.0,
                                            36.0)), // Adjust the size as needed
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Color(0xff1A2ABC)),
                                      ),
                                      child: Text(
                                        'Add',
                                        style: GoogleFonts.sofiaSans(
                                          textStyle: const TextStyle(
                                            color: Color.fromRGBO(
                                                247, 247, 247, 1.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }

                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(width: 1.0),
                                    GestureDetector(
                                      onTap: () {
                                        controller.decrement_happy();
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(right: 4.0),
                                        child: Image.asset(
                                          'images/Minus.png', // Replace with your image path
                                          width: 20.0,
                                          height: 20.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        child: Text(
                                          '${controller.happy_meal} person',
                                          style: GoogleFonts.sofiaSans(
                                            textStyle: const TextStyle(
                                                color: Color.fromRGBO(
                                                    57, 57, 57, 1.0),
                                                fontSize: 12),
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => controller.increment_happy(),
                                      child: Container(
                                        margin: EdgeInsets.only(left: 4.0),
                                        // Adjust the margin as needed
                                        child: Image.asset(
                                          'images/Plus.png', // Replace with your image path
                                          width: 20.0,
                                          height: 20.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              })
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Full-width button at the bottom
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed(Routes.PICKUP);
                      },
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                            Size(50.0, 50.0)), // Adjust the size as needed
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromRGBO(26, 42, 188, 1.0)),
                      ),
                      child: Text(
                        'Next',
                        style: GoogleFonts.sofiaSans(
                          textStyle: const TextStyle(
                              color: Color.fromRGBO(247, 247, 247, 1.0),
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
