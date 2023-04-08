import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:traind_app/core/global/theme/app_color/app_color_light.dart';
import 'package:traind_app/core/utils/app_sizes.dart';

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
    bool preIconFound = false,
    bool suffIconFound = false,
    IconData? preIcon,
    IconData? suffIcon,
    Function? suffPressed,
    Function? prePressed,
    double radius = 30,
    Color bgColor = Colors.grey,
    Color textColor = Colors.grey,
    bool focusedRadius = true,
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
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.sp,
            vertical: 0.sp,
          ),
          filled: true,
          fillColor: bgColor,
          labelText: label,
          labelStyle: TextStyle(
            fontFamily: 'Inria Serif',
            color: textColor,
          ),
          prefixIcon: preIconFound
              ? IconButton(
                  icon: Icon(preIcon),
                  onPressed: () {
                    prePressed!();
                  },
                )
              : null,
          suffixIcon: suffIconFound
              ? IconButton(
                  icon: Icon(suffIcon),
                  onPressed: () {
                    suffPressed!();
                  },
                )
              : null,
          //border: InputBorder.none,
          focusedBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(
              color: (focusedRadius ? lightDefualtColor : bgColor),
            ),
          ),
          border: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide.none,),
        ),
      );

  static Widget screenBg({
    required String imageUrl,
    required Widget child,
    required BuildContext context,
  }) =>
      Container(
        width: double.infinity,
        height: AppSizes.height(context),
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.fill,
        )),
        child: child,
      );
  
  static defualtAppBar(BuildContext context) => AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Container(
            margin: const EdgeInsets.only(
              left: 20,
              top: 20,
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: appBarBg,
            ),
            width: 32.sp,
            height: 32.sp,
            child: Padding(
              padding: EdgeInsets.only(
                left: 7.sp,
              ),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  )),
            )),
      );

  static linearGradientBg({
    required List<Color> colors,
    required Widget child, 
  }) =>
      Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: child,
      );
}
