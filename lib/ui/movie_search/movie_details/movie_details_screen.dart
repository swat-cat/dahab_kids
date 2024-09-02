import 'package:dahab_kids/domain/dto/movie_search.dart';
import 'package:dahab_kids/ui/movie_search/movie_details/movie_details_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MovieDetailsScreen extends StatelessWidget {
  final Search movie;

  const MovieDetailsScreen({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title ?? 'Movie Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: movie.imdbID ?? "", // Same tag as in the MovieCard
              child: Image.network(
                movie.poster ?? 'https://via.placeholder.com/300',
                fit: BoxFit.fitWidth,
                width: MediaQuery.of(context).size.width / 4,
              ),
            ),
            Consumer<MovieDetailsViewmodel>(
              builder: (context, provider, child) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title ?? 'Unknown',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Year: ${movie.year ?? 'N/A'}',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Type: ${movie.type ?? 'N/A'}',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Gengre: ${provider.result.data?.genre ?? 'N/A'}',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Director: ${provider.result.data?.director ?? 'N/A'}',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Plot: ${provider.result.data?.plot ?? 'N/A'}',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 16),
                      // You can add more movie details here
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
