import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'sign up',
          style: TextStyle(
            color: Colors.black,
            fontSize: 40.sp,
          ),
        ),
      ),
    );
  }
}
