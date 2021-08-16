import 'package:flutter/material.dart';
import 'package:flutterbootcamp/WebServices/WeatherApp/model/ForecastData.dart';
import 'package:flutterbootcamp/WebServices/WeatherApp/model/WeatherData.dart';
import 'package:flutterbootcamp/WebServices/WeatherApp/widgets/Weather.dart';
import 'package:flutterbootcamp/WebServices/WeatherApp/widgets/WeatherItem.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:location/location.dart';
import 'package:flutter/services.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoading = false;
  WeatherData? weatherData;
  ForecastData? forecastData;

  Location _location = new Location();
  String? error;

  @override
  void initState() {
    super.initState();

    loadWeather();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter WeatherApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          backgroundColor: Colors.blueGrey,
          appBar: AppBar(
            title: Text('Flutter WeatherApp'),
          ),
          body: Center(
              child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: weatherData != null
                      ? Weather(weather: weatherData)
                      : Container(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: isLoading
                      ? CircularProgressIndicator(
                    strokeWidth: 2.0,
                    valueColor: new AlwaysStoppedAnimation(Colors.white),
                  )
                      : IconButton(
                    icon: new Icon(Icons.refresh),
                    tooltip: 'Refresh',
                    onPressed: loadWeather,
                    color: Colors.white,
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 200.0,
                      child: forecastData != null
                          ? ListView.builder(
                          itemCount: forecastData?.list.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => WeatherItem(
                              weather: forecastData?.list.elementAt(index)))
                          : Container(),
                    ),
                  ),
                ),
              ]))),
    );
  }

  loadWeather() async {
    setState(() {
      isLoading = true;
    });

    var location;
    // var location;

    try {
      location = await _location.getLocation();
      error = null;
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        error = 'Permission denied';
      } else if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        error =
        'Permission denied - please ask the user to enable it from the app settings';
      }

      location = null;
    }
    // print(location == null);

    if (location != null) {

      final lat = location.latitude;
      final lon = location.longitude;
      // print(lat);
      // print(lon);
      final Id = 'c623bd43249251f3ed03cb8f414a9559';
      final weatherResponse = await http.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?APPID=$Id&lat=${lat.toString()}&lon=${lon.toString()}'));
      final forecastResponse = await http.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?APPID=$Id&lat=${lat.toString()}&lon=${lon.toString()}'));
       print(weatherResponse.body);
      if (weatherResponse.statusCode == 200 &&
          forecastResponse.statusCode == 200) {
        return setState(() {
          weatherData =
          new WeatherData.fromJson(jsonDecode(weatherResponse.body));
          forecastData =
          new ForecastData.fromJson(jsonDecode(forecastResponse.body));
          isLoading = false;
        });
      }
    }

    setState(() {
      isLoading = false;
    });
  }
}