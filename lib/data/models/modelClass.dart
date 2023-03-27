class WeatherData {
  String? name;
  String? tempC;
  String? condition;
  String? windyKph;
  String? humidity;
  String? cloud;

  WeatherData(
      {this.name,
        this.tempC,
        this.condition,
        this.windyKph,
        this.humidity,
        this.cloud
      });

  factory WeatherData.fromJson(Map<String, dynamic> json) {

    return WeatherData( name : json['location']['name'].toString(),
        tempC : json['current']['temp_c'].toString(),
        condition : json['current']['condition']['text'].toString(),
        windyKph : json['current']['windy_kph'].toString(),
        humidity : json['current']['humidity'].toString(),
        cloud : json['current']['cloud'].toString());

  }

}