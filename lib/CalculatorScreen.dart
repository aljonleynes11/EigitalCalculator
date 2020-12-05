import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:EigitalCalculator/utils/responsive.dart';
import 'package:EigitalCalculator/commons/CalcButton.dart';
import 'package:EigitalCalculator/logic/Calculator.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

var num1;
var num2;
var total;
var mathOperator;

class _CalculatorScreenState extends State<CalculatorScreen> {
  resetClick() {
    num1 = '';
    mathOperator = '';
    num2 = '';
    total = '';
    setState(() {});
    print('cleared');
  }

  numClick(String params) {
    if ((params == '0') && (num1.toString().length <= 0)) {
      return;
    } else if ((mathOperator != '') && (num2 != '')) {
      num2 = num2.toString() + params;
    } else if (mathOperator != '') {
      num2 = params;
    } else if (num1 == '') {
      num1 = params;
    } else if (num1 != '') {
      num1 = num1.toString() + params;
    }
    viewGetAnswer();
    setState(() {});
  }

  deleteClick() {
    total = '';
    if (num2 != '') {
      num2 = Calculator().deleteNum2(num2);
    } else if (mathOperator != '') {
      mathOperator = Calculator().deleteMathOperator(mathOperator);
    } else if (num1 != '') {
      num1 = Calculator().deleteNum1(num1);
    }
    viewGetAnswer();
    setState(() {});
  }

  operatorClick(params) {
    mathOperator = params;
    viewGetAnswer();
    setState(() {});
  }

  viewGetAnswer() {
    try {
      total = Calculator().getAnswer(num1, num2, mathOperator);
    } catch (e) {
      // print(e);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Expanded(
              child: calcuArea(),
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.black45,
                margin: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Expanded(child: firstCol()),
                    Expanded(child: secondCol()),
                    Expanded(child: thirdCol()),
                    Expanded(child: fourthCol())
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Widget calcuArea() {
    return Column(children: [
      Container(
          margin: const EdgeInsets.only(top: 20),
          child: AutoSizeText(
            (num1 != '')
                ? '${num1.toString()} ${mathOperator.toString()} ${num2.toString()}'
                : '0',
            style: TextStyle(color: Colors.black, fontSize: 40),
          )),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Divider(
          color: Colors.grey,
        ),
      ),
      Container(
          margin: const EdgeInsets.only(top: 20),
          child: AutoSizeText(
            (total != '') ? total.toString() : '',
            style: TextStyle(color: Colors.black, fontSize: 40),
          )),
    ]);
  }

  Widget firstCol() {
    return Container(
      height: dh(context) * 0.6,
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 1),
      child: Column(
        children: [
          Expanded(
              flex: 2,
              child: CalcButton(
                text: 'C',
                color: Colors.blue[900],
                btnPress: () => resetClick(),
              )),
          CalcButton(text: '7', btnPress: () => numClick('7')),
          CalcButton(
            text: '4',
            btnPress: () => numClick('4'),
          ),
          CalcButton(
            text: '1',
            btnPress: () => numClick('1'),
          ),
          CalcButton(
            text: '.',
            btnPress: () => numClick('.'),
          ),
        ],
      ),
    );
  }

  Widget secondCol() {
    return Container(
      height: dh(context) * 0.6,
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 1),
      child: Column(
        children: [
          Expanded(
              flex: 2,
              child: CalcButton(
                  text: '/',
                  color: Colors.blue[900],
                  btnPress: () => operatorClick('/'))),
          CalcButton(
            text: '8',
            btnPress: () => numClick('8'),
          ),
          CalcButton(
            text: '5',
            btnPress: () => numClick('5'),
          ),
          CalcButton(
            text: '2',
            btnPress: () => numClick('2'),
          ),
          CalcButton(
            text: '0',
            btnPress: () => numClick('0'),
          ),
        ],
      ),
    );
  }

  Widget thirdCol() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 1),
      height: dh(context) * 0.6,
      child: Column(
        children: [
          Expanded(
              flex: 2,
              child: CalcButton(
                text: 'x',
                btnPress: () => operatorClick('x'),
                color: Colors.blue[900],
              )),
          CalcButton(
            text: '9',
            btnPress: () => numClick('9'),
          ),
          CalcButton(
            text: '6',
            btnPress: () => numClick('6'),
          ),
          CalcButton(
            text: '3',
            btnPress: () => numClick('3'),
          ),
          CalcButton(
            text: '%',
            color: Colors.blue[900],
            btnPress: () => operatorClick('%'),
          ),
        ],
      ),
    );
  }

  Widget fourthCol() {
    return Container(
      height: dh(context) * 0.6,
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 1),
      child: Column(
        children: [
          CalcButton(
            text: 'Del',
            color: Colors.blue[900],
            btnPress: () => deleteClick(),
          ),
          CalcButton(
            text: '-',
            btnPress: () => operatorClick('-'),
            color: Colors.blue[900],
          ),
          CalcButton(
            text: '+',
            btnPress: () => operatorClick('+'),
            color: Colors.blue[900],
          ),
          Expanded(
            flex: 2,
            child: CalcButton(
              text: '=',
              color: Colors.blue[900],
              btnPress: () => viewGetAnswer(),
            ),
          ),
        ],
      ),
    );
  }
}
