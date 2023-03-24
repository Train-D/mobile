import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:traind_app/core/utils/app_constants.dart';
import 'package:traind_app/core/utils/components.dart';
import 'package:traind_app/features/tickets/presentation/components/date_picker.dart';
import 'package:traind_app/features/tickets/presentation/components/drop_down_button.dart';
import 'package:traind_app/features/tickets/presentation/components/label_field.dart';

class FromToScreen extends StatelessWidget {
  const FromToScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double h = AppConstants.height(context);
    double w = AppConstants.width(context);

    return SafeArea(
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/imgs/fromto.png'),
                fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Color.fromRGBO(
            111,
            82,
            70,
            0.24,
          ),
          body: Center(
            child: Container(
              height: h * 0.5,
              width: w * 0.8,
              child: Card(
                color: Color.fromRGBO(
                  255,
                  255,
                  255,
                  0.61,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17),
                ),
                child: LayoutBuilder(
                  builder: (ctx, constrains) => Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: constrains.maxHeight * 0.5,
                        padding: EdgeInsets.only(top: 30, left: 30, right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            labelField(
                                text: 'From', field: DropdownDefaultButton()),
                            labelField(text: 'To', field: DropdownDefaultButton())
                          ],
                        ),
                      ),
                      Container(
                        height: constrains.maxHeight * 0.2,
                        padding: EdgeInsets.only(left: 30, right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            labelField(
                                text: 'Date',
                                field: InkWell(
                                  onTap: () => datePicker(context),
                                  child: Text('press'),
                                )),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SharedComponents.defaultButton(
                              function: () {},
                              text: 'Search',
                              //size: 20.sp,
                              context: context,
                              width: constrains.maxWidth* 0.8,
                              height: constrains.maxHeight * 0.13,
                              radius: 8.sp,
                              withIcon: false),
                        ],
                      )
                    ],
                  ),
                  
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
