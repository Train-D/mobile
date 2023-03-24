import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget labelField({
  required String text,
  required dynamic field,
}) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$text:', style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w700, fontFamily: 'Inria Serif', color: Colors.black),),
        SizedBox(height: 1.h,),
        field
      ],
    );
