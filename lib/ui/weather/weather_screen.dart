import 'package:dahab_kids/domain/models/resource.dart';
import 'package:dahab_kids/extrensions/string_extensions.dart';
import 'package:dahab_kids/ui/weather/weather_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WeatherScreen extends StatelessWidget {
  WeatherScreen({Key? key}) : super(key: key);

  TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather"),
        centerTitle: true,
      ),
      body: Consumer<WeatherViewmodel>(
        builder: (context, viewModel, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SearchView(
                  controller: cityController,
                  callback: () async {
                    await context
                        .read<WeatherViewmodel>()
                        .fetchWeather(cityController.text);
                    if (viewModel.weather.status != Status.success &&
                        !viewModel.isLoading) {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title:
                                    Text(viewModel.weather.message ?? "Error"),
                              ));
                    }
                  },
                  searchLabel: "Enter City Name",
                  buttonLabel: "Get Weather",
                ),
                if (viewModel.isLoading)
                  const Padding(
                    padding: EdgeInsets.only(top: 32.0),
                    child: CircularProgressIndicator(),
                  ),
                if (viewModel.weather.status == Status.success)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        viewModel.weather.data?.name.toString().toTitleCase() ??
                            "",
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Image.network(
                          "https://openweathermap.org/img/wn/${viewModel.weather.data?.weather?.first.icon}@2x.png"),
                      Text(
                        viewModel.weather.data?.weather?.first.description
                                .toString()
                                .toTitleCase() ??
                            "",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        "${viewModel.weather.data?.main?.temp.toString()}\u00B0C" ??
                            "",
                        style: const TextStyle(
                            fontSize: 48, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Humidity:"),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            "${viewModel.weather.data?.main?.humidity.toString() ?? ""}%",
                            style: Theme.of(context)
                                .typography
                                .englishLike
                                .titleMedium,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Pressure:"),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            "${viewModel.weather.data?.main?.pressure.toString() ?? ""}%",
                            style: Theme.of(context)
                                .typography
                                .englishLike
                                .titleMedium,
                          ),
                        ],
                      )
                    ],
                  )
              ],
            ),
          );
        },
      ),
    );
  }
}

class SearchView extends StatelessWidget {
  const SearchView(
      {super.key,
      required this.controller,
      re,
      required this.searchLabel,
      required this.buttonLabel,
      required this.callback});

  final TextEditingController controller;
  final String searchLabel;
  final String buttonLabel;
  final Function() callback;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 8.0, top: 8),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                  label: Text(searchLabel),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(width: 1.0))),
              onSubmitted: (value) {
                // Trigger the API call when the user submits a city name
                callback();
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 24.0),
          child: ElevatedButton(onPressed: callback, child: Text(buttonLabel)),
        )
      ],
    );
  }
}
