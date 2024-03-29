import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  AdaptativeButton({
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
      child: Text(label),
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
    )
        : ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Theme.of(context).primaryColor,
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
            //color: Theme.of(context).textTheme.button?.color,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
