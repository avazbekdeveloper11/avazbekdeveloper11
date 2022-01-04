import 'dart:math';

import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    initState() {
      setState(
        () {
          selectedDate = DateTime.now();
        },
      );
      super.initState();
    }

    return Scaffold(
      appBar: CalendarAppBar(
        lastDate: DateTime.now(),
        onDateChanged: () {},
        events: List.generate(
          100,
          (index) => DateTime.now().subtract(
            Duration(
              days: index * Random().nextInt(5),
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              selectedDate.toString(),
              style: TextStyle(
                  fontSize: size.height * 0.03, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(onPressed: () {}, child: const Text("On pressed"))
          ],
        ),
      ),
    );
  }
}
