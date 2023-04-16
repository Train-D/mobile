import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/global/theme/app_color/app_color_light.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/components.dart';
import '../controller/payment_cubit/payment_cubit.dart';
import 'ticket_screen.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentCubit, PaymentState>(builder: (context, state) {
      PaymentCubit cubit = PaymentCubit.get(context);
      return SafeArea(
        child: SharedComponents.linearGradientBg(
            colors: profileBg,
            child: Scaffold(
              backgroundColor: transparent,
              resizeToAvoidBottomInset: false,
              appBar: SharedComponents.defaultAppBar(context),
              body: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SharedComponents.defaultBgContainer(
                      height: 70.h,
                      topRedius: 35.sp,
                      isLinearGradient: false,
                      bgColor: ticketColor,
                      child: Padding(
                        padding: EdgeInsets.all(25.sp),
                        child: SingleChildScrollView(
                          child: Form(
                            child: Column(
                              children: [
                                SharedComponents.defaultTextField(
                                    controller: cubit.cardNumber,
                                    type: TextInputType.number,
                                    validate: (e) {},
                                    bgColor: paymentTextFieldColor,
                                    textColor: paymentTextFieldTextColor,
                                    label: AppString.cardNumber,
                                    radius: 17.sp,
                                    suffIconFound: true,
                                    isSuffIconImage: true,
                                    imageSuffIcon: Padding(
                                      padding: EdgeInsets.only(right: 15.sp),
                                      child: SizedBox(
                                        height: 1.h,
                                        width: 1.w,
                                        child: Image.asset(
                                            '${AppConstants.imagesUrl}$masterCard'),
                                      ),
                                    )),
                                SizedBox(
                                  height: 2.h,
                                ),
                                SharedComponents.defaultTextField(
                                  controller: cubit.expiryDate,
                                  type: TextInputType.text,
                                  validate: (e) {},
                                  bgColor: paymentTextFieldColor,
                                  textColor: paymentTextFieldTextColor,
                                  label: AppString.expiryDate,
                                  radius: 17.sp,
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                SharedComponents.defaultTextField(
                                  controller: cubit.cardHolderName,
                                  type: TextInputType.text,
                                  validate: (e) {},
                                  bgColor: paymentTextFieldColor,
                                  textColor: paymentTextFieldTextColor,
                                  label: AppString.cardName,
                                  radius: 17.sp,
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                        width: 30.w,
                                        child:
                                            SharedComponents.defaultTextField(
                                          controller: cubit.cvvCode,
                                          type: TextInputType.number,
                                          validate: (e) {},
                                          bgColor: paymentTextFieldColor,
                                          textColor: paymentTextFieldTextColor,
                                          label: AppString.cvv,
                                          radius: 17.sp,
                                        )),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Expanded(
                                        child: Text(
                                      AppString.cvvDesc,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!
                                          .copyWith(
                                              fontSize: 15.sp,
                                              color: CardTextCvvColor),
                                      textAlign: TextAlign.center,
                                    ))
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                        value: cubit.saveCardData,
                                        onChanged: (e) {
                                          cubit.changeCheckboxValue();
                                        }),
                                    Text(
                                      AppString.savePaymentData,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!
                                          .copyWith(fontSize: 15.sp),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                SharedComponents.defaultButton(
                                    context: context,
                                    function: () {
                                      SharedComponents.navigateTo(
                                          TicketScreen(), context);
                                    },
                                    text: AppString.buyTicket,
                                    radius: 7.sp,
                                    width: 35.w)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      );
    });
  }
}
