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

class FooterWidget extends StatefulWidget {
  @override
  _FooterWidgetState createState() => _FooterWidgetState();
}


class _FooterWidgetState extends State<FooterWidget> {
  var links = ["Home", "EthosLab", "Events", "GitHub"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 45, vertical: 38),
      child: buildFooter(context),
    );
  }

  Widget buildFooter(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[buildLogo(context), buildFooterLinks(context)],
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