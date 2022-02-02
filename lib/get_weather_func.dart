import 'package:http/http.dart' as http;
import 'dart:convert';

var place;
var temp;
var weather;
var humidity;
var wind_speed;

Future getWeather() async {
  String url =
      "https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=133ec5dd98f17a8ff10ffa4bdd6bf8cb";
  http.Response response = await http.get(Uri.parse(url));
  temp = jsonDecode(response.body)["main"]["temp"];
  place = jsonDecode(response.body)["name"];
  weather = jsonDecode(response.body)["weather"][0]["main"];
  humidity = jsonDecode(response.body)["main"]["humidity"];
  wind_speed = jsonDecode(response.body)["wind"]["speed"];
  // print(weather);
  // print(place);
  // print(temp);
  // print(humidity);
  // print(wind_speed);
}
