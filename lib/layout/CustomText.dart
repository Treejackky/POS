// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final String? label;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final String? initialValue;
  final IconData? icon;
  final String? hintText;

  const InputText({
    this.label,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.initialValue,
    this.icon,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    // var font = MediaQuery.of(context).size.height * 0.015;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            icon != null
                ? Icon(
                    icon,
                    // size: font,
                  )
                : Container(),
            Text(
              //icon
              label ?? '',
              style: TextStyle(
                  // fontSize: font,
                  ),
            ),
          ],
        ),
        TextFormField(
            initialValue: initialValue,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              hintText: hintText,
            ),
            inputFormatters: [],
            validator: validator,
            onChanged: onChanged),
      ],
    );
  }
}
