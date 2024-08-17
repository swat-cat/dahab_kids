import 'package:dahab_kids/domain/models/resource.dart';
import 'package:dahab_kids/domain/repositories/weather_repository.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/dto/weather.dart';

class WeatherViewmodel extends ChangeNotifier {
  bool isLoading = false;
  Resource<Weather> weather = Resource.initial();
  WeatherRepository repository;

  WeatherViewmodel(this.repository);

  Future fetchWeather(String city) async {
    if (city.isEmpty) {
      weather = Resource.initial();
      notifyListeners();
    }
    if (city.length >= 3) {
      isLoading = true;
      notifyListeners();
      weather = await repository.getWeatherByCityName(city);
      isLoading = false;
      notifyListeners();
    }
  }
}
