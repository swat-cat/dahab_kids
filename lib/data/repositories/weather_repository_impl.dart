import 'package:dahab_kids/data/rest_client.dart';
import 'package:dahab_kids/domain/dto/weather.dart';
import 'package:dahab_kids/domain/models/resource.dart';
import 'package:dahab_kids/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  RestClient restClient;

  WeatherRepositoryImpl(this.restClient);

  @override
  Future<Weather> getWeatherByLocation(double lat, double lon) {
    // TODO: implement getWeatherByLocation
    throw UnimplementedError();
  }

  @override
  Future<Resource<Weather>> getWeatherByCityName(String city) async {
    final response = await restClient.get("/weather", queryParams: {
      "q": city,
      "units": "metric",
      "appid": ""
    });
    return response as Resource<Weather>;
  }
}
