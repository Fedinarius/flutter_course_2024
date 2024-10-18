import '../domain/entities/search_query.dart';
import '../domain/repositories/weather_repository.dart';
import 'dart:io';

class App {
  final WeatherRepository repository;

  App(this.repository);

  void run() async {
    print('Введите город: ');
    var city = stdin.readLineSync();

    if (city == null) {
      print('ошибка ввода');
      return;
    }

    var resp = await repository.getWeather(SearchQuery(city));

    print('Погода в городе $city: ${resp.temp}°C, тип: ${resp.type}');

  }
}