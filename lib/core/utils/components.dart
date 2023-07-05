import 'dart:io';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../features/tickets/presentation/components/reusable_component/choose_seats_screen_components.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../global/theme/app_color/app_color_light.dart';
import 'app_sizes.dart';

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
    double? textSize,
    required BuildContext context,
    required Function function,
    required String text,
    bool cancel = false,
  }) =>
      Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(
            width: cancel ? 2 : 0,
            color: cancel ? trainUnAvailableSeatColor : transparent,
          ),
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
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontSize: textSize,
                    ),
              ),
              if (withIcon)
                Row(
                  children: [
                    SizedBox(
                      width: 2.w,
                    ),
                    Icon(
                      icon,
                      color: iconColor,
                      size: iconSize,
                    ),
                  ],
                )
            ],
          ),
        ),
      );

  static Widget defaultTextButton({
    required Function function,
    required String text,
    required BuildContext context,
    int size = 18,
  }) =>
      TextButton(
        onPressed: () {
          function();
        },
        child: Text(
          text.toUpperCase(),
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: textButtonColor, fontSize: size.sp),
        ),
      );
  static showToast({
    required String text,
    required color,
  }) {
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16,
    );
  }

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
    bool isSuffIconImage = false,
    bool readOnly = false,
    dynamic imageSuffIcon,
    IconData? preIcon,
    IconData? suffIcon,
    Function? suffPressed,
    Function? prePressed,
    double radius = 30,
    Color bgColor = Colors.grey,
    Color textColor = Colors.grey,
    bool focusedRadius = true,
  }) =>
      TextFormField(
        readOnly: readOnly,
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
          errorStyle: const TextStyle(fontWeight: FontWeight.bold),
          filled: true,
          fillColor: bgColor,
          labelText: label,
          labelStyle: TextStyle(
              fontFamily: 'Inria Serif', color: textColor, fontSize: 17.sp),
          prefixIcon: preIconFound
              ? IconButton(
                  iconSize: 20.sp,
                  icon: Icon(preIcon),
                  onPressed: () {
                    prePressed!();
                  },
                )
              : null,
          suffixIcon: suffIconFound
              ? isSuffIconImage
                  ? imageSuffIcon
                  : IconButton(
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
            borderSide: BorderSide.none,
          ),
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

  static defaultAppBar({
    required BuildContext context,
    bool chooseSeatsScreenAppBar = false,
  }) =>
      AppBar(
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
                    FocusScope.of(context)
                                            .requestFocus(new FocusNode());
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  )),
            )),
        //if(chooseSeatsScreenAppBar){}
        title: chooseSeatsScreenAppBar
            ? ChooseSeatsComponents.appBarTitle(context: context)
            : const Text(''),
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

  static profilePicture({
    required dynamic image,
    required double radius,
    bool isProfileImage = false,
    Color bgColor = cameraBG,
    dynamic fit = BoxFit.none,
    double? imgHeigh,
    double? imgWidth,
  }) =>
      ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: isProfileImage == false
              ? Image(
                  width: imgHeigh,
                  height: imgWidth,
                  fit: fit,
                  image: AssetImage(
                    '$image',
                  ))
              : SizedBox(width: imgWidth, height: imgHeigh, child: image));

  static defaultBgContainer({
    double width = double.infinity,
    required double height,
    required double topRedius,
    double bottomRedius = 0,
    required bool isLinearGradient,
    List<Color> linearGradientbgColor = const [Colors.black, Colors.black],
    Color bgColor = Colors.black,
    Widget child = const Text(''),
  }) =>
      Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(topRedius),
              topRight: Radius.circular(topRedius),
              bottomLeft: Radius.circular(bottomRedius),
              bottomRight: Radius.circular(bottomRedius)),
          gradient: isLinearGradient
              ? LinearGradient(
                  colors: linearGradientbgColor,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )
              : null,
          color: isLinearGradient == false ? bgColor : null,
        ),
        child: child,
      );
  static showAlertDialog(
      {required BuildContext context, required String title, required String message, required List<Widget> actions}) {
    showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Color.fromRGBO(255, 255, 255, 0.85),
              title: Text(
                title,
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      color: Color.fromRGBO(103, 79, 68, 1),
                      //fontSize: 14.sp
                    ),
              ),
              content: Text(
                message,
                style:
                    Theme.of(context).textTheme.displayMedium!.copyWith(
                          color: Color.fromRGBO(103, 79, 68, 1),
                          //fontSize: 14.sp
                        ),
                        
              ), 
              actions: actions,
              
              contentPadding:  EdgeInsets.symmetric(vertical: 20.sp, horizontal: 20.sp),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                Radius.circular(10),
              )),
            );
          });
  }
}
