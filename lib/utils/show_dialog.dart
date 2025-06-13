import 'package:flutter/material.dart';

Future showDialogMessage(BuildContext context, String message) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(title: Text(message)),
  );
}
