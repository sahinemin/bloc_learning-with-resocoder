import 'package:bloc_learning/features/weather/data/weather_repository.dart';
import 'package:bloc_learning/features/weather/presentation/cubit/weather_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/weather/presentation/pages/weather_search_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: BlocProvider(
        create: (context) => WeatherCubit(const FakeWeatherRepository()),
        child: const WeatherSearchPage(),
      ),
    );
  }
}
