import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;
  final Function()? onTap;
  const SquareTile({super.key, required this.imagePath, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          shape: BoxShape.rectangle,
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset(imagePath, height: 30),
        ),
      ),
    );
  }
}
