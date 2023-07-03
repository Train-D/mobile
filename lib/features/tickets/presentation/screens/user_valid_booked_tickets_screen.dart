import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:traind_app/features/tickets/presentation/controller/userValidBookedTickets_cubit/userValidBookedTickets_cubit.dart';
import 'package:traind_app/features/tickets/presentation/screens/ticket_screen.dart';

import '../../../../core/global/theme/app_color/app_color_light.dart';
import '../../../../core/services/services_locator.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/components.dart';
import '../components/reusable_component/tickets_components.dart';

class UserValidBookedTicketsScreen extends StatelessWidget {
  const UserValidBookedTicketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                UserValidBookedTicketsCubit(sl())..getUserValidBookedTickets(),
          ),
        ],
        child: BlocConsumer<UserValidBookedTicketsCubit,
                UserValidBookedTicketsState>(
            listener: (context, state) {},
            builder: (context, state) {
              UserValidBookedTicketsCubit cubit =
                  UserValidBookedTicketsCubit.get(context);
              return SafeArea(
                  child: SharedComponents.linearGradientBg(
                colors: profileBg,
                child: Scaffold(
                  backgroundColor: transparent,
                  appBar: SharedComponents.defaultAppBar(context: context),
                  body: state is UserValidBookedTicketsLoadingState
                      ? const Center(child: CircularProgressIndicator())
                      : Column(
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
                            Expanded(
                                child: ListView.builder(
                                  itemCount: cubit.userValidBookedTicketsModel
                                      .userValidBookedTickets.length,
                                  itemBuilder: (context, index) => buildTicket(
                                      context: context,
                                      startTime: cubit.userValidBookedTicketsModel.userValidBookedTickets[index]
                                          ['startTime'],
                                      endTime: cubit.userValidBookedTicketsModel.userValidBookedTickets[index]
                                          ['endTime'],
                                      idNumber: cubit
                                          .userValidBookedTicketsModel
                                          .userValidBookedTickets[index]
                                              ['ticketId']
                                          .toString(),
                                      date: cubit.userValidBookedTicketsModel
                                          .userValidBookedTickets[index]['date'],
                                      classs: cubit.userValidBookedTicketsModel
                                          .userValidBookedTickets[index]['className'],
                                      seatNumber: cubit.userValidBookedTicketsModel.userValidBookedTickets[index]['seatNumber'].toInt(),
                                      coachNumber: cubit.userValidBookedTicketsModel.userValidBookedTickets[index]['coachNumber'].toInt(),
                                      from: cubit.userValidBookedTicketsModel.userValidBookedTickets[index]['from'],
                                      to: cubit.userValidBookedTicketsModel.userValidBookedTickets[index]['to']),
                                ),)
                          ],
                        ),
                ),
              ));
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
  //required Function viewFun,
  //required Function cancelFun
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20,),
      child: Container(
        width: 400,
        height: 200,
        decoration: BoxDecoration(
          color: smallTicketColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                  width:  90,
                  height: 40,
                  child: TicketsComponents.twoText(
                    context: context,
                    title: from,
                    label: startTime,
                  )),
                  Column(
                    //mainAxisAlignment:  MainAxisAlignment.center,
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage(
                          '${AppConstants.vectorsUrl}$smallTicketShape',
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        '$coachNumber$classs-$seatNumber',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.w100,
                            ),
                      ),
                    ],
                  ),  SizedBox(
                  width:  90,
                  height: 40,
                  child:
                  TicketsComponents.twoText(
                    context: context,
                    title: to,
                    label: endTime,
                  )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  width: 320,
                  height: 1,
                  color: lightColor,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  top: 20,
                ),
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
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            Text(
                              idNumber,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w100,
                                  ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          date,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.w100,
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Row(
                      children: [
                        SharedComponents.defaultButton(
                          context: context,
                          function: () {},
                          text: 'View',
                          width: 90,
                          radius: 5,
                          textSize: 16,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        SharedComponents.defaultButton(
                          context: context,
                          function: () {},
                          text: 'Cancel',
                          width: 90,
                          radius: 5,
                          textSize: 16,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
