import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class WaterPage extends StatefulWidget {
  const WaterPage({Key? key}) : super(key: key);

  @override
  State<WaterPage> createState() => _WaterPageState();
}

class _WaterPageState extends State<WaterPage> {
  bool isLoaded = false;

  bool isCardView = true;

  Map<String, dynamic>? listResponse;
  List realTime = [];
  int lastId = 0;
  int tds = 0;
  int turbidity = 0;
  String verdict = '';

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
        tds = int.parse(realTime[lastId]['field2']);
        turbidity = int.parse(realTime[lastId]['field1']);
      });
      print(realTime[lastId]['field3']);
      if (0 <= turbidity && turbidity <= 19 && tds < 500) {
        verdict = 'Drinkable  water';
      } else {
        verdict = 'Not Drinkable water';
      }
    } else {
      print('fail');
    }
  }

  @override
  void initState() {
    fetchData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Visibility(
          visible: isLoaded,
          replacement: const Center(child: CircularProgressIndicator()),
          child: ListView(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            physics: const BouncingScrollPhysics(),
            children: [
              Center(
                child: Text(
                  'Water quality Analyser',
                  style: GoogleFonts.getFont(
                    "Poppins",
                    textStyle: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              SfRadialGauge(
                animationDuration: 3500,
                enableLoadingAnimation: true,
                axes: <RadialAxis>[
                  RadialAxis(
                      minimum: 0,
                      maximum: 14,
                      useRangeColorForAxis: true,
                      interval: 1,
                      minorTicksPerInterval: 0,
                      showAxisLine: false,
                      radiusFactor: 0.95,
                      labelOffset: 5,
                      ranges: <GaugeRange>[
                        GaugeRange(
                            startValue: 0,
                            endValue: 1,
                            startWidth: 0.265,
                            sizeUnit: GaugeSizeUnit.factor,
                            endWidth: 0.265,
                            color: const Color.fromARGB(220, 255, 0, 0)),
                        GaugeRange(
                            startValue: 1,
                            endValue: 2,
                            startWidth: 0.265,
                            sizeUnit: GaugeSizeUnit.factor,
                            endWidth: 0.265,
                            color: const Color.fromARGB(225, 255, 89, 0)),
                        GaugeRange(
                            startValue: 2,
                            endValue: 3,
                            startWidth: 0.265,
                            sizeUnit: GaugeSizeUnit.factor,
                            endWidth: 0.265,
                            color: const Color.fromARGB(225, 238, 169, 31)),
                        GaugeRange(
                            startValue: 3,
                            endValue: 4,
                            startWidth: 0.265,
                            sizeUnit: GaugeSizeUnit.factor,
                            endWidth: 0.265,
                            color: const Color.fromARGB(255, 255, 225, 0)),
                        GaugeRange(
                            startValue: 4,
                            endValue: 5,
                            startWidth: 0.265,
                            sizeUnit: GaugeSizeUnit.factor,
                            endWidth: 0.265,
                            color: const Color.fromARGB(218, 201, 238, 34)),
                        GaugeRange(
                            startValue: 5,
                            endValue: 6,
                            startWidth: 0.265,
                            sizeUnit: GaugeSizeUnit.factor,
                            endWidth: 0.265,
                            color: const Color.fromARGB(233, 97, 250, 20)),
                        GaugeRange(
                            startValue: 6,
                            endValue: 7,
                            startWidth: 0.265,
                            sizeUnit: GaugeSizeUnit.factor,
                            endWidth: 0.265,
                            color: const Color.fromARGB(255, 15, 146, 0)),
                        GaugeRange(
                            startValue: 7,
                            endValue: 8,
                            startWidth: 0.265,
                            sizeUnit: GaugeSizeUnit.factor,
                            endWidth: 0.265,
                            color: const Color.fromARGB(218, 32, 207, 47)),
                        GaugeRange(
                            startValue: 8,
                            endValue: 9,
                            startWidth: 0.265,
                            sizeUnit: GaugeSizeUnit.factor,
                            endWidth: 0.265,
                            color: const Color.fromARGB(233, 20, 169, 77)),
                        GaugeRange(
                            startValue: 9,
                            endValue: 10,
                            startWidth: 0.265,
                            sizeUnit: GaugeSizeUnit.factor,
                            endWidth: 0.265,
                            color: const Color.fromARGB(243, 0, 167, 153)),
                        GaugeRange(
                            startValue: 10,
                            endValue: 11,
                            startWidth: 0.265,
                            sizeUnit: GaugeSizeUnit.factor,
                            endWidth: 0.265,
                            color: const Color.fromARGB(235, 14, 112, 157)),
                        GaugeRange(
                            startValue: 11,
                            endValue: 12,
                            startWidth: 0.265,
                            sizeUnit: GaugeSizeUnit.factor,
                            endWidth: 0.265,
                            color: const Color.fromARGB(218, 41, 34, 238)),
                        GaugeRange(
                            startValue: 12,
                            endValue: 13,
                            startWidth: 0.265,
                            sizeUnit: GaugeSizeUnit.factor,
                            endWidth: 0.265,
                            color: const Color.fromARGB(218, 24, 2, 138)),
                        GaugeRange(
                            startValue: 13,
                            endValue: 14,
                            startWidth: 0.265,
                            sizeUnit: GaugeSizeUnit.factor,
                            endWidth: 0.265,
                            color: const Color.fromARGB(255, 48, 13, 61)),
                      ],
                      annotations: const <GaugeAnnotation>[
                        GaugeAnnotation(
                            angle: 90,
                            positionFactor: 0.35,
                            widget: Text('pH value',
                                style: TextStyle(
                                    color: Color(0xFFF8B195), fontSize: 16))),
                        GaugeAnnotation(
                          angle: 90,
                          positionFactor: 0.8,
                          widget: Text(
                            '7.8',
                            style: TextStyle(
                                color: Colors.lightBlue,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        )
                      ],
                      pointers: <GaugePointer>[
                        NeedlePointer(
                          value: 7.8,
                          needleStartWidth: isCardView ? 0 : 1,
                          needleEndWidth: isCardView ? 5 : 8,
                          animationType: AnimationType.easeOutBack,
                          enableAnimation: true,
                          animationDuration: 1200,
                          knobStyle: KnobStyle(
                              knobRadius: isCardView ? 0.06 : 0.09,
                              borderColor: const Color(0xFFF8B195),
                              color: Colors.white,
                              borderWidth: isCardView ? 0.035 : 0.05),
                          tailStyle: TailStyle(
                              color: const Color(0xFFF8B195),
                              width: isCardView ? 4 : 8,
                              length: isCardView ? 0.15 : 0.2),
                          needleColor: const Color(0xFFF8B195),
                        )
                      ],
                      axisLabelStyle:
                          GaugeTextStyle(fontSize: isCardView ? 10 : 12),
                      majorTickStyle: const MajorTickStyle(
                          length: 0.25, lengthUnit: GaugeSizeUnit.factor),
                      minorTickStyle: const MinorTickStyle(
                          length: 0.13,
                          lengthUnit: GaugeSizeUnit.factor,
                          thickness: 1))
                ],
              ),
              Center(
                child: Text(
                  verdict,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 115, 255, 77),
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: 10,
              ),
              Container(
                height: 110,
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
                      'Turbidity',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    const Text(
                      '   (ntu)',
                      style: TextStyle(color: Colors.white),
                    ),
                    Container(
                      width: 65,
                    ),
                    Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.lightBlue, width: 4),
                          borderRadius: BorderRadius.circular(200)),
                      child: Center(
                          child: Text(
                        isLoaded ? realTime[lastId]['field1'] : '4',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 25),
                      )),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 110,
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
                      'tds',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    const Text(
                      '   (ppm)',
                      style: TextStyle(color: Colors.white),
                    ),
                    Container(
                      width: 130,
                    ),
                    Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.lightBlue, width: 4),
                          borderRadius: BorderRadius.circular(200)),
                      child: Center(
                          child: Text(
                        isLoaded ? realTime[lastId]['field2'] : '4',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      )),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 330,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 31, 43, 71),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50))),
                child: Row(
                  children: [
                    Container(
                      width: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Analysis',
                            overflow: TextOverflow.fade,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.white,
                                fontSize: 40),
                          ),
                          Container(
                            height: 20,
                          ),
                          Container(
                            height: 60,
                            width: 230,
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.2),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(100),
                                    topRight: Radius.circular(100),
                                    bottomLeft: Radius.circular(100),
                                    bottomRight: Radius.circular(100))),
                            child: const Padding(
                              padding: EdgeInsets.only(left: 20, top: 17),
                              child: Text(
                                'pH- slightly basic',
                                overflow: TextOverflow.fade,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                          Container(
                            height: 10,
                          ),
                          Container(
                            height: 60,
                            width: 240,
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.2),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(100),
                                    topRight: Radius.circular(100),
                                    bottomLeft: Radius.circular(100),
                                    bottomRight: Radius.circular(100))),
                            child: const Padding(
                              padding: EdgeInsets.only(left: 20, top: 17),
                              child: Text(
                                'Turbidity- clean water,',
                                overflow: TextOverflow.fade,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                          Container(
                            height: 10,
                          ),
                          Container(
                            height: 70,
                            width: 270,
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.2),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(100),
                                    topRight: Radius.circular(100),
                                    bottomLeft: Radius.circular(100),
                                    bottomRight: Radius.circular(100))),
                            child: const Padding(
                              padding:
                                  EdgeInsets.only(left: 20, top: 14, right: 20),
                              child: Text(
                                'TDS- Filtered drinking water,',
                                overflow: TextOverflow.fade,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 17, 29, 59),
    );
  }
}
