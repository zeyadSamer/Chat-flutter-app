import 'package:flutter/material.dart';

class SignButton extends StatelessWidget {
  const SignButton( { @required this.color,this.child,this.onPressed});
  final Color color;
  final child;
  final VoidCallback onPressed;




  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: this.color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed:this.onPressed,
          minWidth: 200.0,
          height: 42.0,
          child:this.child,
          textColor: Colors.white,

        ),

      ),
    );
  }
}
