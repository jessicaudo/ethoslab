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

void main() => runApp(EthosApp());


class EthosApp extends StatelessWidget { //now stateful 'coz scrollbar
 

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
       _controller.position.moveTo(dragUpdate.globalPosition.dy * 3.5);
    });  
  }  

  @override
  Widget build(BuildContext context) {
  
                return Scaffold(
               //HeaderWidget(),
                backgroundColor:  Colors.white, //prev .white
                body: Stack(
        
                
                children: <Widget>[
                      Container(
                      //padding: const EdgeInsets.symmetric(vertical: 16),
                      child: SingleChildScrollView(
                          //Assign the controller to my scrollable widget  
                          controller: _controller,  
                          //column lets us stack containers vertically
                          child: Column(  
                            children: [ 
                             //padding: EdgeInsets.only(top: 0),

                                 HeaderWidget(),
                          
                              Container(
                                 
                                  padding: const EdgeInsets.all(20.0),
                                  color: Colors.teal,
                                  child: Text(
                                    'Hogwarts meets Wakanda',
                                    //'youth space reimagined',
                                    style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
                                    ),
                                    ),
                                  
                              //now add image and sign up page

                              Container(
                                 
                                //width: 800, //change from 200
                                width: MediaQuery.of(context).size.width, 
                                height: 800.0,
                   
                             decoration: BoxDecoration(
                              
                               image: DecorationImage(
                               fit: BoxFit.cover,
                                      
                                      image: AssetImage('images/ethos_team.jpg'),
                                      //change to atlanthos logo
                              )
                             ),
                              ),
                                                            
                                  Container(
                                 
                                  padding: const EdgeInsets.all(20.0),
                                  alignment: Alignment.centerLeft,
                                  child: 
                                  Text(
                                    'Our Mission',
                                    //'youth space reimagined',
                                    style: TextStyle(
                                      fontSize: 24.0, 
                                      foreground: Paint()
                                      ..style = PaintingStyle.stroke
                                      ..strokeWidth = 6
                                      ..color = Colors.teal[700],
                                    ),
                                    //fontWeight: FontWeight.bold),
                                    ),

                                  ),
                                  
                              Container(  //mediaquery gets responsive height of screen
                                height: 250,  
                                width: MediaQuery.of(context).size.width,  
                                color: Colors.black,  
                                 padding: const EdgeInsets.all(20.0),
                                alignment: Alignment.center,
                                child: 
                                 Text(
                                    'The Ethọ́s Lab exists to foster cultural innovation for youth aged 13 - 18, by providing a safe and accessible tech-infused environment that allows them explore the fullest expressions of their authentic selves. \n\nLeveraging the "Internet of Things", applications, web-based tools and other technology, these environments will address the need for youth to own a stake in their digital future. \n\nOur Vision is that all youth are free to explore the fullest expressions of their authentic selves. ',
                                    //'youth space reimagined',
                                    style: TextStyle(
                                      fontSize: 18.0, 
                                      foreground: Paint()
                                      ..style = PaintingStyle.stroke
                                      ..strokeWidth = 6
                                      ..color = Colors.white,
                                    ),
                                    //fontWeight: FontWeight.bold),
                                    ),

                              ),
                              
                              Container(  //mediaquery gets responsive height of screen
                                height: 400,  
                                width: MediaQuery.of(context).size.width,  
                                color: Colors.teal,  
                                //first row showing images
                                child: new Row(
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    Image.asset('images/Cleo_2007165883.jpg'),
    Image.asset('images/Deqa_2007165883.jpg'),
  ],
      ),
                                ),

                               //repeating the above
                               //re-do to show column and row within column
                                Container(
                                 
                                  padding: const EdgeInsets.all(20.0),
                                  alignment: Alignment.centerLeft,
                                  child: 
                                  Text(
                                    'Our Journey',
                                    //'youth space reimagined',
                                    style: TextStyle(
                                      fontSize: 24.0, 
                                      foreground: Paint()
                                      ..style = PaintingStyle.stroke
                                      ..strokeWidth = 6
                                      ..color = Colors.teal[700],
                                    ),
                                    //fontWeight: FontWeight.bold),
                                    ),

                                  ),
                                  
                              Container(  //mediaquery gets responsive height of screen
                                height: 200,  
                                width: MediaQuery.of(context).size.width,  
                                color: Colors.black,  
                                 padding: const EdgeInsets.all(20.0),
                                alignment: Alignment.centerLeft,
                                child: 
                                 Text(
                                    'Starting off as a physical space...  ',
                                    //'youth space reimagined',
                                    style: TextStyle(
                                      fontSize: 18.0, 
                                      foreground: Paint()
                                      ..style = PaintingStyle.stroke
                                      ..strokeWidth = 6
                                      ..color = Colors.white,
                                    ),
                                    //fontWeight: FontWeight.bold),
                                    ),

                              ),
                          
                              
                              Container(  //mediaquery gets responsive height of screen
                                height: 400,  
                                width: MediaQuery.of(context).size.width,  
                                color: Colors.teal,  
                                //first row showing images
                                child: new Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                   children: [
                                     Image.asset('images/EthosLabMarylou1_2007165883.jpg'),
                                     Image.asset('images/image5_2007165883.png'),
                                     ],
                                     ),
                                ),

                                
                              //   Container(  //mediaquery gets responsive height of screen
                              //   height: MediaQuery.of(context).size.height,  
                              //   width: MediaQuery.of(context).size.width,  
                              //   color: Colors.teal,  
                              // ),  
                            
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
                 
       //can edit this and even make it a side bar for other tabs
       bottomNavigationBar: BottomNavigationBar(
       currentIndex: 0, // this will be set when a new tab is tapped
       items: [
         BottomNavigationBarItem(
           icon: new Icon(Icons.assessment),
           title: new Text('Privacy & Legal Policies'),
           
         ),
         BottomNavigationBarItem(
           icon: new Icon(Icons.mail),
           title: new Text('Contact Us'),
         ),
         BottomNavigationBarItem(
           icon: new Icon(Icons.report_problem),
           title: new Text('Report Problem')
         ),
         
       ],
     ),

     floatingActionButton: FloatingActionButton(
       child: Icon(Icons.arrow_upward),
       backgroundColor: Colors.orangeAccent,
       onPressed: (){
         print ("floating back to top button pressed");

       }
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
