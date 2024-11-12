import 'package:flutter/material.dart';
import '../services/weather_service.dart';
import '../models/weather_model.dart';

class WeatherProvider with ChangeNotifier {
  final WeatherService _weatherService = WeatherService();
  WeatherModel? _weatherData;
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  WeatherModel? get weatherData => _weatherData;

  Future<void> loadWeather(String city) async {
    _isLoading = true;
    notifyListeners();

    try {
      final data = await _weatherService.fetchWeather(city);
      _weatherData = data != null ? WeatherModel.fromJson(data) : null;
    } catch (e) {
      _weatherData = null;
      print("Erro ao carregar dados do tempo: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
