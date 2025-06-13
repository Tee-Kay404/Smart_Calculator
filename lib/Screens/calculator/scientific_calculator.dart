import 'package:calculator_project/Screens/calculator/reusable_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

class ScientificCalculator extends StatelessWidget {
  const ScientificCalculator({super.key});

  void showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => SizedBox(
            height: 60,
            width: 150,
            child: AlertDialog(
              title: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Unlock!',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.close_outlined),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              contentPadding: const EdgeInsets.only(
                top: 5,
                left: 10,
                right: 10,
                bottom: 25,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              content: Text(
                "This service is currently unavailable.",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Theme.of(context).colorScheme.inverseSurface,
            size: 18,
          ),
        ),
        title: Text(
          'Scientific Calculator',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.inverseSurface,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              height: 200,
              'assets/animations/sorry4.json',
              fit: BoxFit.fill,
              delegates: LottieDelegates(
                values: [
                  ValueDelegate.color(const ['**'], value: Colors.green),
                ],
              ),
            ),
            const Gap(20),
            Text(
              'Sorry! unlock premium \$3.99',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.inverseSurface,
              ),
            ),
            Text(
              'to gain access to this feature',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.inverseSurface,
              ),
            ),
            const Gap(20),
            ReusableButton(
              input: 'Unlock',
              onTap: () => showCustomDialog(context),
            ),
          ],
        ),
      ),
    );
  }
}
