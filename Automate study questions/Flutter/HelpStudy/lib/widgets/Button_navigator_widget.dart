import 'package:flutter/material.dart';

class ButtonNavigator extends StatelessWidget {
  const ButtonNavigator({Key key, this.route, this.label}) : super(key: key);
  final route;
  final label;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: OutlineButton(
        child: Text(label),
        onPressed: (){
          Navigator.pushNamed(context, route);
        }
      ),
    );
  }
}