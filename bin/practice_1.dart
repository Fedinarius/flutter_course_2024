import 'package:practice_1/features/core/data/debug/weather_repository_debug.dart';
import 'package:practice_1/features/core/data/osm/osm_api.dart';
import 'package:practice_1/features/core/data/osm/weather_repository_osm.dart';
import 'package:practice_1/features/core/domain/repositories/weather_repository.dart';
import 'package:practice_1/features/core/presentation/app.dart';
import 'package:dotenv/dotenv.dart';


const String version = '0.0.1';




Future<void> main(List<String> arguments) async {
  var env = DotEnv()..load();
  print(env['API_KEY']);
  final String apiKey = env['API_KEY']!;

  var api = OSMApi(apiKey!);
  var repository = WeatherRepositoryOSM(api);

  var app = App(repository);
  app.run();
}
