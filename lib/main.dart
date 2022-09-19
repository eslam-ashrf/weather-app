import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/cubit.dart';
import 'package:weather/servers/weather-server.dart';
import 'screens//home.dart';

void main() {
  runApp( BlocProvider( create: (BuildContext context)=>WeatherCubit(),
  child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch:Colors.orange
      ),
        debugShowCheckedModeBanner: false,
        home: HomeLayout()
     );
  }
}

