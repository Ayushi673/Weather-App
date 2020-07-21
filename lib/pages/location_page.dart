import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappp/pages/login.dart';

class LocationPage extends StatefulWidget {
  LocationPage({this.locationWeather});
  final locationWeather;
  static String id= 'location_page';
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {

  String getCurrentDate(int a){
    String finalDate;
    var date = new DateTime.now().toString();
    var dateParse = DateTime.parse(date);
    var formattedDate = "${dateParse.day+a}-${dateParse.month}-${dateParse.year}";
    finalDate = formattedDate.toString() ;
    print(date);
    print(dateParse.day);
    print(formattedDate);
    return finalDate;
  }

  @override
  void initState() {
    super.initState();
    print(widget.locationWeather);
  }
  @override
  Widget build(BuildContext context) {
    final generatedList = List.generate(7, (index) =>
        (widget.locationWeather['daily'][index]['temp']['day']).toInt());
    final generatedList1 = List.generate(7, (index) =>
    widget.locationWeather['daily'][index]['weather'][0]['main']);
    final generatedList2 = List.generate(7, (index) =>
        getCurrentDate(index));
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  image:AssetImage('images/weatherr1.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.9), BlendMode.dstATop),
                )
            ),
          ),
          Padding(padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.fromLTRB(5,25,5,20),
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.purple.shade50.withOpacity(0.5),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text('TODAY:', style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),),
                          Text((widget.locationWeather['daily'][0]['temp']['day']).toString()+'˚C'),
                          Text('Weather: '+widget.locationWeather['daily'][0]['weather'][0]['main']),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Text('WEEKLY WEATHER FORECAST:',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: generatedList.length,
                    itemBuilder: (context, index) {
                      return Opacity(
                        opacity: 0.7,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text('${generatedList2[index]}'),
                                SizedBox(width: 30),
                                Text('${generatedList[index]}˚C'),
                                SizedBox(width: 30),
                                Text('${generatedList1[index]}'),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(padding: EdgeInsets.all(8),
                  child: RaisedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, LoginPage.id);
                    },
                    child: Text('LOG OUT'),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}



