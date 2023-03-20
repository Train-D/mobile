import 'package:flutter/material.dart';

Widget onboarding({required String title, required String body, required String image, required BuildContext context}) => Column(
      children: [
         Image(
                  image: AssetImage(
                      image),),
              Text(title,
                  style: Theme.of(context).textTheme.displayLarge),
              const SizedBox(
                height: 2,
              ),
              Text(
                body,
                style: Theme.of(context).textTheme.displayMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 15,
              ),
      ],
    );
