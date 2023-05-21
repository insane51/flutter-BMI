import 'package:_bmi/bottomAppBar.dart';
import 'package:_bmi/bottonContainer.dart';
import 'package:_bmi/splashScreen.dart';
import 'package:_bmi/wa.dart';
import 'package:_bmi/widgets.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//Black color code 0xFF212121
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: splashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  var _weight = 70;
  var _age = 25;
  int _height = 150;
  var activeColor = Colors.blue;
  var deactivateColor = Color(0xFF212121);
  Color maleColor = Colors.red;
  Color femaleColor = Colors.red;
  double res = 0.0;
  var resmsg = "";
  Color resColor = Colors.black;

  @override
  void initState() {
    maleColor = activeColor;
    femaleColor = deactivateColor;
  }

  void maleCallBack() {
    maleColor = activeColor;
    femaleColor = deactivateColor;
    setState(() {});
  }

  void femaleCallBack() {
    maleColor = deactivateColor;
    femaleColor = activeColor;
    setState(() {});
  }

  void heightCallback(int value) {
    _height = value;
  }

  void weightCallBack(int value) {
    _weight = value;
  }

  void ageCallBack(int value) {
    _age = value;
  }

  void bottomAppbarCallback() {
    res = (_weight * 10000) / (_height * _height);
    print('$_weight - $_height == $res');
    if (res < 18.5) {
      resmsg = 'Underweight';
      resColor = Colors.blue;
    } else if (res < 24.9) {
      resmsg = "Healthy weight";
      resColor = Colors.green;
    } else if (res < 29.9) {
      resmsg = "Overweight";
      resColor = Colors.orange.shade700;
    } else {
      resmsg = 'Obesity';
      resColor = Colors.red;
    }
    print(res);
    showDialog(
        context: context,
        builder: (context) {
          return Container(
              child: AlertDialog(
            backgroundColor: resColor,
            title: Text("Result"),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Your BMI : ${res.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 21),
                ),
                Text(
                  "You are : ${resmsg}",
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Ok',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ))
            ],
          ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(minHeight: 600, maxHeight: 600),
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                      child: maleBox(
                        colorSet: maleColor,
                        maleBoxSelected: maleCallBack,
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child: femaleBox(
                        colorSet: femaleColor,
                        femaleBoxSelected: femaleCallBack,
                      ),
                      flex: 1,
                    ),
                  ],
                ),
              ),
              Expanded(
                  flex: 2,
                  child: heightContainer(
                    callBack: heightCallback,
                  )),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      //'Weight', _weight, 'kg'
                      child: waContainer(
                          factor: 'Weight',
                          unit: 'kg',
                          callBack: weightCallBack),
                      flex: 1,
                    ),
                    Expanded(
                      child: waContainer(
                          factor: 'Age', unit: '', callBack: ageCallBack),
                      flex: 1,
                    ),
                  ],
                ),
              ),
              // Expanded(flex: 1, child: bottomContainer()),
              Container(
                margin: EdgeInsets.all(10),
                width: double.infinity,
                height: 60,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: bottomAppbar(callBack: bottomAppbarCallback),
              )
            ],
          ),
        ),
      ),
    );
  }
}
