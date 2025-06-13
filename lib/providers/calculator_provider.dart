import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalculatorProvider with ChangeNotifier {
  String _expressionRaw = '';
  String _result = '';

  String get expression => _formatExpression(_expressionRaw);
  String get result => _result;

  void buttonPressed(dynamic value) {
    if (value == 'C') {
      _expressionRaw = '';
      _result = '';
    } else if (value == Icons.cancel_presentation_outlined) {
      if (_expressionRaw.isNotEmpty) {
        _expressionRaw = _expressionRaw.substring(0, _expressionRaw.length - 1);
      }
    } else if (value == '=') {
      _evaluateExpression();
    } else {
      _expressionRaw += value.toString();
    }
    notifyListeners();
  }

  void _evaluateExpression() {
    try {
      final formatted = _expressionRaw.replaceAll('x', '*');
      final cleaned = formatted.replaceAll(',', ''); // Remove commas
      final finalExpression = cleaned.replaceAll('--', '+');
      double evaluated = _basicEvaluate(finalExpression);

      if (evaluated % 1 == 0) {
        _result = NumberFormat('#,###').format(evaluated.toInt());
      } else {
        _result = NumberFormat('#,###.########').format(evaluated);
      }
    } catch (e) {
      _result = 'Error';
    }
  }

  // This formats the expression string for display (inserting commas)
  String _formatExpression(String expr) {
    final buffer = StringBuffer();
    final numberRegExp = RegExp(r'\d+\.?\d*');

    int lastMatchEnd = 0;
    for (final match in numberRegExp.allMatches(expr)) {
      // Add non-numeric characters before the match
      buffer.write(expr.substring(lastMatchEnd, match.start));

      // Format number and add
      final numberStr = match.group(0)!;
      final formatted =
          numberStr.contains('.')
              ? NumberFormat('#,###.########').format(double.parse(numberStr))
              : NumberFormat('#,###').format(int.parse(numberStr));
      buffer.write(formatted);

      lastMatchEnd = match.end;
    }

    // Add remaining non-number parts (if any)
    if (lastMatchEnd < expr.length) {
      buffer.write(expr.substring(lastMatchEnd));
    }

    return buffer.toString();
  }

  double _basicEvaluate(String expr) {
    List<String> tokens = [];
    String number = '';
    for (int i = 0; i < expr.length; i++) {
      if ('+-*/'.contains(expr[i])) {
        if (number.isNotEmpty) tokens.add(number);
        tokens.add(expr[i]);
        number = '';
      } else {
        number += expr[i];
      }
    }
    if (number.isNotEmpty) tokens.add(number);

    for (int i = 0; i < tokens.length; i++) {
      if (tokens[i] == '*' || tokens[i] == '/') {
        double left = double.parse(tokens[i - 1]);
        double right = double.parse(tokens[i + 1]);
        double res = tokens[i] == '*' ? left * right : left / right;
        tokens.replaceRange(i - 1, i + 2, [res.toString()]);
        i -= 1;
      }
    }

    double result = double.parse(tokens[0]);
    for (int i = 1; i < tokens.length; i += 2) {
      String op = tokens[i];
      double next = double.parse(tokens[i + 1]);
      result = op == '+' ? result + next : result - next;
    }

    return result;
  }
}
