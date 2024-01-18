import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_pit/app/routes/app_pages.dart';

import '../controllers/payment_controller.dart';

class PaymentView extends GetView<PaymentController> {
  const PaymentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Social',
            style: GoogleFonts.inter(
              textStyle: const TextStyle(
                color: Color.fromRGBO(57, 57, 57, 1.0),
                fontSize: 20,
              ),
              fontWeight: FontWeight.w700,
            ),
          ),
          bottom: buildDividerAndTabBar(),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      10.0), 
                      color: Color(0xffD9D9D9),// Set your desired border radius
                ),
                
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Chat with fellow passengers on the bus.', style:TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Color(0xff1A2ABC)) ,),
                        Text(
                            "With this feature, you can communicate with a group of people who are heading to the concert with you. Don't hesitate to engage in conversation with them.",  style:TextStyle(fontSize: 11, fontWeight: FontWeight.w400, )),
                      ]),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color.fromRGBO(194, 201, 189,
                        1.0), // Change this color to your desired border color
                    width:
                        0.8, // Change this value to your desired border width
                  ),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'images/image 11.png',
                    width: 80.0,
                    height: 80.0,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'D- Day',
                              style: GoogleFonts.sofiaSans(
                                textStyle: TextStyle(
                                  color: Color.fromRGBO(26, 42, 188, 1.0),
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            // Conditional rendering based on the showNewText value
                            Text(
                              'February 4, 2024',
                              style: GoogleFonts.sofiaSans(
                                textStyle: TextStyle(
                                  color: Color.fromRGBO(57, 57, 57, 1.0),
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'Jonas Brothers',
                          style: GoogleFonts.inter(
                            fontSize: 12.0,
                            color: Color.fromRGBO(57, 57, 57, 1.0),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          'Ice BSD City',
                          style: GoogleFonts.inter(
                            fontSize: 12.0,
                            color: Color.fromRGBO(57, 57, 57, 1.0),
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          "Bus seats: A5, A6 (Group A)",
                          style: GoogleFonts.sofiaSans(
                            fontSize: 12.0,
                            color: Color.fromRGBO(57, 57, 57, 1.0),
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Container(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.toNamed(Routes.CHAT);
                            },
                            style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all(Size(
                                  32.0, 32.0)), // Adjust the size as needed
                              backgroundColor: MaterialStateProperty.all(
                                  Color.fromRGBO(26, 42, 188, 1.0)),
                            ),
                            child: Text(
                              'Group Chat',
                              style: GoogleFonts.sofiaSans(
                                textStyle: TextStyle(
                                  fontSize: 12.0,
                                  color: Color.fromRGBO(247, 247, 247, 1.0),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          // SizedBox(height: 8.0),
                        ),

                        // Conditional rendering based on the showTextBelowButton value
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color.fromRGBO(194, 201, 189,
                        1.0), // Change this color to your desired border color
                    width:
                        0.8, // Change this value to your desired border width
                  ),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'images/image 8.png',
                    width: 80.0,
                    height: 80.0,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '30 Day Left',
                              style: GoogleFonts.sofiaSans(
                                textStyle: TextStyle(
                                  color: Color.fromRGBO(26, 42, 188, 1.0),
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            // Conditional rendering based on the showNewText value
                            Text(
                              'February 4, 2024',
                              style: GoogleFonts.sofiaSans(
                                textStyle: TextStyle(
                                  color: Color.fromRGBO(57, 57, 57, 1.0),
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'Ed Sheeran: +-÷× Tour',
                          style: GoogleFonts.inter(
                            fontSize: 12.0,
                            color: Color.fromRGBO(57, 57, 57, 1.0),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          'Gelora Bung Karno',
                          style: GoogleFonts.inter(
                            fontSize: 12.0,
                            color: Color.fromRGBO(57, 57, 57, 1.0),
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          "Bus seats: C3, C4",
                          style: GoogleFonts.sofiaSans(
                            fontSize: 12.0,
                            color: Color.fromRGBO(57, 57, 57, 1.0),
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Container(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.toNamed(Routes.CHAT);
                            },
                            style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all(Size(
                                  32.0, 32.0)), // Adjust the size as needed
                              backgroundColor: MaterialStateProperty.all(
                                  Color.fromRGBO(26, 42, 188, 1.0)),
                            ),
                            child: Text(
                              'Group Chat',
                              style: GoogleFonts.sofiaSans(
                                textStyle: TextStyle(
                                  fontSize: 12.0,
                                  color: Color.fromRGBO(247, 247, 247, 1.0),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          // SizedBox(height: 8.0),
                        ),

                        // Conditional rendering based on the showTextBelowButton value
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }

  PreferredSizeWidget buildDividerAndTabBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(10.0),
      child: Column(
        children: [
          Container(
            color: Color.fromRGBO(194, 201, 189, 1.0),
            height: 0.8,
          ),
        ],
      ),
    );
  }
}
