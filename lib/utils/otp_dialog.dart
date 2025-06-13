import 'package:flutter/material.dart';

void showOTPDialog({
  required BuildContext context,
  required TextEditingController codeController,
  required VoidCallback onPressed,
}) {
  showDialog(
    context: context,
    builder:
        (_) => AlertDialog(
          title: Text('Enter OTP'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [TextField(controller: codeController)],
          ),
          actions: [TextButton(onPressed: () {}, child: Text('Done'))],
        ),
  );
}
