import 'package:dahab_kids/generated/json/base/json_convert_content.dart';
import 'package:dahab_kids/domain/dto/movie_search.dart';

MovieSearch $MovieSearchEntityFromJson(Map<String, dynamic> json) {
  final MovieSearch movieSearchEntity = MovieSearch();
  final List<Movie>? search = (json['Search'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<Movie>(e) as Movie)
      .toList();
  if (search != null) {
    movieSearchEntity.search = search;
  }
  final String? totalResults = jsonConvert.convert<String>(
      json['totalResults']);
  if (totalResults != null) {
    movieSearchEntity.totalResults = totalResults;
  }
  final String? response = jsonConvert.convert<String>(json['Response']);
  if (response != null) {
    movieSearchEntity.response = response;
  }
  return movieSearchEntity;
}

Map<String, dynamic> $MovieSearchEntityToJson(MovieSearch entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['Search'] = entity.search?.map((v) => v.toJson()).toList();
  data['totalResults'] = entity.totalResults;
  data['Response'] = entity.response;
  return data;
}

extension MovieSearchEntityExtension on MovieSearch {
  MovieSearch copyWith({
    List<Movie>? search,
    String? totalResults,
    String? response,
  }) {
    return MovieSearch()
      ..search = search ?? this.search
      ..totalResults = totalResults ?? this.totalResults
      ..response = response ?? this.response;
  }
}

Movie $MovieSearchSearchFromJson(Map<String, dynamic> json) {
  final Movie movieSearchSearch = Movie();
  final String? title = jsonConvert.convert<String>(json['Title']);
  if (title != null) {
    movieSearchSearch.title = title;
  }
  final String? year = jsonConvert.convert<String>(json['Year']);
  if (year != null) {
    movieSearchSearch.year = year;
  }
  final String? imdbID = jsonConvert.convert<String>(json['imdbID']);
  if (imdbID != null) {
    movieSearchSearch.imdbID = imdbID;
  }
  final String? type = jsonConvert.convert<String>(json['Type']);
  if (type != null) {
    movieSearchSearch.type = type;
  }
  final String? poster = jsonConvert.convert<String>(json['Poster']);
  if (poster != null) {
    movieSearchSearch.poster = poster;
  }
  return movieSearchSearch;
}

Map<String, dynamic> $MovieSearchSearchToJson(Movie entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['Title'] = entity.title;
  data['Year'] = entity.year;
  data['imdbID'] = entity.imdbID;
  data['Type'] = entity.type;
  data['Poster'] = entity.poster;
  return data;
}

extension MovieSearchSearchExtension on Movie {
  Movie copyWith({
    String? title,
    String? year,
    String? imdbID,
    String? type,
    String? poster,
  }) {
    return Movie()
      ..title = title ?? this.title
      ..year = year ?? this.year
      ..imdbID = imdbID ?? this.imdbID
      ..type = type ?? this.type
      ..poster = poster ?? this.poster;
  }
}