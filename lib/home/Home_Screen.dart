import 'dart:math';

import 'package:flutter/material.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  double amount = 500000;
  double year = 1;
  double rate = 3;
  TextEditingController txtamount = TextEditingController(text: "500000");
  TextEditingController txtyear = TextEditingController(text: "2");
  TextEditingController txtrate = TextEditingController(text: "3");
  double i = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: Center(
          child: Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),
        title: Center(
          child: Text(
            "EMI cacluter",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30, right: 100),
                    child: Text(
                      "amount",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Container(
                      width: 105,
                      height: 40,
                      color: Colors.lime ,
                      child: TextField(
                        controller: txtamount,
                        onChanged: (value) {
                          setState(() {
                            amount = double.parse(value);
                          });
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                          Icons.currency_rupee,
                          size: 20,
                        )),
                      ),
                    ),
                  ),
                ],
              ),
              Slider(
                  value: (amount),
                  max: 5000000,
                  min: 0,
                  activeColor: Colors.pink,
                  onChanged: (value) {
                    setState(() {
                      amount = value;
                      txtamount =
                          TextEditingController(text: "${amount.toInt()}");
                    });
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30, right: 100),
                    child: Text(
                      "Tenure",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Container(
                      width: 105,
                      height: 40,
                      color: Colors.lime,
                      child: TextField(
                        controller: txtyear,
                        onChanged: (value) {
                          setState(() {
                            year = double.parse(value);
                          });
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                          Icons.timelapse_outlined,
                          size: 20,
                        )),
                      ),
                    ),
                  ),
                ],
              ),
              Slider(
                  value: (year),
                  max: 30,
                  min: 0,
                  activeColor: Colors.pink,
                  onChanged: (value) {
                    setState(() {
                      year = value;
                      txtyear = TextEditingController(text: "${year.toInt()}");
                    });
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30, right: 100),
                    child: Text(
                      "rate",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Container(
                      width: 105,
                      height: 40,
                      color: Colors.lime,
                      child: TextField(
                        controller: txtrate,
                        onChanged: (value) {
                          setState(() {
                            rate = double.parse(value);
                          });
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                          Icons.percent,
                          size: 20,
                        )),
                      ),
                    ),
                  ),
                ],
              ),
              Slider(
                  value: (rate),
                  divisions: 15,
                  max: 15,
                  min: 1,
                  activeColor: Colors.pink,
                  onChanged: (value) {
                    setState(() {
                      rate = value;
                      txtrate = TextEditingController(text: "${rate.toInt()}");
                    });
                  }),
              Center(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      i = amount * rate * year / 100;
                    });
                  },
                  child: Container(
                    height: 60,
                    width: 220,
                    decoration: BoxDecoration(
                        color: Colors.white30,
                        borderRadius: BorderRadius.circular(10)),
                    alignment: Alignment.center,
                    child: Text(
                      "calclute",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  "EMI IS",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Container(
                  height: 60,
                  width: 220,
                  decoration: BoxDecoration(
                    color: Colors.lime,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "${i}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),

      backgroundColor: Colors.green,
    );
  }
}
