import 'package:dahab_kids/domain/dto/movie_details.dart';
import 'package:flutter/cupertino.dart';

import '../../../domain/models/resource.dart';
import '../../../domain/repositories/movie_reposoitory.dart';

class MovieDetailsViewmodel extends ChangeNotifier {
  late final MovieRepository repository;
  final String id;
  Resource<MovieDetails> result = Resource.initial();
  bool isLoading = false;

  MovieDetailsViewmodel(this.repository, this.id) {
    fetchMovies(id);
  }

  Future fetchMovies(String id) async {
    isLoading = true;
    notifyListeners();
    result = await repository.getMovieDetails(id);
    isLoading = false;
    notifyListeners();
  }
}
