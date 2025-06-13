import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  void showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            contentPadding: const EdgeInsets.only(
              top: 10,
              left: 20,
              right: 20,
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
                  children: [
                    const SizedBox(height: 15),
                    // const Text(
                    //   "Settings!",
                    //   style: TextStyle(
                    //     fontSize: 20,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                    const SizedBox(height: 20),
                    const Text(
                      "Unable to access device settings.",
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
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
          'Settings',
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
            'assets/animations/lock.json',
            fit: BoxFit.fill,
            delegates: LottieDelegates(
              values: [
                ValueDelegate.color(
                  const ['**'], // use actual keypath if known
                  value: Colors.green,
                ),
              ],
            ),
          ),
          Center(
            child: Text(
              'Open settings on mobile device',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.inverseSurface,
              ),
            ),
          ),
          Text(
            'and allow permissions',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.inverseSurface,
            ),
          ),
          Gap(20),
          ElevatedButton(
            onPressed: () => showCustomDialog(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 39, 206, 150),
              minimumSize: const Size(80, 50),
              padding: const EdgeInsets.symmetric(horizontal: 20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min, // so the button wraps the content
              children: [
                Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.surface,
                  ),
                ),
                const SizedBox(width: 8),
                Icon(
                  Icons.exit_to_app_outlined,
                  size: 18,
                  color: Theme.of(context).colorScheme.surface,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
