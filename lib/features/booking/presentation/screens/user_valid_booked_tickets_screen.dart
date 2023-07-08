import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/utils/app_sizes.dart';
import '../controller/userValidBookedTickets_cubit/userValidBookedTickets_cubit.dart';
import 'ticket_screen.dart';

import '../../../../core/global/theme/app_color/app_color_light.dart';
import '../../../../core/services/services_locator.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/components.dart';
import '../../data/models/fourth screen/ticket_info_model.dart';
import '../components/reusable_component/tickets_components.dart';

class UserValidBookedTicketsScreen extends StatelessWidget {
  const UserValidBookedTicketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                UserValidBookedTicketsCubit(sl(), sl(), sl(), sl())
                  ..getUserValidBookedTickets(),
          ),
        ],
        child: BlocConsumer<UserValidBookedTicketsCubit,
            UserValidBookedTicketsState>(listener: (context, state) {
          UserValidBookedTicketsCubit cubit =
              UserValidBookedTicketsCubit.get(context);
          if (state is CancelUserTicketFailureState ||
              state is GetPaymentIdFailureState ||
              state is ReturnTicketPriceToUserFailureState) {
            //Navigator.pop(context);
            SharedComponents.showAlertDialog(
                context: context,
                title: 'Error!',
                message: 'Connection Error',
                actions: [
                  // ignore: use_build_context_synchronously
                  SharedComponents.defaultButton(
                    radius: 10.sp,
                    width: 20.w,
                    context: context,
                    function: () {
                      Navigator.pop(context);
                    },
                    text: 'Ok',
                  )
                ]);
          } else if (state is CancelUserTicketSuccessState){
           // Navigator.pop(context);
            if (cubit.cancelResponse == 'The reservation has been cancelled'){
              cubit.getUserValidBookedTickets();
              final snackBar = SnackBar(
                content: Text(cubit.cancelResponse),
                backgroundColor: lightDefualtColor,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              // SharedComponents.showToast(
              //   text: cubit.cancelResponse,
              //   color: Colors.green,
              // );
            } else {
              final snackBar = SnackBar(
                content: Text(cubit.cancelResponse),
                backgroundColor: Colors.red,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              // SharedComponents.showToast(
              //   text: cubit.cancelResponse,
              //   color: Colors.red,
              // );
            }
          }
        }, builder: (context, state) {
          UserValidBookedTicketsCubit cubit =
              UserValidBookedTicketsCubit.get(context);
          return SharedComponents.linearGradientBg(
            colors: profileBg,
            child: Scaffold(
          backgroundColor: transparent,
          appBar: SharedComponents.defaultAppBar(context: context),
          body: state is UserValidBookedTicketsLoadingState ||
                  state is GetPaymentIdLoadingState ||
                  state is ReturnTicketPriceToUserLoadingState ||
                  state is CancelUserTicketLoadingState
              ? const Center(child: CircularProgressIndicator())
              : cubit.userValidBookedTicketsModel.userValidBookedTickets
                      .isEmpty
                  ? Center(
                      child: Text(
                        'No Booked Tickets',
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(
                              color: trainUnAvailableSeatColor,
                              fontSize: 20,
                            ),
                      ),
                    )
                  : SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          Text(
                            'Your Tickets',
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                  color: trainUnAvailableSeatColor,
                                  fontSize: 20,
                                ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(children: [
                            ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: cubit.userValidBookedTicketsModel
                                  .userValidBookedTickets.length,
                              itemBuilder: (context, index) => buildTicket(
                                  context: context,
                                  cancel: () async {
                                    showCancelTicketAlertDialog(
                                        context: context,
                                        cancel: () async {
                                          Navigator.pop(context);
                                          var ticketId = cubit
                                              .userValidBookedTicketsModel
                                              .userValidBookedTickets[index]
                                                  ['ticketId']
                                              .toString();
                                          var price = cubit
                                              .userValidBookedTicketsModel
                                              .userValidBookedTickets[index]
                                                  ['price']
                                              .toInt();
                                          String? paymentId = await cubit
                                              .getPaymentId(ticketId);
                                          if (paymentId != null) {
                                            await cubit.returnTicketPrice(
                                                paymentId, price);
                                            await cubit
                                                .cancelUserTicket(ticketId);
                                          }
                                        });
                                  },
                                  name: cubit.userValidBookedTicketsModel.userValidBookedTickets[index]
                                      ['passengerName'],
                                  price: cubit.userValidBookedTicketsModel
                                          .userValidBookedTickets[index]
                                      ['price'],
                                  duration: cubit
                                          .userValidBookedTicketsModel
                                          .userValidBookedTickets[index]
                                      ['duration'],
                                  startTime: cubit
                                          .userValidBookedTicketsModel
                                          .userValidBookedTickets[index]
                                      ['startTime'],
                                  endTime: cubit.userValidBookedTicketsModel
                                          .userValidBookedTickets[index]
                                      ['endTime'],
                                  idNumber: cubit.userValidBookedTicketsModel.userValidBookedTickets[index]['ticketId'].toString(),
                                  date: cubit.userValidBookedTicketsModel.userValidBookedTickets[index]['date'],
                                  classs: cubit.userValidBookedTicketsModel.userValidBookedTickets[index]['className'],
                                  seatNumber: cubit.userValidBookedTicketsModel.userValidBookedTickets[index]['seatNumber'].toInt(),
                                  coachNumber: cubit.userValidBookedTicketsModel.userValidBookedTickets[index]['coachNumber'].toInt(),
                                  from: cubit.userValidBookedTicketsModel.userValidBookedTickets[index]['from'],
                                  to: cubit.userValidBookedTicketsModel.userValidBookedTickets[index]['to']),
                            ),
                          ])
                        ],
                      ),
                    ),
            ),
          );
        }));
  }
}

