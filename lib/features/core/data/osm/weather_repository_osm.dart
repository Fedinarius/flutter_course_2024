import 'package:practice_1/features/core/data/osm/osm_api.dart';
import 'package:practice_1/features/core/domain/repositories/weather_repository.dart';
import 'package:practice_1/features/core/domain/entities/search_response.dart';
import 'package:practice_1/features/core/domain/entities/search_query.dart';



class WeatherRepositoryOSM implements WeatherRepository {
  final OSMApi _api;

  WeatherRepositoryOSM(this._api);

  @override
  Future<SearchResponse> getWeather(SearchQuery query) async {
    var response = await _api.getWeather(query.city);

    return SearchResponse(response.temp.toInt(), _weatherType(response.type));
  }
}

WeatherType _weatherType(String type) {
  switch (type.toLowerCase()) {
    case 'cloudy':
    case 'partly cloudy':
      return WeatherType.cloudy;
    case 'clear':
    case 'sunny':
      return WeatherType.clear;
    case 'rain':
    case 'showers':
      return WeatherType.rain;
    default:
      return WeatherType.other;
  }
}