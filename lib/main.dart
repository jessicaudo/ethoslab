//import 'package:ethoslab/login_web/child_profile.dart';
//import 'package:ethoslab/home.dart';
//import 'package:ethoslab/login_web/child_profile.dart';
//import 'paackage:ethoslab/login_web/login_page.dart';
//import 'package:ethoslab/landing_page.dart';
import 'package:ethoslab/login_web/public_events.dart';
import 'package:ethoslab/login_web/support_page.dart';
import 'package:ethoslab/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_scrollbar/flutter_web_scrollbar.dart';
import 'home.dart';
import 'login_web/child_profile.dart';
import 'login_web/login_page.dart';
import 'package:sticky_headers/sticky_headers.dart';
//import 'package:landingpage/utils/themes.dart';
void main() => runApp(EthosApp());
//main app class

class EthosApp extends StatelessWidget { //now stateful 'coz scrollbar
 
  // LandingPage({Key key}) : super(key: key);

  // @override
  // State<StatefulWidget> createState() {
  //   return _LandingPageState();
  // }

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
    //in flutter screens and pages are called routes
    //navigator to go to a new route
    //Navigate to the second route using Navigator.push().
    //Return to the first route using Navigator.pop().
    debugShowCheckedModeBanner: false,
    title: 'Ethos Lab - Hogwarts meets Wakanda!',
    theme: ThemeData(primarySwatch: Colors.teal),
    home: MainScreen(), //becomes the route named '/'
    routes: <String, WidgetBuilder> {
        //'/homepage': (context) => LandingPage(), //The home screen contains log-in
        '/homepage': (context) => MyHomePage(), //The home screen contains log-in
        '/signup': (context) => SignUpScreen(), //Takes user to sign up screen 
        '/userdashboard': (context) => ChildProfilePage(), //user dashboard route 
        '/events' : (context) => PublicEventsPage(), //Public calendar page of upcoming events
        '/support' : (context) => SupportPage(), //Find ways to partner with and support Ethos Lab
        },
    );

  }
}

class MainScreen extends StatefulWidget {  
  MainScreen({Key key}) : super(key: key);  
  @override  
  State<StatefulWidget> createState() {  
    return _MainScreenState();  
  }  
}  

//edited from here to add scrollbar
//Main home screen
class _MainScreenState extends State<MainScreen> {
  ScrollController _controller;

  @override  
  void initState() {  
      //Initialize the  scrollController  
      _controller = ScrollController();  
      super.initState();  
  }  
  
  void scrollCallBack(DragUpdateDetails dragUpdate) {  
    setState(() {  
      // Note: 3.5 represents the theoretical height of all my scrollable content. This number will vary for you.  
       //_controller.position.moveTo(dragUpdate.globalPosition.dy * 3.5);  
       _controller.position.moveTo(dragUpdate.globalPosition.dy * 20);
    });  
  }  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
           
    //appBar: AppBar(
    //   title: Text('Ethos'), //maybe change to Atlanthos
    //   centerTitle: true,
    //   //add logo and name on left, and can redirect to ethos lab home page
    // ),

    //body: Center(
    backgroundColor:  Colors.white, //prev .white
    body: Stack(
    //body: SingleChildScrollView(
    
    //part of old arch //child: Column(
    //children: <Widget>[HeaderWidget()],
    //mainAxisAlignment: MainAxisAlignment.center,
    
    children: <Widget>[
          Container(
          child: SingleChildScrollView(
              //Assign the controller to my scrollable widget  
              controller: _controller,  
              child: Column(  
                children: [ 
                  //return new StickyHeader(
                  //  header: 
                    
                     HeaderWidget(),
                  // )
                  
                  Container(
                     
                        //width: 800.0, //change from 200 
                        //height: 200.0,
                        
                      //height: MediaQuery.of(context).size.height,
                    width: 800, //change from 200
                    height: 200.0,
                      decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      
                      //shape: BoxShape.circle,
                        //mainAxisAlignment: MainAxisAlignment.center,
                          image: DecorationImage(
                          fit: BoxFit.cover,
                          
                          //image: new NetworkImage('images/ethosLogo.jpg'),
                           image: new NetworkImage(
                          "https://static1.squarespace.com/static/5d1e0e9d2a98da000182d011/t/5e549279b2919a79f2a866d4/1595529564053/?format=1500w"
                    //change image to app logo
                    )
                    ))),
                    
                    Container(
                     
                      padding: const EdgeInsets.all(20.0),
                      
                      child: Text(
                        'Hogwarts x Wakanda',
                        //'youth space reimagined',
                        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    
                    Container(  //mediaquery gets responsive height of screen
                    height: MediaQuery.of(context).size.height,  
                    width: MediaQuery.of(context).size.width,  
                    color: Colors.teal,  
                  ),  
                
                ],
              ),
          ),
        ),
        
        FlutterWebScroller(
          scrollCallBack, 
          scrollBarBackgroundColor: Colors.white,
          scrollBarWidth: 20.0, 
          //scrollBarHeight: 200.0,
          dragHandleColor: Colors.grey,  
          dragHandleBorderRadius: 3.0,  
          dragHandleHeight: 40.0,  
          dragHandleWidth: 20.0, //changed from 15 to 20
          ),  
        ],  
      ),  
    );  
  }  
}
// //stateless as info here does not change
// class AboutAtlanthos extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
// }
//}
