import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:traind_app/features/tickets/data/models/trip_info_model.dart';
import '../../../../core/global/theme/app_color/app_color_light.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_images.dart';
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
              appBar: SharedComponents.defaultAppBar(context: context),
              body: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SharedComponents.defaultBgContainer(
                      height: 75.h,
                      topRedius: 25.sp,
                      isLinearGradient: false,
                      bgColor: ticketColor,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 25.sp, vertical: 15.sp),
                    child: SingleChildScrollView(
                      child: Form(
                        child: Column(
                          children: [
                            Container(
                              height: 22.h,
                              width: 80.w,
                              decoration: BoxDecoration(
                                  color: cardColor,
                                  borderRadius: BorderRadius.circular(15.sp)),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: SingleChildScrollView(
                                    child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset(
                                            '${AppConstants.imagesUrl}$masterCard'),
                                        Text(
                                          AppString.expiryDate,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                  fontSize: 16.sp,
                                                  color: cardText),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 2.5.h,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        AppString.cardNumber,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                                fontSize: 16.sp,
                                                color: cardText),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          AppString.name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                  fontSize: 16.sp,
                                                  color: cardText),
                                        ),
                                        Text(
                                          AppString.debitCard,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                  fontSize: 15.sp,
                                                  color: fromToCardBgColor),
                                        )
                                      ],
                                    ),
                                  ],
                                )),
                              ),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            SharedComponents.defaultTextField(
                                controller: cubit.cardNumber,
                                type: TextInputType.number,
                                validate: (e) {
                                  return null;
                                },
                                bgColor: paymentTextFieldColor,
                                textColor: paymentTextFieldTextColor,
                                label: AppString.cardNumber,
                                radius: 15.sp,
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 38.w,
                                  child: SharedComponents.defaultTextField(
                                    controller: cubit.expiryYear,
                                    type: TextInputType.text,
                                    validate: (e) {
                                      return null;
                                    },
                                    bgColor: paymentTextFieldColor,
                                    textColor: paymentTextFieldTextColor,
                                    label: AppString.expiryYear,
                                    radius: 17.sp,
                                  ),
                                ),
                                //SizedBox(width: 5.w,),
                                SizedBox(
                                  width: 38.w,
                                  child: SharedComponents.defaultTextField(
                                    controller: cubit.expiryMonth,
                                    type: TextInputType.text,
                                    validate: (e) {
                                      return null;
                                    },
                                    bgColor: paymentTextFieldColor,
                                    textColor: paymentTextFieldTextColor,
                                    label: AppString.expiryMonth,
                                    radius: 17.sp,
                                    suffIconFound: false,
                                    preIconFound: false,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            SharedComponents.defaultTextField(
                              controller: cubit.cardHolderName,
                              type: TextInputType.text,
                              validate: (e) {
                                return null;
                              },
                              bgColor: paymentTextFieldColor,
                              textColor: paymentTextFieldTextColor,
                              label: AppString.cardName,
                              radius: 17.sp,
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            SharedComponents.defaultTextField(
                              controller: cubit.email,
                              type: TextInputType.text,
                              validate: (e) {
                                return null;
                              },
                              bgColor: paymentTextFieldColor,
                              textColor: paymentTextFieldTextColor,
                              label: AppString.yourEmail,
                              radius: 17.sp,
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                    width: 30.w,
                                    child: SharedComponents.defaultTextField(
                                      controller: cubit.cvvCode,
                                      type: TextInputType.number,
                                      validate: (e) {
                                        return null;
                                      },
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
                                          color: cardTextCvvColor),
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
                              height: 2.h,
                            ),
                            SharedComponents.defaultButton(
                                context: context,
                                function: () {
                                  /*cubit.getTrainInfo(const TripInfoModel(
                                    tripId: "7",
                                    tripDate: "2023-06-30",
                                  ));*/
                                  SharedComponents.navigateTo(
                                      const TicketScreen(), context);
                                },
                                text: AppString.buyTicket,
                                radius: 7.sp,
                                width: 35.w)
                          ],
                        ),
                      ),
                    ),
                  ),
                  /* SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 5.h,),
                        Align(
                          alignment: Alignment.topCenter,
                          child: SizedBox(width: 80.w,
                          child: Image.asset('${AppConstants.imagesUrl}$card'),
                          ),
                        ),
                       
                      ],
                    ),
                  ),*/
                ],
              ),
            )),
      );
    });
  }
}
