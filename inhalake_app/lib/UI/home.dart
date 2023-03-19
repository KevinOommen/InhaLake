import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoaded = true;
  late final VideoPlayerController controller;

  @override
  void initState() {
    controller = VideoPlayerController.asset('assets/homevid.mp4')
      ..initialize().then((_) {
        controller.play();
        controller.setLooping(true);
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 17, 29, 59),
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(child: CircularProgressIndicator()),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(35),
                  child: Container(
                    height: 350,
                    width: double.infinity,
                    child: VideoPlayer(controller),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(200)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 15),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.apple,
                        color: Colors.white,
                        size: 45,
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      Column(
                        children: const [
                          Text(
                            '             Monday,12 Feb',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            '     Ernakulam',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 230, left: 30),
                  child: Text(
                    'Hi, How was your Day?',
                    style: GoogleFonts.getFont(
                      "Poppins",
                      textStyle: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 35,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: Container(
                height: 100,
                width: 350,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 31, 43, 71),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(100),
                        topRight: Radius.circular(100),
                        bottomLeft: Radius.circular(100),
                        bottomRight: Radius.circular(100))),
                child: Row(
                  children: [
                    Container(
                      width: 30,
                    ),
                    Text(
                      '    Wind \n 14km/h',
                      style: GoogleFonts.getFont(
                        "Poppins",
                        textStyle: const TextStyle(
                          color: Color.fromARGB(255, 253, 250, 250),
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      width: 20,
                    ),
                    Text(
                      '   Feels like \n       34°c',
                      style: GoogleFonts.getFont(
                        "Poppins",
                        textStyle: const TextStyle(
                          color: Color.fromARGB(255, 253, 250, 250),
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      width: 20,
                    ),
                    Text(
                      '  Humidity   \n      49%',
                      style: GoogleFonts.getFont(
                        "Poppins",
                        textStyle: const TextStyle(
                          color: Color.fromARGB(255, 253, 250, 250),
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Container(
                    height: 30,
                    width: 90,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 93, 137, 240),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(100),
                            topRight: Radius.circular(100),
                            bottomLeft: Radius.circular(100),
                            bottomRight: Radius.circular(100))),
                    child: const Center(
                        child: Text(
                      'Today',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    height: 30,
                    width: 90,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 31, 43, 71),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(100),
                            topRight: Radius.circular(100),
                            bottomLeft: Radius.circular(100),
                            bottomRight: Radius.circular(100))),
                    child: const Center(
                        child: Text(
                      'Tomorrow',
                      style: TextStyle(
                          color: Color.fromARGB(255, 101, 101, 101),
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    height: 30,
                    width: 90,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 31, 43, 71),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(100),
                            topRight: Radius.circular(100),
                            bottomLeft: Radius.circular(100),
                            bottomRight: Radius.circular(100))),
                    child: const Center(
                        child: Text(
                      '7 Days',
                      style: TextStyle(
                          color: Color.fromARGB(255, 101, 101, 101),
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Container(
                    height: 110,
                    width: 70,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 31, 43, 71),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(80),
                            topRight: Radius.circular(80),
                            bottomLeft: Radius.circular(80),
                            bottomRight: Radius.circular(80))),
                    child: Center(
                      child: Text(
                        '32°',
                        style: GoogleFonts.getFont(
                          "Poppins",
                          textStyle: const TextStyle(
                              color: Colors.lightBlue,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Container(
                    height: 110,
                    width: 70,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 31, 43, 71),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(80),
                            topRight: Radius.circular(80),
                            bottomLeft: Radius.circular(80),
                            bottomRight: Radius.circular(80))),
                    child: Center(
                      child: Text(
                        '31°',
                        style: GoogleFonts.getFont(
                          "Poppins",
                          textStyle: const TextStyle(
                              color: Colors.lightBlue,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35),
                  child: Container(
                    height: 110,
                    width: 70,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 31, 43, 71),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(80),
                            topRight: Radius.circular(80),
                            bottomLeft: Radius.circular(80),
                            bottomRight: Radius.circular(80))),
                    child: Center(
                      child: Text(
                        '34°',
                        style: GoogleFonts.getFont(
                          "Poppins",
                          textStyle: const TextStyle(
                              color: Colors.lightBlue,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
