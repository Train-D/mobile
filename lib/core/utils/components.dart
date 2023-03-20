import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:traind_app/core/global/theme/app_color/app_color_light.dart';



class SharedComponents {
  static Widget defaultButton({
    double width = double.infinity,
    double height = 40,
    double size = 20,
    Color bgColor = lightDefualtColor,
    Color iconColor = lightDefualtIconColor,
    double radius = 0,
    bool upper = false,
    bool withIcon = false,
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
                style: TextStyle(
                  color: Colors.white,
                  fontSize: size,
                  fontFamily: 'Inria Serif'
                ),
                
              ),
              if(withIcon)
               SizedBox(width: 5.w,),
              if(withIcon)
                Icon(icon, color: iconColor,size: 20,),
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
