import 'package:flutter/material.dart';

class bottomAppbar extends StatelessWidget {
  var _col = Colors.blue;
  Function() callBack;
  bottomAppbar({required this.callBack}) {}
  void pressed() {
    callBack();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => pressed(),
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue)),
      child: Text(
        'Calculate',
        style: TextStyle(
            color: Colors.white, fontSize: 21, fontWeight: FontWeight.bold),
      ),
      // style: ButtonStyle(),
    );
  }
}
