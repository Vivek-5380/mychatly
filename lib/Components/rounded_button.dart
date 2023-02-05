import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {

  final Color colour;
  final String title;
  final void Function() onPressed;

  RoundedButton(this.colour, this.title, @required this.onPressed);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Material(
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            title,
          ),
        ),
      ),
    );
  }
}