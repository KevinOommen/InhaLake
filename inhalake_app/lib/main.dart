import 'package:flutter/material.dart';
import 'home.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Inhalake',
      routes: {
        "/home/": (context) => const HomeScreen(),
  },
      home: HomeScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List pages = const [HomeScreen()];
  int screens = 0;
  Color homeIconColor = Colors.white70;
  Color waterIconColor = Colors.lightBlue;
  Color airIconColor = Colors.lightBlue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 17, 29, 59),
        body: pages[screens],
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 23, left: 23, right: 23),
          child: Container(
            height: 70,
            decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(26, 14, 1, 255),
                    offset: Offset(
                      0.0,
                      5.0,
                    ),
                    blurRadius: 5.0,
                    spreadRadius: 2.0,
                  ), //BoxShadow
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ), //BoxShadow
                ],
                color: Color.fromARGB(255, 31, 43, 71),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100),
                    topRight: Radius.circular(100),
                    bottomLeft: Radius.circular(100),
                    bottomRight: Radius.circular(100))),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        screens = 0;
                        homeIconColor = Colors.white70;
                        waterIconColor = Colors.lightBlue;
                        airIconColor = Colors.lightBlue; 
                      });
                    },
                    child: Icon(
                      Icons.home,
                      size: 32,
                      color: homeIconColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 80),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        screens = 1;
                        waterIconColor = Colors.white70;
                        homeIconColor = Colors.lightBlue;
                        airIconColor = Colors.lightBlue;

                      });
                      
                    },
                    child: Icon(
                      Icons.water,
                      size: 32,
                      color: waterIconColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 70),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        screens = 2;
                        airIconColor = Colors.white70;
                        homeIconColor = Colors.lightBlue;
                        waterIconColor = Colors.lightBlue;
                      });
                    },
                    child: Icon(
                      Icons.air,
                      size: 32,
                      color: airIconColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
