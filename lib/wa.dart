import 'package:flutter/material.dart';

class waContainer extends StatefulWidget {
  var factor = 'factor';
  int amount = 25;
  var unit = "";
  Function(int value) callBack;

  waContainer(
      {required this.factor, required this.unit, required this.callBack}) {
    if (this.factor == 'Weight') {
      amount = 70;
    }
  }
  @override
  State<waContainer> createState() => _waContainer();
}

class _waContainer extends State<waContainer> {
  void decrement() {
    widget.amount = widget.amount - 1;
    widget.callBack(widget.amount);
    setState(() {});
    return;
  }

  void increment() {
    widget.amount = widget.amount + 1;
    widget.callBack(widget.amount);
    setState(() {});
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xFF212121),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            child: Text(
              '${widget.factor}',
              style: TextStyle(color: Colors.white, fontSize: 21),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    child: Text(
                  '${widget.amount}',
                  style: TextStyle(
                      fontSize: 41,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                )),
                Container(
                  child: Text(
                    '${widget.unit}',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => decrement(),
                  child: Icon(
                    Icons.minimize,
                    size: 26,
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(CircleBorder()),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.fromLTRB(0, 0, 0, 14)),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => increment(),
                  child: Icon(
                    Icons.add,
                    size: 26,
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(CircleBorder()),
                    padding: MaterialStateProperty.all(EdgeInsets.all(7)),
                  ),
                ),
              ],
            ),
          )
        ]));
  }
}
