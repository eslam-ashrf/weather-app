import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/cubit.dart';
import 'package:weather/cubit/states.dart';
import 'package:weather/screens/search.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = WeatherCubit.get(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('weather'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Search()));
                },
                icon: Icon(Icons.search)),
          ],
        ),
        body:
            BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
          if (state is WeatherInitState) {
            return initialState();
          } else if (cubit.weatherModel == null) {
            return Center(
              child: Text(
                "the city name is wrong",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
              ),
            );
          } else if (state is WeatherLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherErrorState) {
            return Center(
              child: Text(
                'sorry!! Check your internet conection and try again ',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
            );
          } else if (state is WeatherSuccessState) {
            return successState(cubit);
          } else {
            return initialState();
          }
        }));
  }
}

Widget successState(var cubit) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Column(
        children: [
          Text(
            cubit.cityName!,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(cubit.weatherModel!.date!)
        ],
      ),
      SizedBox(
        height: 60,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Spacer(),
          Image(
            image: NetworkImage("http:${cubit.weatherModel!.icon!}"),
          ),
          Spacer(),
          Text(
            "${cubit.weatherModel!.temp!.toInt()}",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          Column(
            children: [
              Text('max ${cubit.weatherModel!.maxTemp!.toInt()}'),
              Text('min ${cubit.weatherModel!.minTemp!.toInt()}')
            ],
          ),
          Spacer(),
        ],
      ),
      SizedBox(
        height: 60,
      ),
      Text(
        cubit.weatherModel!.condition!,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      )
    ],
  );
}

Widget initialState() {
  return Center(
    child: Text(
      "Start searching now",
      style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
    ),
  );
}
