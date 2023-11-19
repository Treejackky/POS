// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:food_cashier/theme.dart/color.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;

  const CustomButton(
      {Key? key, required this.text, required this.onPressed, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: color ?? button_defalut,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                text,
              ),
            ),
          ),
        ],
      ),
      onPressed: onPressed,
    );
  }
}
