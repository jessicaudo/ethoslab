import 'package:flutter/material.dart';
//import 'utils/myColors.dart';
// import 'utils/myColors.dart';
// import 'widgets/body.dart';
// import 'widgets/header.dart';

//now child_profile
class SupportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Support Us"),
        ),
        body: Center(
          child: RaisedButton(
            onPressed: () {
              // Navigate back to first route when tapped.
              },
              //child: Text('Go back!'),
              child: Text('Ethos lab is always looking for people to partner with us', style: Theme.of(context).textTheme.headline2),
              //add body for support page. Support by money, by contributing to GitHub code etc.
            ),
        ),
    );
  }
}
