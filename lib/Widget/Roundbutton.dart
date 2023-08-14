// ignore_for_file: file_names, must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';

class Roundbutton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color buttcolor;
  final TextStyle Style;
  final bool Loading;
  const Roundbutton(
      {super.key,
      required this.title,
      required this.onTap,
      this.Loading = false,
      required this.buttcolor,
      required this.Style});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: buttcolor, borderRadius: BorderRadius.circular(12)),
        child: Center(
            child: Loading
                ? const CircularProgressIndicator(
                    strokeWidth: 3,
                    color: Colors.white,
                  )
                : Text(
                    title,
                    style: Style,
                  )),
      ),
    );
  }
}
