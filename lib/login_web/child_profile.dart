import 'package:flutter/material.dart';
//import 'utils/myColors.dart';
// import 'utils/myColors.dart';
// import 'widgets/body.dart';
// import 'widgets/header.dart';

//now child_profile
class ChildProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        ),
        body: Center(
          child: RaisedButton(
            onPressed: () {
              // Navigate back to first route when tapped.
              },
              //child: Text('Go back!'),
              child: Text('Welcome to Ethos Lab!', style: Theme.of(context).textTheme.headline2),
            ),
        ),
    );
  }
}
