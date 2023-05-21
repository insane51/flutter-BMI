import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//MALE BOX WIDGET

class maleBox extends StatefulWidget {
  Function() maleBoxSelected;
  var colorSet;
  maleBox({required this.maleBoxSelected, this.colorSet}) {}
  @override
  State<maleBox> createState() => _maleBox();
}

class _maleBox extends State<maleBox> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.maleBoxSelected(),
      child: Container(
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: widget.colorSet, borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.male,
              color: Colors.white,
              size: 70,
            ),
            Text(
              'MALE',
              style: TextStyle(
                fontSize: 21,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class femaleBox extends StatefulWidget {
  Function() femaleBoxSelected;
  var colorSet;
  femaleBox({required this.femaleBoxSelected, this.colorSet}) {}
  @override
  State<StatefulWidget> createState() => _femaleBox();
}

class _femaleBox extends State<femaleBox> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.femaleBoxSelected(),
      child: Container(
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: widget.colorSet, borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.female,
              color: Colors.white,
              size: 70,
            ),
            Text(
              'FEMALE',
              style: TextStyle(
                fontSize: 21,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class heightContainer extends StatefulWidget {
  Function(int value) callBack;
  heightContainer({required this.callBack});
  @override
  State<StatefulWidget> createState() => _heightContainer();
}

class _heightContainer extends State<heightContainer> {
  double heightVal = 150.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                'Height',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      margin: EdgeInsets.fromLTRB(0, 1, 5, 10),
                      child: Text(
                        '${heightVal.toInt()}',
                        style: TextStyle(
                            fontSize: 41,
                            fontWeight: FontWeight.w900,
                            color: Colors.white),
                      )),
                  Container(
                    child: Text(
                      'cm',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            Container(
                child: Slider(
              min: 60.0,
              max: 250.0,
              value: heightVal,
              onChanged: (double e) {
                widget.callBack(e.toInt());
                heightVal = e;
                setState(() {});
              },
            ))
          ],
        ),
      ),
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFF212121),
      ),
    );
  }
}
