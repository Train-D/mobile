import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget onboarding({
  required String title,
  required String body,
  required String image,
  required BuildContext context,
}) =>
    Column(
      children: [
        Image(
          image: AssetImage(image),
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.displayLarge,
        ),
        SizedBox(
          height: 2.h,
        ),
        Text(
          body,
          style: Theme.of(context).textTheme.displayMedium,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 15.h,
        ),
      ],
    );
