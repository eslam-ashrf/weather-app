import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/states.dart';
import 'package:weather/models/weather-model.dart';
import 'package:weather/servers/weather-server.dart';

class WeatherCubit extends Cubit<WeatherState>{
  WeatherCubit(): super(WeatherInitState());
  static WeatherCubit get(context) => BlocProvider.of(context);
  String? cityName;
  WeatherServes weatherServes=WeatherServes();
  WeatherModel? weatherModel;
  void getWeather({required String cityName})async{
    emit(WeatherLoadingState());
      try {
       weatherModel= await weatherServes.getWeather(cityName: cityName);
        emit(WeatherSuccessState());
      } on Exception catch (e) {
        emit(WeatherErrorState());
      }

  }


}