//the header widget/header section contains 
//logo and site's title at left side, 
//navigation links and login button at right side
//Used padding widget to conatin header section's logo and links

import 'package:ethoslab/plugins/url_launcher/web.dart';
import 'package:ethoslab/utils/responsive_widget.dart';
import 'package:flutter/material.dart';
//import 'package:landingpage/plugins/url_launcher/url_launcher.dart';
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
  var links = ["Home", "EthosLab", "Events", "GitHub"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 45, vertical: 38),
      child: buildHeader(context),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[buildLogo(context), buildHeaderLinks(context)],
    );
  }

  //Builds navigation links at the right top of landing page
  Widget buildHeaderLinks(BuildContext context) {
    if (!ResponsiveWidget.isSmallScreen(context)) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: getLinksListing(context)..add(buildLoginButton(context)),
      );
    } else {
      return PopupMenuButton(
        //child: Image.network("assets/menu.png", width: 25, height: 25),
        child: Image.asset("images/menu.png", width: 25, height: 25),
        onSelected: (NavLinks value) {
          setState(() {
            openLink(value);
          });
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<NavLinks>>[
          const PopupMenuItem(value: NavLinks.Home, child: Text("Home")),
          const PopupMenuItem(value: NavLinks.GitHub, child: Text("Github")),
          const PopupMenuItem(value: NavLinks.EthosLab, child: Text("Ethos Lab")),
          const PopupMenuItem(value: NavLinks.Events, child: Text("Events")),
          PopupMenuItem(value: NavLinks.LogIn, child: buildLoginButton(context))
        ],
      );
    }
  }

  bool isNotNavLinksLogin(link) {
    return link != NavLinks.LogIn;
  }

  //Builds navigation list for header
  List<Widget> getLinksListing(BuildContext context) {
    return NavLinks.values.where((link) => link != NavLinks.LogIn).map((link) {
      return Padding(
          padding: EdgeInsets.only(left: 18),
          child: InkWell(
              hoverColor: Theme.of(context).primaryColor,
              highlightColor: Theme.of(context).secondaryHeaderColor,
              splashColor: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(10.0),
              child: Text(
                displayString(link),
                style: Theme.of(context).textTheme.title,
                //style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                openLink(link);
              }));
    }).toList();
  }

  void openLink(NavLinks link) {
    //return null;
    if (link == NavLinks.Support) {
      //open Support page
      //Navigator.pushNamed(context, router.FLUTTER_RESOURCES);
      return null;
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

      case NavLinks.GitHub:
        url = "https://github.com/jessicaudo/ethoslab";
        break;

      case NavLinks.EthosLab:
        url = "https://www.ethoslab.space/";
          break;

      case NavLinks.Events:
        url = "https://www.ethoslab.space/";
        //change to public calendar
        break;

      default:
        url = "https://flutter-to-fly.firebaseapp.com";
        //check what default url is
    }
    print("url: " + url);
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
          width: 50,
          height: 50,
          child: Center(
            child: Image.asset(Strings.logoImage)
            //child: Image.asset('images/bird.jpg'),
            //change to Atlanthos logo
          ),
        ),
        //give some space between logo box and title
        SizedBox(
          width: 16,
        ),
        Text(
          Strings.appTitle,
          style: TextStyle(fontSize: 26),
        )
      ],
    );
  }
}