//import 'package:ethoslab/home.dart';
//import 'package:ethoslab/login_web/child_profile.dart';
//import 'package:ethoslab/login_web/login_page.dart';
import 'package:ethoslab/widgets/header.dart';
import 'package:flutter/material.dart';

import 'home.dart';
import 'login_web/child_profile.dart';
import 'login_web/login_page.dart';
//import 'package:landingpage/utils/themes.dart';

void main() => runApp(EthosApp());

//main app class
class EthosApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //in flutter screens and pages are called routes
      //navigator to go to a new route
      //Navigate to the second route using Navigator.push().
      //Return to the first route using Navigator.pop().
      debugShowCheckedModeBanner: false,
      title: 'Ethos Lab - Hogwarts meets Wakanda!',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: MainScreen(),
      routes: {
        '/': (context) => MyHomePage(), //The home screen contains log-in
        '/signup': (context) => SignUpScreen(), //Takes user to sign up screen 
        '/userdashboard': (context) => ChildProfilePage(), //user dashboard route 
      },
    );
  }
}

//Main home screen
class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      //   title: Text('Ethos'), //maybe change to Atlanthos
      //   centerTitle: true,
      //   //add logo and name on left, and can redirect to ethos lab home page
      // ),
     
      body: Center(
      //  body: SingleChildScrollView(
        child: Column(
          //children: <Widget>[HeaderWidget()],
          //mainAxisAlignment: MainAxisAlignment.center,
          
          children: <Widget>[
           HeaderWidget(),

            Container(
                width: 200.0,
                height: 200.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: new NetworkImage(
                          "https://static1.squarespace.com/static/5d1e0e9d2a98da000182d011/t/5e549279b2919a79f2a866d4/1595529564053/?format=1500w"
                         //change image to app logo
                         )))),
            
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'youth space reimagined',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ),
            //more details on Atlanthos
            
            //add login in page below
            //add button to go to sign up page
          ],
        ),
      ),
    );
  }
}
// //stateless as info here does not change
// class AboutAtlanthos extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
// }
//}
