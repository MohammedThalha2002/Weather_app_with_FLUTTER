import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/weather_result.dart';
import 'package:weather_app/get_weather_func.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF21315A),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset("assests/earth.gif"),
            Container(
              width: 450,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.blue,
              ),
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => weather_result()));
                },
                child: Center(
                  child: Text(
                    "Get Your Location",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
