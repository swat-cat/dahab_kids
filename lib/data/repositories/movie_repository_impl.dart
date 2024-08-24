import 'package:dahab_kids/domain/dto/movie_details.dart';
import 'package:dahab_kids/domain/dto/movie_search.dart';
import 'package:dahab_kids/domain/models/resource.dart';
import 'package:dahab_kids/domain/repositories/movie_reposoitory.dart';

import '../rest_client.dart';

class MovieRepositoryImpl extends MovieRepository{
  final RestClient restClient;

  MovieRepositoryImpl(this.restClient);

  @override
  Future<Resource<MovieDetails>> getMovieDetails(String id) {
    // TODO: implement getMovieDetails
    throw UnimplementedError();
  }

  @override
  Future<Resource<MovieSearch>> searchMovies(String query)  async {
    Resource<MovieSearch> result = await restClient.get<MovieSearch>(
      "https://www.omdbapi.com/",
      MovieSearch.fromJson,
      queryParams: {
        "s": query,
        "apikey": "33d3ea25"
      }
    );
    return result;
  }

}