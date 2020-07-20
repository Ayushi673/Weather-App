import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  static String id= 'home_page';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _auth=FirebaseAuth.instance;
  FirebaseUser loggedInUser;

  @override
  void initState() {
    super.initState();
    getUser();
  }
  void getUser() async{
    final user = await _auth.currentUser();
    try{
      if(user!=null){
        loggedInUser= user;
        print(loggedInUser.email);
      }
    }
    catch(e){
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal.shade100,
      child: RaisedButton(
        onPressed: (){},
        child: Text('LOG OUT'),
      ),
    );
  }
}
