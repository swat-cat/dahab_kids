class Weather {
  Weather({
    Coord? coord,
    List<WeatherData>? weather,
    String? base,
    Main? main,
    int? visibility,
    Wind? wind,
    Clouds? clouds,
    int? dt,
    Sys? sys,
    int? timezone,
    int? id,
    String? name,
    int? cod,
  }) {
    _coord = coord;
    _weather = weather;
    _base = base;
    _main = main;
    _visibility = visibility;
    _wind = wind;
    _clouds = clouds;
    _dt = dt;
    _sys = sys;
    _timezone = timezone;
    _id = id;
    _name = name;
    _cod = cod;
  }

  Weather.fromJson(dynamic json) {
    _coord = json['coord'] != null ? Coord.fromJson(json['coord']) : null;
    if (json['weather'] != null) {
      _weather = [];
      json['weather'].forEach((v) {
        _weather?.add(WeatherData.fromJson(v));
      });
    }
    _base = json['base'];
    _main = json['main'] != null ? Main.fromJson(json['main']) : null;
    _visibility = json['visibility'];
    _wind = json['wind'] != null ? Wind.fromJson(json['wind']) : null;
    _clouds = json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null;
    _dt = json['dt'];
    _sys = json['sys'] != null ? Sys.fromJson(json['sys']) : null;
    _timezone = json['timezone'];
    _id = json['id'];
    _name = json['name'];
    _cod = json['cod'];
  }
  Coord? _coord;
  List<WeatherData>? _weather;
  String? _base;
  Main? _main;
  int? _visibility;
  Wind? _wind;
  Clouds? _clouds;
  int? _dt;
  Sys? _sys;
  int? _timezone;
  int? _id;
  String? _name;
  int? _cod;

  Weather copyWith({
    Coord? coord,
    List<WeatherData>? weather,
    String? base,
    Main? main,
    int? visibility,
    Wind? wind,
    Clouds? clouds,
    int? dt,
    Sys? sys,
    int? timezone,
    int? id,
    String? name,
    int? cod,
  }) =>
      Weather(
        coord: coord ?? _coord,
        weather: weather ?? _weather,
        base: base ?? _base,
        main: main ?? _main,
        visibility: visibility ?? _visibility,
        wind: wind ?? _wind,
        clouds: clouds ?? _clouds,
        dt: dt ?? _dt,
        sys: sys ?? _sys,
        timezone: timezone ?? _timezone,
        id: id ?? _id,
        name: name ?? _name,
        cod: cod ?? _cod,
      );
  Coord? get coord => _coord;

  List<WeatherData>? get weather => _weather;
  String? get base => _base;
  Main? get main => _main;
  int? get visibility => _visibility;
  Wind? get wind => _wind;
  Clouds? get clouds => _clouds;
  int? get dt => _dt;
  Sys? get sys => _sys;
  int? get timezone => _timezone;
  int? get id => _id;
  String? get name => _name;
  int? get cod => _cod;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_coord != null) {
      map['coord'] = _coord?.toJson();
    }
    if (_weather != null) {
      map['weather'] = _weather?.map((v) => v.toJson()).toList();
    }
    map['base'] = _base;
    if (_main != null) {
      map['main'] = _main?.toJson();
    }
    map['visibility'] = _visibility;
    if (_wind != null) {
      map['wind'] = _wind?.toJson();
    }
    if (_clouds != null) {
      map['clouds'] = _clouds?.toJson();
    }
    map['dt'] = _dt;
    if (_sys != null) {
      map['sys'] = _sys?.toJson();
    }
    map['timezone'] = _timezone;
    map['id'] = _id;
    map['name'] = _name;
    map['cod'] = _cod;
    return map;
  }
}

class Sys {
  Sys({
    String? country,
    int? sunrise,
    int? sunset,
  }) {
    _country = country;
    _sunrise = sunrise;
    _sunset = sunset;
  }

  Sys.fromJson(dynamic json) {
    _country = json['country'];
    _sunrise = json['sunrise'];
    _sunset = json['sunset'];
  }
  String? _country;
  int? _sunrise;
  int? _sunset;

  Sys copyWith({
    String? country,
    int? sunrise,
    int? sunset,
  }) =>
      Sys(
        country: country ?? _country,
        sunrise: sunrise ?? _sunrise,
        sunset: sunset ?? _sunset,
      );
  String? get country => _country;
  int? get sunrise => _sunrise;
  int? get sunset => _sunset;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['country'] = _country;
    map['sunrise'] = _sunrise;
    map['sunset'] = _sunset;
    return map;
  }
}

class Clouds {
  Clouds({
    int? all,
  }) {
    _all = all;
  }

  Clouds.fromJson(dynamic json) {
    _all = json['all'];
  }
  int? _all;

