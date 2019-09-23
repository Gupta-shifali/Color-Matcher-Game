import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "dart:math";

main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: Text("Color Matching"),
      ),
      body: ShapeWidget(),
    ),
  ));
}

class ShapeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ShapeWidgetState();
  }
}

class _ShapeWidgetState extends State<ShapeWidget> {
  var containerOneColor = Colors.red;
  var containerTwoColor = Colors.cyan;
  var container3Color = Colors.orange;
  var container4Color = Colors.yellow;
  var container5Color = Colors.purple;
  var container6Color = Colors.indigo;
  var container7Color = Colors.brown;
  List colorList = [
    Colors.purple,
    Colors.amber,
    Colors.pink,
    Colors.black,
    Colors.red,
    Colors.green
  ];
  var random = new Random();
  var assignColor;
  var tapButton = true;
  int seconds = 20;

  updateTimer(bool tapButton) {
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        tapButton = false;
        seconds = seconds - 1;
        if (seconds < 0) {
          timer.cancel();
          seconds = 20;
          alertBox();
          resetColors();
          initState();
          tapButton = true;
        }
      });
    });
  }

  alertBox() {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text("Oops.. Game Over"),
              content: Text("Better Luck next Time!!!"),
            ));
  }

  resetColors() {
    containerOneColor = Colors.red;
    containerTwoColor = Colors.cyan;
    container3Color = Colors.orange;
    container4Color = Colors.yellow;
    container5Color = Colors.purple;
    container6Color = Colors.indigo;
    container7Color = Colors.brown;
  }

  @override
  void initState() {
    assignColor = colorList[random.nextInt(colorList.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        headerRow(),
        rowOne(),
        Expanded(
            child: GestureDetector(
          onTap: () {
            setState(() {
              container4Color = colorList[random.nextInt(colorList.length)];
            });
          },
          child: Container(
            height: 100.0,
            width: 100.0,
            color: container4Color,
          ),
        )),
        rowThree(),
      ],
    ));
  }

  Row rowThree() {
    return Row(
      children: <Widget>[
        Expanded(
            child: GestureDetector(
          onTap: () {
            setState(() {
              container5Color = colorList[random.nextInt(colorList.length)];
            });
          },
          child: Container(
            height: 100.0,
            width: 100.0,
            color: container5Color,
          ),
        )),
        Expanded(
            child: GestureDetector(
          onTap: () {
            setState(() {
              container6Color = colorList[random.nextInt(colorList.length)];
            });
          },
          child: Container(
            height: 100.0,
            width: 100.0,
            color: container6Color,
          ),
        )),
        Expanded(
            child: GestureDetector(
          onTap: () {
            setState(() {
              container7Color = colorList[random.nextInt(colorList.length)];
            });
          },
          child: Container(
            height: 100.0,
            width: 100.0,
            color: container7Color,
          ),
        )),
      ],
    );
  }

  Row rowOne() {
    return Row(
      children: <Widget>[
        Expanded(
            child: GestureDetector(
          onTap: () {
            setState(() {
              containerOneColor = colorList[random.nextInt(colorList.length)];
            });
          },
          child: Container(
            height: 100.0,
            width: 100.0,
            color: containerOneColor,
          ),
        )),
        Expanded(
            child: GestureDetector(
          onTap: () {
            setState(() {
              containerTwoColor = colorList[random.nextInt(colorList.length)];
            });
          },
          child: Container(
            height: 100.0,
            width: 100.0,
            color: containerTwoColor,
          ),
        )),
        Expanded(
            child: GestureDetector(
          onTap: () {
            setState(() {
              container3Color = colorList[random.nextInt(colorList.length)];
            });
          },
          child: Container(
            height: 100.0,
            width: 100.0,
            color: container3Color,
          ),
        )),
      ],
    );
  }

  Row headerRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          child: Text("Time Left: $seconds"),
        ),
        GestureDetector(
          onTap: tapButton ? () {
            updateTimer(tapButton);
          } : null,
          child: Container(
            child: Image.asset(
              'assets/images/play-16.png',
              fit: BoxFit.scaleDown,
            ),
            margin: EdgeInsets.all(10.0),
            decoration:
                BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            height: 40.0,
            width: 40.0,
          ),
        ),
        Container(
          decoration:
              BoxDecoration(color: assignColor, shape: BoxShape.rectangle),
          height: 30,
          width: 30,
        ),
      ],
    );
  }
}
