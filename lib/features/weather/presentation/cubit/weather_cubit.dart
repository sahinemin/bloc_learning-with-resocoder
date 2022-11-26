import 'package:bloc/bloc.dart';
import 'package:bloc_learning/features/weather/data/weather_repository.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import '../../data/models/weather.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository _weatherRepository;
  WeatherCubit(this._weatherRepository) : super(const WeatherInitial());

  Future<void> getWeather(String cityName) async {
    try {
      emit(const WeatherLoading());
      final weather = await _weatherRepository.fetchWeather(cityName);
      emit(WeatherLoaded(weather));
    } on NetworkException {
      emit(const WeatherError("Network exception"));
    }
  }
}
