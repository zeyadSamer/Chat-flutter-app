import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/components/Sign.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static  const String id='welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {

  AnimationController controller;
  Animation logoAnimation,colorAnimation;



  @override
  void initState(){
    super.initState();


    controller=AnimationController(
        duration: Duration(seconds: 1),
        vsync: this);

    logoAnimation=CurvedAnimation(
      parent:controller,

      curve:Curves.easeIn

    );


    //colorAnimation=ColorTween(begin: Colors.blueGrey,end:Colors.white).animate(controller);




    controller.forward();
    controller.addListener(() {

      setState(() {

      });

    });
  }


@override
void dispose(){
    //disposing animation to stop consuming resources
    controller.dispose();
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag:'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: logoAnimation.value*60,
                  ),
                ),
                AnimatedTextKit(

                  animatedTexts: [TypewriterAnimatedText('Flash Chat', textStyle: TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.grey[700]
                  ),speed: Duration(milliseconds: 100))],


                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
          SignButton(
            color: Colors.lightBlueAccent,
            child:Text('Log In'),
            onPressed: (){
              Navigator.pushNamed(context, LoginScreen.id);
            },

          ),
            SignButton(
              color: Colors.blueAccent,
              child:Text('Register'),
              onPressed: (){
                Navigator.pushNamed(context, RegistrationScreen.id);
              },

            ),

          ],
        ),
      ),
    );
  }
}
