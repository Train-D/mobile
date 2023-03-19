
import 'package:flutter/material.dart';

Widget defaultButton({
  double width = double.infinity,
  double height = 40,
  Color bgColor = Colors.blue,
  double radius = 0,
  bool upper = true,
  required Function function,
  required String text,
}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: MaterialButton(
        onPressed: () {
          function();
        },
        child: Text(
          upper ? text.toUpperCase() : text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
