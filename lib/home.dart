import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Home extends StatefulWidget {
  var togglecall;
  int value;
  Home(this.togglecall, this.value);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String userInput = '';
  String answer = '';
  List<String> buttons = [
    'AC',
    'B',
    '%',
    '÷',
    '1',
    '2',
    '3',
    'x',
    '4',
    '5',
    '6',
    '-',
    '7',
    '8',
    '9',
    '+',
    '+/-',
    '0',
    '.',
    '='
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          IconButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            icon: widget.value == 1
                ? Icon(Icons.wb_sunny_outlined)
                : Icon(Icons.wb_sunny),
            onPressed: widget.togglecall,
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Color(0xffF0EEEE),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (answer != '')
                        Text(
                          userInput,
                          style:
                              TextStyle(fontSize: 32, color: Color(0xff666666)),
                          textAlign: TextAlign.right,
                        ),
                      Text(
                        answer != '' ? answer : userInput,
                        style: TextStyle(
                            fontSize: 48, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Container(
                child: GridView.count(
                  padding: const EdgeInsets.all(12),
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  crossAxisCount: 4,
                  children: buttons
                      .map((text) => MyButton(
                            text: text,
                            onTap: () {
                              if (text == 'C') {
                                setState(() {
                                  userInput = '';
                                  answer = '';
                                });
                              } else if (text == 'B') {
                                setState(() {
                                  userInput = userInput.substring(
                                      0, userInput.length - 1);
                                });
                              } else if (text == '=') {
                                calculate();
                              } else {
                                setState(() {
                                  userInput += text;
                                });
                              }
                            },
                          ))
                      .toList(),
                ),
              ))
        ],
      ),
    );
  }

  void calculate() {
    String userInputToCalculate = userInput;
    userInputToCalculate = userInputToCalculate.replaceAll('x', '*');
    userInputToCalculate = userInputToCalculate.replaceAll('÷', '/');

    Parser p = Parser();
    Expression exp = p.parse(userInputToCalculate);

    // Bind variables:
    ContextModel cm = ContextModel();

    // Evaluate expression:
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      answer = eval.toString();
      if (answer.substring(answer.length - 2, answer.length) == '.0')
        answer = answer.substring(0, answer.length - 2);
    });
  }
}

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const MyButton({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Card(
          shape: CircleBorder(),
          color: isOperator(text) ? Colors.black : Colors.white,
          child: Center(
              child: text == 'B'
                  ? Icon(
                      Icons.backspace,
                      color: Colors.white,
                    )
                  : Text(text,
                      style: TextStyle(
                        color: isOperator(text) ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 36,
                      ))),
        ));
  }

  bool isOperator(String value) {
    if (value == 'C' ||
        value == 'B' ||
        value == '%' ||
        value == '÷' ||
        value == 'x' ||
        value == '-' ||
        value == '+' ||
        value == '=')
      return true;
    else
      return false;
  }
}
