import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';



class SharedComponents {
  static Widget defaultButton({
    double width = double.infinity,
    double height = 40,
    Color bgColor = Colors.blue,
    double radius = 0,
    bool upper = false,
    IconData icon = Icons.arrow_back,
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                upper ? text.toUpperCase() : text,
                style: const TextStyle(
                  color: Colors.white,
                ),
                
              ),
              SizedBox(width: 5.w,),
              Icon(icon)
            ],
          ),
        ),
      );
  static navigateTo(Widget page, BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: ((context) => page)));
  }

  static navigateToRemove(BuildContext context, Widget widget, {data}) =>
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ),
        (Route<dynamic> route) => false,
      );

  static navigateToReplace(Widget page, BuildContext context) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: ((context) => page)));
  }
}
