import 'package:calculator_project/Screens/calculator/reusable_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

class History extends StatelessWidget {
  const History({super.key});

  void showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            contentPadding: const EdgeInsets.only(
              top: 10,
              left: 20,
              right: 10,
              bottom: 20,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            content: Stack(
              children: [
                // Cancel button
                Positioned(
                  right: 0,
                  top: 0,
                  child: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    // const Text(
                    //   "Unlock",
                    //   style: TextStyle(
                    //     fontSize: 20,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                    const SizedBox(height: 20),
                    const Text(
                      "Sorry! no data was found.",
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    // const SizedBox(height: 20),
                  ],
                ),
              ],
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
          'History',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.inverseSurface,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            height: 200,
            'assets/animations/nodata2.json',
            fit: BoxFit.fill,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sorry! no data was found',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.inverseSurface,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Gap(20),
          ReusableButton(
            input: 'Try Again',
            onTap: () => showCustomDialog(context),
          ),
        ],
      ),
    );
  }
}
