import 'package:flutter/material.dart';
//import 'utils/myColors.dart';
// import 'utils/myColors.dart';
// import 'widgets/body.dart';
// import 'widgets/header.dart';

//now child_profile
class PublicEventsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Events"),
        ),
        body: Center(
          child: RaisedButton(
            onPressed: () {
              // Navigate back to first route when tapped.
              },
              //child: Text('Go back!'),
              child: Text('Here are some events you may be interested in', style: Theme.of(context).textTheme.headline2),
            ),
        ),
    );
  }
}