Widget buildTicket({
  required BuildContext context,
  required String startTime,
  required String endTime,
  required String idNumber,
  required String date,
  required String classs,
  required int seatNumber,
  required int coachNumber,
  required String from,
  required String to,
  required String name,
  required String duration,
  required double price,
  required Function cancel,
}) =>
    Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.sp,
        horizontal: 20.sp,
      ),
      child: Container(
        //width: 400.w,
        height: 24.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.sp),
          gradient: const LinearGradient(
            colors: ticketColor,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.sp, horizontal: 10.sp),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: TicketsComponents.twoText(
                        context: context,
                        title: from,
                        label: startTime,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Image(
                            image: AssetImage(
                              '${AppConstants.vectorsUrl}$smallTicketShape',
                            ),
                          ),
                          SizedBox(
                            height: 1.5.h,
                          ),
                          Text(
                            '$coachNumber$classs-$seatNumber',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w100,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TicketsComponents.twoText(
                        context: context,
                        title: to,
                        label: endTime,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Center(
                  child: Container(
                    width: 80.w,
                    height: 0.1.h,
                    color: lightColor,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    top: 20.sp,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'ID',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                SizedBox(
                                  width: 1.5.w,
                                ),
                                Text(
                                  idNumber,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w100,
                                      ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Text(
                              date,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w100,
                                  ),
                            ),
                          ],
                        ),
                        // SizedBox(
                        //   width: 4.w,
                        // ),

                        Row(
                          children: [
                            SharedComponents.defaultButton(
                              context: context,
                              function: () {
                                TicketInfoModel ticketDetailsModel =
                                    TicketInfoModel(
                                  from: from,
                                  to: to,
                                  startTime: startTime,
                                  endTime: endTime,
                                  ticketId: idNumber,
                                  passengerName: name,
                                  date: date,
                                  className: classs,
                                  coachNumber: coachNumber,
                                  seatNumber: seatNumber,
                                  price: price,
                                  duration: duration,
                                );
                                SharedComponents.navigateTo(
                                  TicketScreen(
                                      ticketInfoModel: ticketDetailsModel),
                                  context,
                                );
                              },
                              text: 'View',
                              width: 20.w,
                              radius: 7.sp,
                              height: 4.5.h,
                              textSize: 15.sp,
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            SharedComponents.defaultButton(
                              context: context,
                              function: () {
                                cancel();
                              },
                              text: 'Cancel',
                              width: 20.w,
                              radius: 7.sp,
                              height: 4.5.h,
                              textSize: 15.sp,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

dynamic showCancelTicketAlertDialog({
  required BuildContext context,
  required Function cancel,
}) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return TicketsComponents.defaultAlertDialog(
          height: 190,
          content: cancelTicketAlertDialogContent(
            context: context,
            cancel: cancel,
          ));
    },
  );
}

Widget cancelTicketAlertDialogContent({
  required BuildContext context,
  required Function cancel,
}) =>
    Padding(
      padding: const EdgeInsetsDirectional.only(
        top: 60,
      ),
      child: Column(
        children: [
          Text(
            "Sure Cancel The Ticket ?",
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SharedComponents.defaultButton(
                context: context,
                function: () {
                  Navigator.pop(context);
                },
                text: 'No',
                width: 100,
                radius: AppSizes.defaultBottomRadius,
                textSize: 16,
                bgColor: chooseSeatsCancelButtonBg,
                cancel: true,
              ),
              SharedComponents.defaultButton(
                context: context,
                function: () {
                  cancel();
                },
                text: 'Yes',
                width: 100,
                radius: AppSizes.defaultBottomRadius,
                textSize: 16,
              ),
            ],
          ),
        ],
      ),
    );
