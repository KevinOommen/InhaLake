import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class AirPage extends StatefulWidget {
  const AirPage({Key? key}) : super(key: key);

  @override
  State<AirPage> createState() => _AirPageState();
}

class _AirPageState extends State<AirPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
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
            ranges: <GaugeRange>[
              GaugeRange(
                startValue: 0,
                endValue: 100,
                color: Colors.green,
                startWidth: 0.1,
                endWidth: 0.1,
              ),
              GaugeRange(
                startValue: 101,
                endValue: 200,
                color: Colors.yellow,
                startWidth: 0.1,
                endWidth: 0.1,
              ),
              GaugeRange(
                startValue: 200,
                endValue: 300,
                color: Colors.orange,
                startWidth: 0.1,
                endWidth: 0.1,
              ),
              GaugeRange(
                startValue: 300,
                endValue: 400,
                color: Colors.red,
                startWidth: 0.1,
                endWidth: 0.1,
              ),
              GaugeRange(
                startValue: 400,
                endValue: 500,
                color: Colors.purple,
                startWidth: 0.1,
                endWidth: 0.1,
              ),
            ],
            annotations:const <GaugeAnnotation>[
              GaugeAnnotation(
                widget: Text(
                  '80%',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                angle: 0,
                positionFactor: 0,
              ),
            ],
            pointers:const  <GaugePointer>[
              RangePointer(
                value: 100,
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
                    Color(0xFF800080),
                  ],
                  //each color should be at a stop
                  
                  stops: <double>[
                    0.25,
                    0.5,
                    0.75,
                    0.9,
                    1
                  ],
                  
                ),
                
              ),
            ],
            
          ),
        ],
      ))
      ));
  }
}