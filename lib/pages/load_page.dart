import 'package:flutter/material.dart';
import 'package:flutterappp/pages/location_page.dart';
import 'package:flutterappp/service/location.dart';
import 'package:flutterappp/service/networking.dart';
import 'package:flutterappp/service/confidencial.dart';

class LoadScreen extends StatefulWidget {
  static String id= 'load_page';
  @override
  _LoadScreenState createState() => _LoadScreenState();
}

class _LoadScreenState extends State<LoadScreen> {

  double latitude;
  double longitude;

  void getLocationData() async{
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
    latitude=location.latitude;
    longitude=location.longitude;
    Networking networkHelper=Networking('https://api.openweathermap.org/data/2.5/onecall?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');
    var weatherData= await networkHelper.getData();
    Navigator.push(context, MaterialPageRoute(
        builder:(context){
          return LocationPage(locationWeather: weatherData,);
        }));
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image:AssetImage('images/weatherr1.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.9), BlendMode.dstATop),
            )
        ),
        child: Center(
          child: CircularProgressIndicator(
            strokeWidth: 5,
            backgroundColor: Colors.purple,
            valueColor:new AlwaysStoppedAnimation<Color>(Colors.white70),
          ),
        ),
      ),
    );
  }
}
