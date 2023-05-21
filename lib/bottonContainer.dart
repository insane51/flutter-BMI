import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class bottomContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(10, 1, 10, 10),
      child: Text(
        'Bottom Container',
        style: TextStyle(
          fontSize: 21,
          color: Colors.black,
        ),
      ),
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(10)),
    );
  }
}
