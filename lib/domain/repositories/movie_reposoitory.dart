import 'package:dahab_kids/domain/dto/movie_details.dart';

import '../dto/movie_search.dart';
import '../models/resource.dart';

abstract class MovieRepository {
  Future<Resource<MovieSearch>> searchMovies(String query);
  Future<Resource<MovieDetails>> getMovieDetails(String id);
}
