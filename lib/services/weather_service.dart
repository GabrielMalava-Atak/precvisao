import 'dart:convert';
import 'package:flutter/services.dart';

class WeatherService {
  Future<List<dynamic>> fetchWeatherData() async {
    // Carrega o conteúdo do arquivo JSON
    final String response = await rootBundle.loadString('lib/assets/weather_data.json');
    final List<dynamic> data = json.decode(response); // Converte para uma lista de mapas
    return data;
  }

  Future<Map<String, dynamic>?> fetchWeather(String city) async {
    // Carrega todos os dados
    final List<dynamic> data = await fetchWeatherData();

    // Procura pela cidade específica
    final cityData = data.firstWhere(
      (element) => element['name'].toString().toLowerCase() == city.toLowerCase(),
      orElse: () => null,
    );

    return cityData != null ? Map<String, dynamic>.from(cityData) : null;
  }
}
