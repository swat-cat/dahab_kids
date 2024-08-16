import 'package:dahab_kids/domain/models/resource.dart';

import '../dto/weather.dart';

abstract class WeatherRepository{
    Future<Resource<Weather>> getWeatherByCityName(String city);
    Future<Weather> getWeatherByLocation(double lat, double lon);
}