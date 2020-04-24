import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _agecnt = TextEditingController();
  final TextEditingController _higcnt = TextEditingController();
  final TextEditingController _weicnt = TextEditingController();
  double result = 0.0;
  String _bmi = "";
  Color clr;

  void Calculate() {
    setState(
      () {
        int age = int.parse(_agecnt.text);
        double hight = double.parse(_higcnt.text);
        double weight = double.parse(_weicnt.text);
        if ((_agecnt.toString().isNotEmpty && age > 0) ||
            (_higcnt.toString().isNotEmpty && hight > 0) ||
            (_weicnt.toString().isNotEmpty && weight > 0)) {
          result = (weight / pow((hight / 100), 2));
        }
        if (result >= 25.0 && result < 29.9) {
          _bmi = "OverWeight";
          clr = const Color(0xFF35B4C5);
        } else if (result >= 18.5 && result < 25.9) {
          _bmi = "healthy";
          clr = Color(0xFFA5CFF1);
        } else if (result >= 29.9) {
          _bmi = "Obese";
          clr = Color(0xFF0D3656);
        } else {
          _bmi = "UnderWeight";
          clr = Color(0xFFF2DA04);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "BMI calculater",
            style: TextStyle(fontSize: 30),
          ),
        ),
        body: Container(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Icon(
                      Icons.person,
                      size: 100,
                    ),
                    TextField(
                      controller: _agecnt,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Age",
                          hintText: "enter your age",
                          icon: Icon(Icons.person_outline)),
                    ),
                    TextField(
                      controller: _higcnt,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Height",
                          hintText: "enter your height",
                          icon: Icon(Icons.insert_chart)),
                    ),
                    TextField(
                      controller: _weicnt,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Weight",
                          hintText: "enter your Weight",
                          icon: Icon(Icons.line_weight)),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: RaisedButton(
                        child: Text(
                          "calculate bmi",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.blue,
                        onPressed: Calculate,
                      ),
                    ),
                    Center(
                      child: Text(
                        "Your Bmi Count is ${result.toStringAsFixed(1)}",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    Center(
                      child: Text(
                        "$_bmi",
                        style: TextStyle(color: clr),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
