import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/cubit.dart';
import 'package:weather/cubit/states.dart';
import 'package:weather/models/weather-model.dart';
import '../servers/weather-server.dart';
var cityName=TextEditingController();
class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit=WeatherCubit.get(context);
    return BlocConsumer<WeatherCubit,WeatherState>(
      listener:(context,state){},
      builder: (context,state){
          return Scaffold(
            appBar: AppBar(
              title: Text('Search a City'),
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  controller:cityName ,
                  onFieldSubmitted: (data)async{
                    cubit.cityName=data;
                    cubit.getWeather(cityName: cubit.cityName!);
                    Navigator.pop(context);
                  },
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 30,horizontal: 10 ),
                      border:OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      label:Text('Enter city name'),
                      suffixIcon:IconButton(onPressed: ()async{
                        cubit.cityName=cityName.text;
                      cubit.getWeather(cityName: cubit.cityName!);
                      Navigator.pop(context);},icon: Icon(Icons.search),)
                  ),
                ),
              ),
            ),
          );
        },
    );
  }
}
