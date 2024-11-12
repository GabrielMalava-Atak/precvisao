import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Previsão do Tempo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Digite a cidade'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                weatherProvider.loadWeather(_controller.text);
              },
              child: Text('Consultar'),
            ),
            SizedBox(height: 20),
            
            if (weatherProvider.isLoading)
              CircularProgressIndicator()
            else if (weatherProvider.weatherData != null)
              Column(
                children: [
                  Text('Cidade: ${weatherProvider.weatherData!.cityName}'),
                  Text('Temperatura: ${weatherProvider.weatherData!.temperature}°C'),
                  Text('Condição: ${weatherProvider.weatherData!.description}'),
                ],
              )
            else
              Text('Nenhuma informação disponível'),
          ],
        ),
      ),
    );
  }
}
