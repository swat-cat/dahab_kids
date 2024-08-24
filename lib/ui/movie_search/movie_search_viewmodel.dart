import 'package:dahab_kids/domain/models/resource.dart';
import 'package:dahab_kids/domain/repositories/movie_reposoitory.dart';

import '../../domain/dto/movie_search.dart';

class MovieSearchViewmodel {
  final MovieRepository repository;
  Resource<MovieSearch> result = Resource.initial();
  bool isLoading = false;

  MovieSearchViewmodel(this.repository);

  Future fetchMovies(String query) async {
    if (query.isEmpty) {
      result = Resource.initial();
    }
    if (query.length >= 3) {
      isLoading = true;
      result = await repository.searchMovies(query);
      isLoading = false;
    }
  }
}
