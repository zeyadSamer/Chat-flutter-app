import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';

import'package:firebase_core/firebase_core.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../components/Sign.dart';

class RegistrationScreen extends StatefulWidget {

  static const String id='registration_screen';



  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  String email;
  String password;
  bool showSpinner=false;

  final _auth=FirebaseAuth.instance;


  @override
  void initState(){

    Firebase.initializeApp();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag:'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(

                keyboardType: TextInputType.emailAddress,


                textAlign: TextAlign.center,

                onChanged: (value) {

                  email=value;
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'Enter a value')
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(

                obscureText: true,
                  textAlign: TextAlign.center,

                  onChanged: (value) {


                  password=value;
                },
                decoration: kTextFieldDecoration
              ),
              SizedBox(
                height: 24.0,
              ),
              SignButton(
                color: Colors.blueAccent,
                child:Text('Register'),
                onPressed: ()async{
                  setState(() {
                    showSpinner=true;
                  });

                  try {
                    final newUser=await _auth.createUserWithEmailAndPassword(email: email, password: password);
                    if(newUser!=null){

                      Navigator.pushNamed(context,ChatScreen.id);

                    }
                    setState(() {
                      showSpinner=false;
                    });
                  }catch (e) {

                    print(e);
                  }


                },

              ),
            ],
          ),
        ),
      ),
    );
  }
}
