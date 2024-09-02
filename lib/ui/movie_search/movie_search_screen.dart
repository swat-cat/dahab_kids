import 'package:dahab_kids/data/repositories/movie_repository_impl.dart';
import 'package:dahab_kids/data/rest_client.dart';
import 'package:dahab_kids/domain/dto/movie_search.dart';
import 'package:dahab_kids/ui/movie_search/movie_details/movie_details_screen.dart';
import 'package:dahab_kids/ui/movie_search/movie_search_viewmodel.dart';
import 'package:dahab_kids/ui/weather/weather_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import 'movie_details/movie_details_viewmodel.dart';

class MovieSearchScreen extends StatelessWidget {
  MovieSearchScreen({Key? key}) : super(key: key);

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieSearchViewmodel>(builder: (context, viewModel, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Moivies"),
        ),
        body: Column(
          children: [
            SearchView(
                controller: _controller,
                searchLabel: "Search Movie",
                buttonLabel: "Search",
                callback: () {
                  viewModel.fetchMovies(_controller.text);
                }),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 24),
                child: AlignedGridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                  itemCount: viewModel.result.data?.search?.length,
                  itemBuilder: (context, index) {
                    final movieItem = viewModel.result.data?.search?[index];
                    return movieItem != null
                        ? MovieCard(
                            movie: movieItem,
                          )
                        : const SizedBox();
                  },
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}

class MovieCard extends StatelessWidget {
  final Search movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) => ChangeNotifierProvider(
              create: (context) => MovieDetailsViewmodel(
                  MovieRepositoryImpl(RestClient("")), movie.imdbID ?? ""),
              child: MovieDetailsScreen(movie: movie),
            ),
          ),
        );
      },
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                child: Hero(
                  tag: movie.imdbID ?? "",
                  child: Image.network(
                    movie.poster ?? "",
                    fit: BoxFit.scaleDown,
                  ),
                )),
            Text(
              movie.title ?? "",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              movie.year ?? "",
              style: const TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
