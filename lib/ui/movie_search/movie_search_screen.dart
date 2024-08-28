import 'package:dahab_kids/ui/movie_search/movie_search_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MovieSearchScreen extends StatelessWidget {
  const MovieSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieSearchViewmodel>(builder: (context, viewModel, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Moivies"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [],
          ),
        ),
      );
    });
  }
}
