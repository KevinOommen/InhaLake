import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  getWeather() async {
    final _response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=9.991324&lon=76.302381&units=metric&appid=d45526feb921f51fdff2e096508f568b'));
    if (_response.statusCode == 200) {
      print('sucess');
      var data = json.decode(_response.body);
      updateUi(data);
    } else {
      print(_response.statusCode);
    }
  }

  updateUi(var decodedData) {
    setState(() {
      setState(() {
        if (decodedData == null) {
          temp = 0;
          feelLike = 0;
          wind = 0;
          humidity = 0;
          city = 'not avail';
          weather = 'not avail';
        } else {
          temp = decodedData['main']['temp'];
          feelLike = decodedData['main']['feels_like'];
          wind = decodedData['wind']['speed'];
          humidity = decodedData['main']['humidity'];
          city = decodedData['name'];
          weather = decodedData['weather']['description'];
        }
      });
    });
  }

  num? temp;
  num? feelLike;
  num? wind;
  num? humidity;
  String? city;
  String? weather;

  bool isLoaded = false;
  @override
  void initState() {
    var decodedData = getWeather();
    if (decodedData != null) {
      setState(() {
        isLoaded = true;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 17, 29, 59),
      body: SafeArea(
          child: Visibility(
        visible: isLoaded,
        replacement: const Center(child: CircularProgressIndicator()),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
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
                    children: [
                      const Text(
                        '             Monday,12 Feb',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        '     Ernakulam',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 31, 43, 71),
                      borderRadius: BorderRadius.circular(200),
                    ),
                    child: Image.asset(
                      'assets/thunderstorm.png',
                      scale: 3,
                    ),
                  ),
                  Container(
                    width: 20,
                  ),
                  Column(
                    children: [
                     const  Text(
                        ' 20°',
                        style: TextStyle(
                            color: Colors.lightBlue,
                            fontSize: 70,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        '(In Celcius)',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w300),
                      ),
                      Container(
                        height: 10,
                      ),
                      const Text(
                        'Thunderstorm',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
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
                  const Text(
                    '    Wind \n 14km/h',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Container(
                    width: 40,
                  ),
                  const Text(
                    '   Temp \n     18°c',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Container(
                    width: 40,
                  ),
                  const Text(
                    '  Humidity   \n      49%',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
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
                    child: const Center(
                        child: Text(
                      ' 8°',
                      style: TextStyle(
                          color: Colors.lightBlue,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    )),
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
                    child: const Center(
                        child: Text(
                      ' 5°',
                      style: TextStyle(
                          color: Colors.lightBlue,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    )),
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
                    child: const Center(
                        child: Text(
                      ' 1°',
                      style: TextStyle(
                          color: Colors.lightBlue,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      )),
    );
  }
}