import './numbers_screen.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String lowerNumber = '';
  String upperNumber = '';
  String operator = '0';

  final List<String> _numbers = [
    '',
    '%',
    'X',
    'B',
    '7',
    '8',
    '9',
    '*',
    '4',
    '5',
    '6',
    '/',
    '1',
    '2',
    '3',
    '-',
    '.',
    '0',
    '=',
    '+',
  ];

  void getSelectedNumber(String number) {
    bool arth = (number == '=' ||
        number == '+' ||
        number == '-' ||
        number == '*' ||
        number == '/');

    if (lowerNumber == '' &&
        !(arth) &&
        lowerNumber == 'B' &&
        lowerNumber == '%') {
      setState(() {
        lowerNumber = number;
      });
    } else if (lowerNumber == '0' && !(arth)) {
      setState(() {
        lowerNumber = number;
      });
    } else if (number == 'B') {
      setState(() {
        lowerNumber = '';
        upperNumber = '';
      });
    } else if (number == 'X') {
      setState(() {
        if (lowerNumber != '') {
          lowerNumber = lowerNumber.substring(0, lowerNumber.length - 1);
        }
      });
    } else if ((arth && upperNumber != '') || (arth && (lowerNumber != ''))) {
      setState(() {
        switch (number) {
          case '+':
            if (lowerNumber != '') {
              upperNumber = lowerNumber;
            }
            lowerNumber = '';
            operator = '+';
            break;
          case '-':
            if (lowerNumber != '') {
              upperNumber = lowerNumber;
            }
            lowerNumber = '';
            operator = '-';
            break;
          case '/':
            if (lowerNumber != '') {
              upperNumber = lowerNumber;
            }
            lowerNumber = '';
            operator = '/';
            break;
          case '*':
            if (lowerNumber != '') {
              upperNumber = lowerNumber;
            }
            lowerNumber = '';
            operator = '*';
            break;
          case '%':
            if (lowerNumber != '') {
              upperNumber = lowerNumber;
            }
            lowerNumber = '';
            operator = '%';
            break;
          case '=':
            if (upperNumber != '' && lowerNumber != '') {
              double num1 = double.parse(upperNumber);
              double num2 = double.parse(lowerNumber);
              if (operator == '0') {
                lowerNumber = '';
                upperNumber = lowerNumber;
              } else if (operator != '0') {
                switch (operator) {
                  case '+':
                    upperNumber = (num1 + num2).toString();
                    lowerNumber = '';
                    break;
                  case '-':
                    if (num1 < num2) {
                      upperNumber = ' -${(num2 - num1)}';
                      lowerNumber = '';
                    }
                    upperNumber = (num1 - num2).toString();
                    lowerNumber = '';
                    break;
                  case '*':
                    upperNumber = (num1 * num2).toString();
                    lowerNumber = '';
                    break;
                  case '/':
                    upperNumber = (num1 / num2).toString();
                    lowerNumber = '';
                    break;
                  case '%':
                    upperNumber = (num1 % num2).toString();
                    lowerNumber = '';
                    break;
                  default:
                    lowerNumber = '';
                    upperNumber = lowerNumber;
                }
              }
            }
            break;
          default:
            lowerNumber = '';
            break;
        }
      });
    } else if (arth) {
      setState(() {
        if (lowerNumber != '') {
          upperNumber = lowerNumber;
        }
        lowerNumber = '';
      });
    } else {
      setState(() {
        lowerNumber = lowerNumber + number;
      });
    }
  }

  Widget _buildText(String number) {
    return Card(
      elevation: 10,
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: Text(
          number,
          textAlign: TextAlign.end,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Standard'),
      ),
      body: Container(
        decoration: BoxDecoration(color: Theme.of(context).primaryColor),
        child: Column(
          children: [
            _buildText(upperNumber),
            _buildText(lowerNumber),
            NumbersScreen(_numbers, getSelectedNumber),
          ],
        ),
      ),
    );
  }
}
