import 'package:flutter/material.dart';
import 'package:weather_app1/domain/repositories/apiCall.dart';
import 'package:weather_app1/data/models/modelClass.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  final _weatherService = WeatherServices();

  @override
  void initState()
  {
    _weatherService.getWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: FutureBuilder(
          //future that will be passed as an argument
          future: _weatherService.getWeather(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              WeatherData? _weatherData = snapshot.data;
              if (_weatherData != null) {
                return appScreen(_weatherData);
              }
              else {
                return const Text("Something went wrong");
              }
            }
            else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
  Widget appScreen(WeatherData _weatherData)
  {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(_weatherData.name.toString(),style: const TextStyle(color: Colors.white, fontSize: 30,fontWeight: FontWeight.bold),),
      ),

      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                const SizedBox(height: 30,),

                const Text('Todays Report',style: TextStyle(color: Colors.white,fontSize: 30),
                  //textAlign: TextAlign.right,
                ),

                const SizedBox(height: 80,),

                Image.asset('assets/cloudy_sun.png',
                  height: 200,
                  width: 300,
                  alignment: Alignment.center,
                ),

                const SizedBox(height: 50,),

                Text(_weatherData.condition.toString(),style: const TextStyle(color: Colors.grey,fontSize: 23,fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 10,),

                Text('${_weatherData.tempC.toString().substring(0,2)}\u2103',style: const TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.bold)),

                const SizedBox(height: 80,),

                Row(
                  children: [
                    Column(
                      children: [
                        Image.asset('assets/humidity.png',
                          height: 100,
                          width: 80,
                        ),
                        const SizedBox(height: 15,),

                        Text('${_weatherData.humidity.toString()}%',style: TextStyle(color: Colors.white,fontSize: 12)),
                        const Text('Humidity',style: TextStyle(color: Colors.white,fontSize: 15))
                      ],
                    ),
                    const SizedBox(width: 50,),

                    Column(
                      children: [
                        Image.asset('assets/sun.png',
                          height: 100,
                          width: 80,
                        ),
                        const SizedBox(height: 15,),
                        //cloudy nature
                        Text('${_weatherData.cloud.toString()}%',style: TextStyle(color: Colors.white,fontSize: 12)),
                        const Text('Clouds',style: TextStyle(color: Colors.white,fontSize: 15))
                      ],
                    ),
                    const SizedBox(width: 50,),
                    Column(
                      children: [
                        Image.asset('assets/windyspeed.png',
                          height: 100,
                          width: 80,
                        ),

                        const SizedBox(height: 15,),

                        Text('${_weatherData.windyKph.toString()}%',style: const TextStyle(color: Colors.white,fontSize: 12),),
                        const Text('Wind Speed',style: TextStyle(color: Colors.white, fontSize: 15))
                      ],
                    ),

                  ],
                )
              ],

            ),
          )
        ],

      ),
    );
  }
}