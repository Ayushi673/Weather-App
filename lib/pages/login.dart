import 'homepage.dart';
import 'package:flutter/material.dart';
import 'signup.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  static String id= 'login_page';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _auth=FirebaseAuth.instance;
  String email;
  String password;
  final _emailController= TextEditingController();
  final _passwordController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:
      Padding(
        padding: EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 80),
            Column(
              children: <Widget>[
                Image(image: AssetImage('images/weathericon.png'),
                ),
                SizedBox(height:16),
                Text('WEATHER',
                  style: TextStyle(
                    fontSize: 20,
                  ),),
              ],
            ),
            SizedBox(height:60),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: TextField(
                onChanged: (value){
                  email=value;
                },
                controller: _emailController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFDEF2F1),
                  labelText: '\tEmail',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.only(left:10,right:10),
              child: TextField(
                onChanged: (value){
                  password=value;
                },
                controller: _passwordController,
                decoration: InputDecoration(
                  filled: true, //sets text-field box with a darker color
                  fillColor: Color(0xFFDEF2F1),
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                obscureText: true,//replaces password with bullets as we enter it
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(              //for clearing
                      padding: EdgeInsets.only(left:10, right: 10),
                      onPressed: (){
                        _emailController.clear();
                        _passwordController.clear();
                      },
                      child: Text('CANCEL')),
                  RaisedButton(
                    color: Color(0xFF8AC7C0),//for continuing
                    onPressed: () async{
                      try{
                        final user= await _auth.signInWithEmailAndPassword(email: email, password: password);
                        if(user!=null)
                          Navigator.pushNamed(context, HomePage.id);
                      }catch(e){
                        print(e);
                      }
                    },
                    child: Text('LOGIN'),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
              child: Column(
                children: <Widget>[
                  Text('Don\'t have an account?'),
                  RaisedButton(
                    color: Color(0xFF8AC7C0),
                    onPressed: (){
                      Navigator.pushNamed(context, SignUpPage.id);
                    },
                    child: Text('SIGN UP'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}
