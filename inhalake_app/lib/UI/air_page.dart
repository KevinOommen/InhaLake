import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';

class AirPage extends StatefulWidget {
  const AirPage({Key? key}) : super(key: key);

  @override
  State<AirPage> createState() => _AirPageState();
}

class _AirPageState extends State<AirPage> {
  Map<String, dynamic>? listResponse;
  List realTime = [];
  int lastId = 0;
  bool isLoaded = false;
  var AQI = 0.0;
  Future fetchData() async {
    http.Response response;
    response = await http.get(
        Uri.parse('https://api.thingspeak.com/channels/2057428/feeds.json'));
    if (response.statusCode == 200) {
      listResponse = json.decode(response.body);
      setState(() {
        isLoaded = true;
        realTime = listResponse!["feeds"];
        lastId = listResponse!["channel"]["last_entry_id"] - 1;
        AQI = double.parse(realTime[lastId]['field3']);
      });
      print(AQI);
    } else {
      print('fail');
    }
  }

  num co_value = 0;
  num o3_value = 0;
  num no_value = 0;
  num so2_value = 0;
  num pm_value = 0;
  num nh3_value = 0;
  Future getAirQuality() async {
    final _response = await http.get(Uri.parse(
        "http://api.openweathermap.org/data/2.5/air_pollution?lat=50&lon=50&appid=d45526feb921f51fdff2e096508f568b"));
    if (_response.statusCode == 200) {
      var data = json.decode(_response.body);
      updateUi(data);
      print(_response.statusCode);
    }
  }

  updateUi(var decodedData) {
    setState(() {
      if (decodedData == null) {
        co_value = 0;
        no_value = 0;
        o3_value = 0;
        so2_value = 0;
        pm_value = 0;
        nh3_value = 0;
      } else {
        co_value = decodedData['list'][0]['components']['co'];
        no_value = decodedData['list'][0]['components']['no'];
        o3_value = decodedData['list'][0]['components']['o3'];
        so2_value = decodedData['list'][0]['components']['so2'];
        pm_value = decodedData['list'][0]['components']['pm2_5'];
        nh3_value = decodedData['list'][0]['components']['nh3'];
      }
    });
  }

  @override
  void initState() {
    fetchData();
    var decodedData = getAirQuality();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(17, 29, 59, 1),
        body: SafeArea(
          child: Visibility(
            visible: isLoaded,
            replacement: const Center(child: CircularProgressIndicator()),
            child: Center(
                child: Column(
              children: [
                Text('Air Quality Analyser',
                    style: GoogleFonts.getFont(
                      "Poppins",
                      textStyle: TextStyle(
                        color: Color.fromARGB(255, 253, 250, 250),
                        fontSize: 25,
                      ),
                    )),
                Container(
                    child: SfRadialGauge(
                  axes: <RadialAxis>[
                    RadialAxis(
                      minimum: 0,
                      maximum: 500,
                      showLabels: false,
                      showTicks: false,
                      startAngle: 130,
                      endAngle: 45,
                      axisLineStyle: AxisLineStyle(
                        thickness: 0.1,
                        cornerStyle: CornerStyle.bothCurve,
                        color: Colors.grey.withOpacity(0.3),
                        thicknessUnit: GaugeSizeUnit.factor,
                      ),
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                          widget: Column(
                            children: [
                              Container(height: 150),
                              Text(AQI.toString(),
                                  style: GoogleFonts.getFont(
                                    "Poppins",
                                    textStyle: const TextStyle(
                                      color: Colors.lightBlue,
                                      fontSize: 30,
                                    ),
                                  )),
                              Container(height: 50),
                              Text('AQI',
                                  style: GoogleFonts.getFont(
                                    "Poppins",
                                    textStyle: TextStyle(
                                      color: Colors.lightBlue,
                                      fontSize: 30,
                                    ),
                                  )),
                            ],
                          ),
                          angle: 0,
                          positionFactor: 0,
                        ),
                      ],
                      pointers: <GaugePointer>[
                        RangePointer(
                          value: AQI.toDouble(),
                          cornerStyle: CornerStyle.bothCurve,
                          width: 0.1,
                          sizeUnit: GaugeSizeUnit.factor,
                          enableAnimation: true,
                          animationDuration: 1000,
                          animationType: AnimationType.linear,
                          gradient: SweepGradient(
                            colors: <Color>[
                              Color(0xFF00FF00),
                              Color(0xFFFFFF00),
                              Color(0xFFFFA500),
                              Color(0xFFFF0000),
                            ],
                            //each color should be at a stop

                            stops: <double>[0.25, 0.5, 0.75, 1],
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
                Expanded(
                    child: MyCard(
                        co_value: co_value,
                        o3_value: o3_value,
                        no_value: no_value,
                        so2_value: so2_value,
                        pm_value: pm_value,
                        nh3_value: nh3_value))
              ],
            )),
          ),
        ));
  }
}

class MyCard extends StatefulWidget {
  num co_value = 0;
  num o3_value = 0;
  num no_value = 0;
  num so2_value = 0;
  num pm_value = 0;
  num nh3_value = 0;
  MyCard(
      {required this.co_value,
      required this.o3_value,
      required this.no_value,
      required this.so2_value,
      required this.pm_value,
      required this.nh3_value});
  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  // void _updatePercentages() {
  //   // Your logic to update the percentages goes here
  //   setState(() {
  //     // For demo purposes, this just generates random numbers between 0 and 100
  //     co_percent = Random().nextInt(100);
  //     no_percent = Random().nextInt(100);
  //     o3_percent = Random().nextInt(100);
  //     so2_percent = Random().nextInt(100);
  //     pm_percent = Random().nextInt(100);
  //     nh3_percent = Random().nextInt(100);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    //rounded card
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Color.fromARGB(255, 31, 43, 71),
        //rounded card
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildItem('CO', widget.co_value, Colors.red),
                  _buildItem('NO', widget.no_value, Colors.blue),
                  _buildItem('O3', widget.o3_value, Colors.green),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildItem('SO2', widget.so2_value, Colors.yellow),
                  _buildItem('PM2.5', widget.pm_value, Colors.purple),
                  _buildItem('NH3', widget.nh3_value, Colors.orange),
                ],
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItem(String title, num value, Color barcolor) {
    double percentage = value * 0.5;
    if (percentage < 1) {
      percentage = value * 200;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 80,
          child: Row(
            children: [
              Text(value.toString() + "    ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  )),
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    width: 8,
                    height: percentage,
                    color: barcolor,
                  ),
                  Container(
                    width: 8,
                    height: 80,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 2),
        Text('$title',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            )),
      ],
    );
  }
}
