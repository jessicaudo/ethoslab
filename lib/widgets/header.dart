//the header widget/header section contains 
//logo and site's title at left side, 
//navigation links and login button at right side
//Used padding widget to conatin header section's logo and links

import 'package:ethoslab/plugins/url_launcher/web.dart';
import 'package:ethoslab/utils/responsive_widget.dart';
import 'package:flutter/material.dart';
//import 'package:landingpage/router.dart' as router;
import 'package:ethoslab/utils/myColors.dart';
import 'package:ethoslab/utils/strings.dart';
//import 'dart:html' as html;

import '../utils/display_util.dart';

class HeaderWidget extends StatefulWidget {
  @override
  _HeaderWidgetState createState() => _HeaderWidgetState();
}


class _HeaderWidgetState extends State<HeaderWidget> {
  var links = ["Home", "Ethos Lab", "Events", "GitHub", "Support"];

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 45, vertical: 38), //prev vertical 38
      child: buildHeader(context),
    );
  }

  Widget buildHeader(BuildContext context) {
      return Row(
       // padding: EdgeInsets.zero,
      //return MediaQuery.removePadding(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //margin: EdgeInsets.all(0),
      //padding: const EdgeInsets.symmetric(vertical: 16),
      children: <Widget>[buildLogo(context), buildHeaderLinks(context)],
    );
  }

  //Builds navigation links at the right top of landing page
  Widget buildHeaderLinks(BuildContext context) {
    //for medium and large screen, regular view
    if (!ResponsiveWidget.isSmallScreen(context)) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: getLinksListing(context)..add(buildLoginButton(context)),
      );
    } else { //for small screeen
      return PopupMenuButton(
        //child: Image.network("assets/menu.png", width: 25, height: 25),
        //child: Image.asset("images/menu.png", width: 25, height: 25), //changed from 25
        child: Image.asset(Strings.menuImage, width: 25, height: 20), //changr from 25 to 15
        onSelected: (NavLinks value) {
          setState(() {
            openLink(value);
          });
        },
        
        itemBuilder: (BuildContext context) => <PopupMenuEntry<NavLinks>>[
         
          const PopupMenuItem(
          value: NavLinks.Home, 
          child: Text(
            "Home", 
            style: 
            TextStyle(fontFamily: 'Montserrat-Regular', fontSize: 20),
          )),
          
           const PopupMenuItem(
              value: NavLinks.EthosLab,
              child: Text(
                "Ethos Labs",
                style:
                    TextStyle(fontFamily: 'Montserrat-Regular', fontSize: 20),
              )),
          
          const PopupMenuItem(
              value: NavLinks.Events,
              child: Text("Events",
                  style: TextStyle(
                      fontFamily: 'Montserrat-Regular', fontSize: 20))),
          
          const PopupMenuItem(
              value: NavLinks.GitHub,
              child: Text("GitHub",
                  style: TextStyle(
                      fontFamily: 'Montserrat-Regular', fontSize: 20))),
          
          const PopupMenuItem(
              value: NavLinks.Support,
              child: Text("Support",
                  style: TextStyle(
                      fontFamily: 'Montserrat-Regular', fontSize: 20))),
          
          PopupMenuItem(value: NavLinks.LogIn, child: buildLoginButton(context))

          // const PopupMenuItem(value: NavLinks.EthosLab, child: Text("Ethos Lab")),
          // const PopupMenuItem(value: NavLinks.Events, child: Text("Events")),
          // const PopupMenuItem(value: NavLinks.GitHub, child: Text("Github")),
          // const PopupMenuItem(value: NavLinks.Support, child: Text("Support Us")),
          // PopupMenuItem(value: NavLinks.LogIn, child: buildLoginButton(context))
        ],
      );
    
    }
  }

  bool isNotNavLinksLogin(link) {
    return link != NavLinks.LogIn;
  }

  //Builds navigation list for header when in small screen
  List<Widget> getLinksListing(BuildContext context) {
    return NavLinks.values.where((link) => link != NavLinks.LogIn).map((link) {
      return Padding(
          padding: EdgeInsets.only(left: 18),
          child: InkWell(
              hoverColor: Theme.of(context).primaryColor,
              highlightColor: Theme.of(context).secondaryHeaderColor,
              splashColor: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(20.0), //change frm 10 to 20
              child: Text(
                displayString(link),
               // style: Theme.of(context).textTheme.title,
                style: TextStyle(
                  fontFamily: 'Montserrat-Regular',
                  fontSize: 15, //changed from 15 to 20
                  fontWeight: FontWeight.normal),
              ),
              onTap: () {
                openLink(link);//automatically just opens link in new tab
              }));
    }).toList();
  }

  void openLink(NavLinks link) {
    //return null;
    if (link == NavLinks.Home) {
      //Back to homepage
      //TO-DO: need to set up homepage to persist user log-in info
      
      //Navigator.of(context).pushNamed('/homepage');
      Navigator.of(context).pushNamed('/userdashboard');
    }else if (link == NavLinks.Support) {
      //open Support page
      Navigator.of(context).pushNamed('/support');
    } else if (link == NavLinks.Events) {
      //open Events calendar page
      //Navigator.pushNamed(context, router.FLUTTER_RESOURCES);
      Navigator.of(context).pushNamed('/events');
      //return null;
    } else {
      UrlUtils.open(getTargetUrl(link), name: displayString(link));
      //html.window.open(getTargetUrl(link), displayString(link));
    }
  }

  String getTargetUrl(NavLinks link) {
    String url = "";

    switch (link) {
      case NavLinks.Home:
        url = "https://www.ethoslab.space/";
        //change to Homepage url 
        break;

      case NavLinks.EthosLab:
        url = "https://www.ethoslab.space/";
          break;

      case NavLinks.Events:
        url = "https://www.ethoslab.space/";
        //change to public calendar
          break;
      
      case NavLinks.GitHub:
        url = "https://github.com/jessicaudo/ethoslab";
        break;

      case NavLinks.Support:
        url = "https://www.ethoslab.space/";
        //change to public calendar
        break;

      default:
        url = "https://flutter-to-fly.firebaseapp.com";
        //check what default url is
    }
    //print("url: " + url);
    return url;
  }

  //Builds and decorates login button
  Widget buildLoginButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/signup');
          //Navigator.of(context).pushNamed('/SignUpForm');
          //Navigator.pushNamed(context, router.FIREBASE_LOGIN);
        },

        child: Container(
          margin: EdgeInsets.only(left: 20),
          width: 120,
          height: 40,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).secondaryHeaderColor
              ], begin: Alignment.bottomRight, end: Alignment.topLeft),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Theme.of(context).accentColor.withOpacity(0.3),
                    offset: Offset(0, 8), //Shadow starts at x=0, y=8
                    blurRadius: 8)
              ]),
          child: Material(
            color: Colors.transparent,
            child: Center(
              child: Text(
                Strings.loginButton,
                style: TextStyle(
                    color: MyColors.white1, fontSize: 18, letterSpacing: 1),
              ),
            ),
          ),
        ),
      ),
    );
  }

  //Builds rectangle with circular corners and Text on it and next to it as title
  Widget buildLogo(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 120,
          height: 90,
          child: Center(
            //child: Image.asset(Strings.logoImage)
            child: Image.asset('images/ethosLogo.jpg'),
            //change to Atlanthos logo
          ),
        ),
        //give some space between logo box and title
        SizedBox(
          width: 16,
        ),
        //Text(
          //Strings.logoImage,
          //Strings.appTitle,
          //style: TextStyle(fontSize: 26),
        //)
      ],
    );
  }
}