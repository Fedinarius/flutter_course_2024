import 'dart:convert';

import 'package:http/http.dart' as http;


import 'models/osm_weather.dart';

class OSMApi {
  final String apiKey;
  OSMApi(this.apiKey);

  Future<OSMWeather> getWeather(String city) async {
    var response = await http.get(Uri.parse('https://api.weatherapi.com/v1/current.json?key=$apiKey&q=$city'));
    var rJson = jsonDecode(response.body);

    return OSMWeather(rJson['current']['temp_c'], rJson['current']['condition']['text']);
  }
}

