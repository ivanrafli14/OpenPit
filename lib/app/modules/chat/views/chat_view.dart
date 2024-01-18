import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Image.asset(
                'images/image 8.png', // replace with your logo asset path
                width: 40, // set the width as per your requirement
                height: 40, // set the height as per your requirement
              ),
            ),
            // Add a vertical divider for better separation
            const VerticalDivider(
              color: Color.fromRGBO(0, 0, 0, 1.0),
              thickness: 1,
              width: 4,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ed Sheeran',
                  style: GoogleFonts.sofiaSans(
                    textStyle: const TextStyle(
                        color: Color.fromRGBO(57, 57, 57, 1.0), fontSize: 18),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Text(
                  'Group A - (22 Member)',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(26, 42, 188, 1.0),
                      fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'images/doodle 1.png'), // replace with your image asset path
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            // Your existing content goes here

            // Add a spacer to push the input field to the bottom
            const Spacer(),

            BottomAppBar(
              color: const Color.fromRGBO(
                  247, 247, 247, 1.0), // Set the color for the bottom bar
              // Input field for typing a message
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Row(
                  children: [
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Type a message...',
                          filled: true,
                          fillColor: const Color.fromRGBO(217, 217, 217, 0.5),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'images/Plus_chat.png', // replace with your image asset path
                              width:
                                  28, // set the width as per your requirement
                              height:
                                  28, // set the height as per your requirement
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Implement send functionality
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'images/send.png', // replace with your icon asset path
                          width: 32, // set the width as per your requirement
                          height: 32, // set the height as per your requirement
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
}
