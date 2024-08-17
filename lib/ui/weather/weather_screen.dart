import 'package:dahab_kids/domain/models/resource.dart';
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
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 24.0, right: 8.0),
                        child: TextField(
                          controller: cityController,
                          decoration:
                              InputDecoration(labelText: 'Enter City Name'),
                          onSubmitted: (value) {
                            // Trigger the API call when the user submits a city name
                            context
                                .read<WeatherViewmodel>()
                                .fetchWeather(value);
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 24.0),
                      child: ElevatedButton(
                          onPressed: () async {
                            await context
                                .read<WeatherViewmodel>()
                                .fetchWeather(cityController.text);
                            if (viewModel.weather.status != Status.success &&
                                !viewModel.isLoading) {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: Text(viewModel.weather.message ??
                                            "Error"),
                                      ));
                            }
                          },
                          child: Text("Get Weather")),
                    )
                  ],
                ),
                if (viewModel.isLoading)
                  const Padding(
                    padding: EdgeInsets.only(top: 32.0),
                    child: CircularProgressIndicator(),
                  ),
                if (viewModel.weather.status == Status.success)
                  Text(viewModel.weather.data?.main?.temp?.toString() ?? "")
              ],
            ),
          );
        },
      ),
    );
  }
}
