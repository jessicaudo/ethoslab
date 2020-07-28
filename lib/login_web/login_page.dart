import 'package:flutter/material.dart';

//stateful widget - stores info that can change such as user input or data from a feed
class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

//sign up screen
class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SizedBox(
          width: 400,
          child: Card(
            child: SignUpForm(),
          ),
        ),
      ),
    );
  }
}



//builds the signUp button
class _SignUpFormState extends State<SignUpForm> {

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

//final tells app that object value won't be modified throughout app
  final _firstNameTextController = TextEditingController();
  final _lastNameTextController = TextEditingController();
  final _usernameTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  double _formProgress = 0;
  
  void _showWelcomeScreen() {
    Navigator.of(context).pushNamed('/welcome');              
  }

  //allow us track user's progress in filling out form
  //Can't submit until all entries completed
  //TO-DO: link this to ADB2C so we don't have to validate log-in
  void _updateFormProgress() {
  var progress = 0.0;
  var controllers = [
    _firstNameTextController,
    _lastNameTextController,
    _usernameTextController,
    _passwordTextController,
  ];

  for (var controller in controllers) {
    if (controller.value.text.isNotEmpty) {
      progress += 1 / controllers.length;
    }
  }

  setState(() {
    _formProgress = progress;
  });
}

  @override
  Widget build(BuildContext context) {
        return Form(
            onChanged: _updateFormProgress, // Call updateFormProgress when form changes
            
            child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedProgressIndicator(value: _formProgress),
              //LinearProgressIndicator(value: _formProgress),
              Text('Join us in Atlanthos', style: Theme
                  .of(context)
                  .textTheme
                  .headline4),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _firstNameTextController,
                  decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  hintText: "First Name",
                  border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
                  //decoration: InputDecoration(hintText: 'First name'),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _lastNameTextController,
                  decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  hintText: "Last Name",
                  border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _usernameTextController,
                  decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  hintText: "Username",
                  border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
                 
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _passwordTextController,
              decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Password",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
             
            ),
          ),
          
          //a flat button with a blue background
          FlatButton(
            color: Colors.blue,
            textColor: Colors.white,
            onPressed:  _formProgress == 1 ? _showWelcomeScreen : null,
            //onPressed: _showWelcomeScreen,
                        //onPressed: null,
                        child: Text('Sign up'),
                      ),
                    
                    ],
                  ),
                );
              }
}
//adding an animated progress indicator
class AnimatedProgressIndicator extends StatefulWidget {
  final double value;

  AnimatedProgressIndicator({
    @required this.value,
  });

  @override
  State<StatefulWidget> createState() {
    return _AnimatedProgressIndicatorState();
  }
}

class _AnimatedProgressIndicatorState extends State<AnimatedProgressIndicator>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Color> _colorAnimation;
  Animation<double> _curveAnimation;

  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: Duration(milliseconds: 1200), vsync: this);

    var colorTween = TweenSequence([
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.red, end: Colors.orange),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.orange, end: Colors.yellow),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.yellow, end: Colors.green),
        weight: 1,
      ),
    ]);

    _colorAnimation = _controller.drive(colorTween);
    _curveAnimation = _controller.drive(CurveTween(curve: Curves.easeIn));
  }

  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    _controller.animateTo(widget.value);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => LinearProgressIndicator(
        value: _curveAnimation.value,
        valueColor: _colorAnimation,
        backgroundColor: _colorAnimation.value.withOpacity(0.4),
      ),
    );
  }
}
