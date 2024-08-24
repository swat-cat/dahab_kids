import 'package:dahab_kids/generated/json/base/json_field.dart';
import 'package:dahab_kids/generated/json/movie_search_entity.g.dart';
import 'dart:convert';
export 'package:dahab_kids/generated/json/movie_search_entity.g.dart';

@JsonSerializable()
class MovieSearch {
	@JSONField(name: "Search")
	List<Movie>? search;
	String? totalResults;
	@JSONField(name: "Response")
	String? response;

	MovieSearch();

	factory MovieSearch.fromJson(Map<String, dynamic> json) => $MovieSearchEntityFromJson(json);

	Map<String, dynamic> toJson() => $MovieSearchEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class Movie {
	@JSONField(name: "Title")
	String? title;
	@JSONField(name: "Year")
	String? year;
	String? imdbID;
	@JSONField(name: "Type")
	String? type;
	@JSONField(name: "Poster")
	String? poster;

	Movie();

	factory Movie.fromJson(Map<String, dynamic> json) => $MovieSearchSearchFromJson(json);

	Map<String, dynamic> toJson() => $MovieSearchSearchToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}