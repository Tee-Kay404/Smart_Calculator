import 'package:calculator_project/Screens/calculator/drawer.dart';
import 'package:calculator_project/Screens/calculator/history.dart';
import 'package:calculator_project/Screens/calculator/scientific_calculator.dart';
import 'package:flutter/material.dart';
import 'package:calculator_project/providers/calculator_provider.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CalculatorProvider>();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          Theme(
            data: Theme.of(
              context,
            ).copyWith(splashFactory: NoSplash.splashFactory),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => History()),
                    );
                  },
                  icon: Icon(
                    Icons.history_outlined,
                    color: Theme.of(context).colorScheme.inverseSurface,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ScientificCalculator(),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.science_outlined,
                    color: Theme.of(context).colorScheme.inverseSurface,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: Theme(
        data: Theme.of(context).copyWith(splashFactory: NoSplash.splashFactory),
        child: MyDrawer(),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Gap(70),
          Align(
            alignment: Alignment.centerRight,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              reverse: true,
              child: Text(
                provider.expression,
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.inverseSurface,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              reverse: true,
              child: Text(
                provider.result,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.inverseSurface,
                ),
              ),
            ),
          ),

          Gap(68),
          //  button grid
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                // height: 300,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 15,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 40,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const SizedBox(height: 10),
                    _buildRowButtons(context, [
                      'C',
                      '/',
                      'x',
                      Icons.cancel_presentation_outlined,
                    ]),
                    SizedBox(height: 5),
                    _buildRowButtons(context, ['7', '8', '9', '-']),
                    SizedBox(height: 5),
                    _buildRowButtons(context, ['4', '5', '6', '+']),
                    SizedBox(height: 5),
                    _buildRowButtons(context, ['1', '2', '3', '.']),
                    SizedBox(height: 5),
                    buildLastRowButton(context, ['00', '0', '=']),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// build a row of buttons
Widget _buildRowButtons(BuildContext context, List<dynamic> buttons) {
  final operatorButtons = [
    'C',
    '/',
    'x',
    '-',
    '+',
    '.',
    Icons.cancel_presentation_outlined,
  ];

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children:
        buttons.map((button) {
          final isOperator = operatorButtons.contains(button);
          return ElevatedButton(
            onPressed: () {
              context.read<CalculatorProvider>().buttonPressed(button);
            },
            style: ElevatedButton.styleFrom(
              splashFactory: NoSplash.splashFactory,
              backgroundColor:
                  isOperator
                      ? Theme.of(context).colorScheme.secondary
                      : Theme.of(context).colorScheme.inversePrimary,
              foregroundColor: Colors.black,
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(20),
              // minimumSize: button == '=' ? Size(60, 140) : Size(60, 70),
            ),
            child:
                button is IconData
                    ? Icon(
                      button,
                      color: Theme.of(context).colorScheme.surface,
                      size: 28,
                    )
                    : Align(
                      alignment: Alignment.center,
                      child: Text(
                        button.toString(),
                        style: TextStyle(
                          fontSize: 24,
                          color:
                              isOperator
                                  ? Theme.of(context).colorScheme.surface
                                  : Theme.of(
                                    context,
                                  ).colorScheme.inverseSurface,
                        ),
                      ),
                    ),
          );
        }).toList(),
  );
}

Widget buildLastRowButton(BuildContext context, List<String> text) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children:
        text.map((label) {
          final isEquals = label == '=';

          return ElevatedButton(
            onPressed: () {
              context.read<CalculatorProvider>().buttonPressed(label);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  isEquals
                      ? Theme.of(context).colorScheme.secondary
                      : Theme.of(context).colorScheme.inversePrimary,
              foregroundColor: Theme.of(context).colorScheme.surface,
              shape:
                  isEquals
                      ? RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35),
                      )
                      : const CircleBorder(),
              minimumSize: isEquals ? const Size(155, 60) : const Size(70, 70),
              splashFactory: NoSplash.splashFactory,
              elevation: 4,
              shadowColor: Theme.of(context).shadowColor,
            ),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color:
                    isEquals
                        ? Theme.of(context).colorScheme.surface
                        : Theme.of(context).colorScheme.inverseSurface,
              ),
            ),
          );
        }).toList(),
  );
}
