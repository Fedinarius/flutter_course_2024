class OSMWeather {
  final double temp;
  final String type;

  OSMWeather(this.temp, this.type);

  @override
  String toString() {
    return 'OSMWeather{temp: $temp, type: $type}';
  }
}