  Clouds copyWith({
    int? all,
  }) =>
      Clouds(
        all: all ?? _all,
      );
  int? get all => _all;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['all'] = _all;
    return map;
  }
}

class Wind {
  Wind({
    double? speed,
    int? deg,
    double? gust,
  }) {
    _speed = speed;
    _deg = deg;
    _gust = gust;
  }

  Wind.fromJson(dynamic json) {
    _speed = json['speed'];
    _deg = json['deg'];
    _gust = json['gust'];
  }
  double? _speed;
  int? _deg;
  double? _gust;

  Wind copyWith({
    double? speed,
    int? deg,
    double? gust,
  }) =>
      Wind(
        speed: speed ?? _speed,
        deg: deg ?? _deg,
        gust: gust ?? _gust,
      );
  double? get speed => _speed;
  int? get deg => _deg;
  double? get gust => _gust;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['speed'] = _speed;
    map['deg'] = _deg;
    map['gust'] = _gust;
    return map;
  }
}

class Main {
  Main({
    double? temp,
    double? feelsLike,
    double? tempMin,
    double? tempMax,
    int? pressure,
    int? humidity,
    int? seaLevel,
    int? grndLevel,
  }) {
    _temp = temp;
    _feelsLike = feelsLike;
    _tempMin = tempMin;
    _tempMax = tempMax;
    _pressure = pressure;
    _humidity = humidity;
    _seaLevel = seaLevel;
    _grndLevel = grndLevel;
  }

  Main.fromJson(dynamic json) {
    _temp = json['temp'];
    _feelsLike = json['feels_like'];
    _tempMin = json['temp_min'];
    _tempMax = json['temp_max'];
    _pressure = json['pressure'];
    _humidity = json['humidity'];
    _seaLevel = json['sea_level'];
    _grndLevel = json['grnd_level'];
  }
  double? _temp;
  double? _feelsLike;
  double? _tempMin;
  double? _tempMax;
  int? _pressure;
  int? _humidity;
  int? _seaLevel;
  int? _grndLevel;

  Main copyWith({
    double? temp,
    double? feelsLike,
    double? tempMin,
    double? tempMax,
    int? pressure,
    int? humidity,
    int? seaLevel,
    int? grndLevel,
  }) =>
      Main(
        temp: temp ?? _temp,
        feelsLike: feelsLike ?? _feelsLike,
        tempMin: tempMin ?? _tempMin,
        tempMax: tempMax ?? _tempMax,
        pressure: pressure ?? _pressure,
        humidity: humidity ?? _humidity,
        seaLevel: seaLevel ?? _seaLevel,
        grndLevel: grndLevel ?? _grndLevel,
      );
  double? get temp => _temp;
  double? get feelsLike => _feelsLike;
  double? get tempMin => _tempMin;
  double? get tempMax => _tempMax;
  int? get pressure => _pressure;
  int? get humidity => _humidity;
  int? get seaLevel => _seaLevel;
  int? get grndLevel => _grndLevel;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['temp'] = _temp;
    map['feels_like'] = _feelsLike;
    map['temp_min'] = _tempMin;
    map['temp_max'] = _tempMax;
    map['pressure'] = _pressure;
    map['humidity'] = _humidity;
    map['sea_level'] = _seaLevel;
    map['grnd_level'] = _grndLevel;
    return map;
  }
}

class WeatherData {
  WeatherData({
    int? id,
    String? main,
    String? description,
    String? icon,
  }) {
    _id = id;
    _main = main;
    _description = description;
    _icon = icon;
  }

  WeatherData.fromJson(dynamic json) {
    _id = json['id'];
    _main = json['main'];
    _description = json['description'];
    _icon = json['icon'];
  }

  int? _id;
  String? _main;
  String? _description;
  String? _icon;

  WeatherData copyWith({
    int? id,
    String? main,
    String? description,
    String? icon,
  }) =>
      WeatherData(
        id: id ?? _id,
        main: main ?? _main,
        description: description ?? _description,
        icon: icon ?? _icon,
      );

  int? get id => _id;

  String? get main => _main;

  String? get description => _description;

  String? get icon => _icon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['main'] = _main;
    map['description'] = _description;
    map['icon'] = _icon;
    return map;
  }
}

class Coord {
  Coord({
    double? lon,
    double? lat,
  }) {
    _lon = lon;
    _lat = lat;
  }

  Coord.fromJson(dynamic json) {
    _lon = json['lon'];
    _lat = json['lat'];
  }
  double? _lon;
  double? _lat;

  Coord copyWith({
    double? lon,
    double? lat,
  }) =>
      Coord(
        lon: lon ?? _lon,
        lat: lat ?? _lat,
      );
  double? get lon => _lon;
  double? get lat => _lat;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lon'] = _lon;
    map['lat'] = _lat;
    return map;
  }
}