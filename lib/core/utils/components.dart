import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:traind_app/core/global/theme/app_color/app_color_light.dart';

class SharedComponents {
  static Widget defaultButton({
    double width = double.infinity,
    double height = 40,
    double size = 20,
    Color bgColor = lightDefualtColor,
    bool withIcon = false,
    Color iconColor = lightDefualtIconColor,
    IconData icon = Icons.arrow_back,
    double iconSize = 10,
    double radius = 0,
    bool upper = false,
    required BuildContext context,
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
                style: Theme.of(context).textTheme.displayMedium,
              ),
              if (withIcon)
                Icon(
                  icon,
                  color: iconColor,
                  size: iconSize,
                ),
            ],
          ),
        ),
      );

  static Widget defaultTextButton({
    required Function function,
    required String text,
    required BuildContext context,
  }) =>
      TextButton(
        onPressed: () {
          function();
        },
        child: Text(
          text.toUpperCase(),
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: textButtonColor,
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

  static Widget defaultTextField({
    required TextEditingController controller,
    required TextInputType type,
    required String? Function(String?) validate,
    Function? onSubmit,
    Function? onChange,
    bool password = false,
    required String label,
    IconData? preIcon,
    IconData? suffIcon,
    Function? suffPressed,
    Function? prePressed,
    double radius = 0,
    Color bgColor = Colors.grey,
    Color textColor = Colors.grey,
    bool focusedRadius = false,
    //Color borderCol = Colors.black
  }) =>
      TextFormField(
        controller: controller,
        keyboardType: type,
        validator: validate,
        onFieldSubmitted: (value) {
          onSubmit!(value);
        },
        onChanged: (value) {
          onChange!(value);
        },
        obscureText: password,
        decoration: InputDecoration(
          filled: true,
          fillColor: bgColor,
          labelText: label,
          labelStyle: TextStyle(
            fontFamily: 'Inria Serif',
            color: textColor,
          ),
          prefixIcon: IconButton(
            icon: Icon(preIcon),
            onPressed: () {
              prePressed!();
            },
          ),
          suffixIcon: IconButton(
            icon: Icon(suffIcon),
            onPressed: () {
              suffPressed!();
            },
          ),
          //border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(
              color: (focusedRadius ? lightDefualtColor : bgColor),
            ),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide.none),
        ),
      );

  static Widget screenBg({
    required String imageUrl,
    required Widget child,
    required BuildContext context,
  }) =>
      Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.cover,
        )),
        child: child,
      );
  static defualtAppBar(BuildContext context) => AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Container(
            margin: EdgeInsets.only(left: 20, top: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: appBarBg,
            ),
            width: 30.sp,
            height: 30.sp,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ))),
      );
}
