import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class first extends StatefulWidget {
  const first({Key? key}) : super(key: key);

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 17, 29, 59),
      body: Column(
        children: [
          Expanded(
              child: Image.asset(
            'assets/get-started.png',
            scale: 2,
          )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 70,
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
                  Padding(
                    padding: EdgeInsets.only(left: 80),
                    child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              "/login/", (route) => false);
                        },
                        child: const Text(
                          'login',
                          style: TextStyle(
                              color: Color.fromARGB(255, 236, 239, 240),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 80),
                    child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              "/register/", (route) => false);
                        },
                        child: const Text(
                          'register',
                          style: TextStyle(
                              color: Color.fromARGB(255, 236, 239, 240),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )),
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
