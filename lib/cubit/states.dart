abstract class WeatherState{}

class WeatherInitState extends WeatherState{}
class WeatherLoadingState extends WeatherState{}
class WeatherSuccessState extends WeatherState{}
class WeatherErrorState extends WeatherState{}