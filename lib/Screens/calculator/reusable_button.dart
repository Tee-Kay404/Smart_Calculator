import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  final String input;
  final VoidCallback onTap;
  const ReusableButton({super.key, required this.input, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 39, 206, 150),
        minimumSize: Size(80, 50),
      ),
      child: Text(
        input,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Theme.of(context).colorScheme.surface,
        ),
      ),
    );
  }
}
