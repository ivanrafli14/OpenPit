import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_pit/app/routes/app_pages.dart';

class OrderView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyTabs(),
    );
  }
}

class MyTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: buildAppBar(),
        body: buildTabBarView(),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text(
        'Plans',
        style: GoogleFonts.inter(
          textStyle: const TextStyle(
            color: Color.fromRGBO(57, 57, 57, 1.0),
            fontSize: 20,
          ),
          fontWeight: FontWeight.w700,
        ),
      ),
      bottom: buildDividerAndTabBar(),
    );
  }

  PreferredSizeWidget buildDividerAndTabBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(56.0),
      child: Column(
        children: [
          Container(
            color: Color.fromRGBO(194, 201, 189, 1.0),
            height: 0.8,
          ),
          buildTabBar(),
        ],
      ),
    );
  }

  PreferredSizeWidget buildTabBar() {
    return TabBar(
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          color: Color.fromRGBO(26, 42, 188, 1.0),
          width: 2.0,
        ),
        insets: EdgeInsets.symmetric(horizontal: 56.0),
      ),
      tabs: [
        buildTab('Ongoing'),
        buildTab('History'),
      ],
    );
  }

  Tab buildTab(String label) {
    return Tab(
      child: Text(
        label,
        style: GoogleFonts.inter(
          textStyle: const TextStyle(
            color: Color.fromRGBO(57, 57, 57, 1.0),
            fontSize: 12,
          ),
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  TabBarView buildTabBarView() {
    return TabBarView(
      children: [
        OngoingTab(),
        HistoryTab(),
      ],
    );
  }
}

class OngoingTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        OngoingItem(
          imagePath: 'images/image 11.png',
          planName: 'D-Day',
          additionalText: 'Jonas Brothers',
          startFrom: 'Ice BSD City',
          endFrom: 'Bus seats: A5, A6',
          showTextBelowButton: true,
          showNewText: true,
          buttonText: 'Live Tracking',
          buttonTextBelow: 'Picking up begins at 14:00 WIB.',
          buttonTextBelowColor: Color.fromRGBO(26, 42, 188, 1.0),
        ),
        OngoingItem(
          imagePath: 'images/image 8.png',
          planName: '30 Days Left',
          additionalText: 'Ed Sheeran: +-÷× Tour',
          startFrom: 'Gelora Bung Karno',
          endFrom: 'Bus seats: C3, C4',
          showTextBelowButton: true,
          showNewText: false,
          buttonText: 'Live Tracking',
          buttonTextBelow: 'The pickup information will be announced on D-day.',
          buttonTextBelowColor: Color.fromRGBO(116, 116, 116, 1.0),
          buttonColor: Color.fromRGBO(116, 116, 116,
              1.0), // Specify the button color for the second item
        ),
        // Other list items can be added below
      ],
    );
  }
}

class HistoryTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        OngoingItem(
          imagePath: 'images/image 9.png', // Replace with appropriate image
          planName: 'January 24, 2024',
          additionalText: 'Louis Tomlinson',
          startFrom: 'Beach City International Stadium Ancol',
          endFrom: 'Bus seats: A1, A2',
          showTextBelowButton: false,
          showNewText: false,
          buttonText: 'Add Rate',
        ),
        OngoingItem(
          imagePath: 'images/image 10.png', // Replace with appropriate image
          planName: 'January 16, 2024',
          additionalText: 'YOASOBI: ASIA TOUR',
          startFrom: 'Istora Senayan',
          endFrom: 'Bus seats: D5, D6',
          showTextBelowButton: false,
          showNewText: false,
          buttonText: 'Add Rate',
        ),
        // Other list items can be added below
      ],
    );
  }
}

class OngoingItem extends StatelessWidget {
  final String imagePath;
  final String planName;
  final String additionalText;
  final String startFrom;
  final String endFrom;
  final bool showTextBelowButton;
  final bool showNewText;
  final String buttonText;
  final Color? buttonColor;
  final String? buttonTextBelow;
  final Color? buttonTextBelowColor;

  const OngoingItem({
    required this.imagePath,
    required this.planName,
    required this.additionalText,
    required this.startFrom,
    required this.endFrom,
    required this.showTextBelowButton,
    required this.showNewText,
    required this.buttonText,
    this.buttonTextBelow,
    this.buttonTextBelowColor,
    this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color.fromRGBO(194, 201, 189,
                1.0), // Change this color to your desired border color
            width: 0.8, // Change this value to your desired border width
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imagePath,
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
                      planName,
                      style: GoogleFonts.sofiaSans(
                        textStyle: TextStyle(
                          color: Color.fromRGBO(26, 42, 188, 1.0),
                          fontSize: 12.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    if (showNewText) // Conditional rendering based on the showNewText value
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
                  additionalText,
                  style: GoogleFonts.inter(
                    fontSize: 12.0,
                    color: Color.fromRGBO(57, 57, 57, 1.0),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  startFrom,
                  style: GoogleFonts.inter(
                    fontSize: 12.0,
                    color: Color.fromRGBO(57, 57, 57, 1.0),
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  endFrom,
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
                      Get.toNamed(Routes.TRACKING);
                    },
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(
                          Size(32.0, 32.0)), // Adjust the size as needed
                      backgroundColor: MaterialStateProperty.all(
                          buttonColor ?? Color.fromRGBO(26, 42, 188, 1.0)),
                    ),
                    child: Text(
                      buttonText,
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
                SizedBox(
                  height:
                      8.0, // Adjust the height to add space between the image and text
                ),
                if (showTextBelowButton &&
                    buttonTextBelow !=
                        null) // Conditional rendering based on the showTextBelowButton value
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      buttonTextBelow ?? '',
                      style: GoogleFonts.inter(
                        fontSize: 10.0,
                        color: buttonTextBelowColor ??
                            Color.fromRGBO(26, 42, 188, 1.0),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
