import 'dart:ffi';

import 'package:flutter/material.dart';

class Calculator {
  getAnswer(num1, num2, mathOperator) {
    var total;
    //convert to num
    num1 = num.parse(num1);
    num2 = num.parse(num2);

    if (mathOperator == '+') {
      total = num1 + num2;
    } else if (mathOperator == '-') {
      total = num1 - num2;
    } else if (mathOperator == 'x') {
      total = num1 * num2;
    } else if (mathOperator == '/') {
      total = num1 / num2;
    } else {
      total = num1 % num2;
    }

    num1 = num1.toString();
    num2 = num2.toString();
    return total;
  }

  deleteNum2(num2) {
    num2 = num2.substring(0, num2.length - 1);
    return num2;
  }

  deleteMathOperator(mathOperator) {
    mathOperator = mathOperator.substring(0, mathOperator.length - 1);
    return mathOperator;
  }

  deleteNum1(num1) {
    try {
      return num1 = num1.substring(0, num1.length - 1);
    } catch (e) {
      return num1 = '';
    }
  }

  //end class
}
