import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:weather_app/homepage.dart';
import 'package:geolocator/geolocator.dart';

class weather_result extends StatefulWidget {
  const weather_result({Key? key}) : super(key: key);

  @override
  _weather_resultState createState() => _weather_resultState();
}

class _weather_resultState extends State<weather_result> {
  var place;
  var temp1;
  var temp;
  var weather;
  var humidity;
  var wind_speed;

  Future getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium);
    double lat = position.latitude;
    double lon = position.longitude;
    getWeather(lat, lon);
  }

  Future getWeather(lat, lon) async {
    String url =
        "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=133ec5dd98f17a8ff10ffa4bdd6bf8cb";
    http.Response response = await http.get(Uri.parse(url));
    setState(() {
      this.temp1 = jsonDecode(response.body)["main"]["temp"];
      this.place = jsonDecode(response.body)["name"];
      this.weather = jsonDecode(response.body)["weather"][0]["main"];
      this.humidity = jsonDecode(response.body)["main"]["humidity"];
      this.wind_speed = jsonDecode(response.body)["wind"]["speed"];
      temp1 = (temp1 - 273);
      temp = temp1.toStringAsFixed(2);
    });
    // print(weather);
    // print(place);
    // print(temp1);
    // print(temp);
    // print(humidity);
    // print(wind_speed);
    // print(lat);
    // print(lon);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 2.5,
            color: Color(0xFF21315A),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  place != null
                      ? "Currenty in $place"
                      : "Currently in Loading", //place
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  temp != null ? "$temp\u00B0" : "Loading", //temperature
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 60.0,
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  weather != null ? "$weather" : "Loading", //weather
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ), //upper column
          ), //upper container
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(30),
              child: ListView(
                children: [
                  ListTile(
                    leading: FaIcon(
                      FontAwesomeIcons.thermometerHalf,
                      size: 30,
                      color: Colors.red
                    ),
                    title: Text(
                      "Temperature",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                    ),
                    trailing: Text(
                      temp != null ? "$temp\u00B0" : "Loading",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: FaIcon(
                      FontAwesomeIcons.cloud,
                      size: 30,
                      color: Colors.blueAccent,
                    ),
                    title: Text(
                      "Weather",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                    ),
                    trailing: Text(
                      weather != null ? "$weather" : "Loading",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    leading: FaIcon(
                      FontAwesomeIcons.sun,
                      size: 30,
                      color: Colors.deepOrangeAccent,
                    ),
                    title: Text(
                      "Humidity",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                    ),
                    trailing: Text(
                      humidity != null ? "$humidity" : "loading",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    leading: FaIcon(
                      FontAwesomeIcons.wind,
                      size: 30,
                      color: Colors.lightBlue,
                    ),
                    title: Text(
                      "Wind Speed",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                    ),
                    trailing: Text(
                      wind_speed != null ? "$wind_speed" : "Loading",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
