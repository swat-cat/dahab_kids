import 'package:dahab_kids/data/repositories/movie_repository_impl.dart';
import 'package:dahab_kids/ui/movie_search/movie_search_screen.dart';
import 'package:dahab_kids/ui/movie_search/movie_search_viewmodel.dart';
import 'package:dahab_kids/ui/weather/weather_screen.dart';
import 'package:dahab_kids/ui/weather/weather_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/repositories/weather_repository_impl.dart';
import '../data/rest_client.dart';

class HomeRouter extends StatelessWidget {
  const HomeRouter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Dahab app"),
          elevation: 16,
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.add_alert_sharp))
          ],
        ),
        body: SizedBox.expand(
            child: Padding(
          padding: const EdgeInsets.all(32),
          child: Center(
            child: Row(
              children: [
                Expanded(
                    child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChangeNotifierProvider(
                                  create: (_) => WeatherViewmodel(
                                      WeatherRepositoryImpl(RestClient(
                                          "https://api.openweathermap.org/data/2.5"))),
                                  child: WeatherScreen(),
                                )));
                  },
                  child: const Card(
                    child:
                        SizedBox.expand(child: Center(child: Text("Weather"))),
                  ),
                )),
                const SizedBox(width: 16),
                Expanded(
                    child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChangeNotifierProvider(
                                  create: (_) => MovieSearchViewmodel(
                                      MovieRepositoryImpl(RestClient(""))),
                                  child: const MovieSearchScreen(),
                                )));
                  },
                  child: const Card(
                    child:
                        SizedBox.expand(child: Center(child: Text("Movies"))),
                  ),
                )),
              ],
            ),
          ),
        )));
  }
}
