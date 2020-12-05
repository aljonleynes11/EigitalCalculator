import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final Function btnPress;
  final String text;
  final Color color;

  CalcButton({@required this.text, this.color, this.btnPress});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      margin: const EdgeInsets.only(top: 5),
      color: Colors.grey[900],
      child: FlatButton(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 40,
            color: (color != null) ? color : Colors.white70,
          ),
        ),
        onPressed: btnPress,
      ),
    );
  }
}
