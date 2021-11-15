import 'package:flutter/material.dart';
import 'calculator_parser.dart';
//import 'calculator_parser-copy.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'シンプル電卓',
      home: CalculatorPage(),
      theme: new ThemeData.dark(),
    );
  }
}

class CalculatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        children: [
          new Display(),
          new Keyboard(),
        ],
      ),
    );
  }
}

var _displayState = new DisplayState();

class Display extends StatefulWidget {
  @override
  State createState() {
    return _displayState;
  }
}

class DisplayState extends State {
  var _expression = '';
  var _result = '';

  @override
  Widget build(BuildContext context) {
    var views = [
      new Expanded(
          flex: 1,
          child: new Row(
            children: [
              new Expanded(
                  child: new Text(
                    _expression,
                    textAlign: TextAlign.right,
                    style: new TextStyle(
                      fontSize: 40.0,
                      color: Colors.white,
                    ),
                  ))
            ],
          )),
    ];

    if (_result.isNotEmpty) {
      views.add(new Expanded(
          flex: 1,
          child: new Row(
            children: [
              new Expanded(
                  child: new Text(
                    _result,
                    textAlign: TextAlign.right,
                    style: new TextStyle(
                      fontSize: 40.0,
                      color: Colors.white,
                    ),
                  ))
            ],
          )),
      );
    }

    return new Expanded(
        flex: 2,
        child: new Container(
          color: Theme
              .of(context)
              .primaryColor,
          padding: const EdgeInsets.all(16.0),
          child: new Column(
            children: views,
          ),
        ));
  }
}

void _addKey(String key) {
  var _expr = _displayState._expression;
  var _result = '';
  if (_displayState._result.isNotEmpty) {
    _expr = '';
    _result = '';
  }

  if (operators.contains(key)) {
    // 入力が演算子の場合
    if (_expr.length > 0 && operators.contains(_expr[_expr.length - 1])) {
      _expr = _expr.substring(0, _expr.length - 1);
    }
    _expr += key;
  } else if (digits.contains(key)) {
    // 入力がオペランドの場合
    _expr += key;
  } else if (key == 'C') {
    // 末尾を消去
    if (_expr.length > 0) {
      _expr = _expr.substring(0, _expr.length - 1);
    }
  } else if (key == '=') {
    // 計算の実行
    try {
      var parser = const Parser();
      //print(_expr);
      _result = parser.parseExpression(_expr).toString();
    } on Error {
      _result = 'Error';
    }
  }
  // ignore: invalid_use_of_protected_member
  _displayState.setState(() {
    _displayState._expression = _expr;
    _displayState._result = _result;
  });
}

class Keyboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Expanded(
        flex: 5,
        child: new Center(
            child:
            new AspectRatio(
              aspectRatio: 1.0, // To center the GridView
              child: new GridView.count(
                crossAxisCount: 5,
                childAspectRatio: (4/5),
                padding: const EdgeInsets.all(4.0),
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
                children: [
                  // @formatter:off
                  '7', '8', '9', '/', '(',
                  '4', '5', '6', '*', ')',
                  '1', '2', '3', '-', ' ',
                  'C', '0', '=', '+', ' '
                  // @formatter:on
                ].map((key) {
                  return new GridTile(
                    child: new KeyboardKey(key),
                  );
                }).toList(),
              ),
            )
        ));
  }
}

class KeyboardKey extends StatelessWidget {
  KeyboardKey(this._keyValue);

  final _keyValue;

  @override
  Widget build(BuildContext context) {
    return new FlatButton(
      child: new Text(
        _keyValue,
        style: new TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 26.0,
          color: Colors.white,
        ),
      ),
      color: Theme
          .of(context)
          .scaffoldBackgroundColor,
      onPressed: () {
        _addKey(_keyValue);
      },
    );
  }
}