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
                      ? Center(child: CircularProgressIndicator())
                      : Column(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('All Your Valid Tickets', style: Theme.of(context).textTheme.displayLarge,),
                          Expanded(child: 
                          ListView.builder(itemCount: cubit.userValidBookedTicketsModel.userValidBookedTickets.length,
                            itemBuilder:(context, index) => buildTicket(
                                  context: context,
                                  startTime: cubit.userValidBookedTicketsModel.userValidBookedTickets[index]['startTime'],
                                  endTime: cubit.userValidBookedTicketsModel.userValidBookedTickets[index]['endTime'],
                                  idNumber: cubit.userValidBookedTicketsModel.userValidBookedTickets[index]['ticketId'].toString(),
                                  name: cubit.userValidBookedTicketsModel.userValidBookedTickets[index]['passengerName'],
                                  date: cubit.userValidBookedTicketsModel.userValidBookedTickets[index]['date'],
                                  price: cubit.userValidBookedTicketsModel.userValidBookedTickets[index]['price'].toDouble(),
                                  classs: cubit.userValidBookedTicketsModel.userValidBookedTickets[index]['className'],
                                  seatNumber: cubit.userValidBookedTicketsModel.userValidBookedTickets[index]['seatNumber'].toInt(),
                                  coachNumber: cubit.userValidBookedTicketsModel.userValidBookedTickets[index]['coachNumber'].toInt(),
                                  time: cubit.userValidBookedTicketsModel.userValidBookedTickets[index]['duration'],
                                  from: cubit.userValidBookedTicketsModel.userValidBookedTickets[index]['from'],
                                  to: cubit.userValidBookedTicketsModel.userValidBookedTickets[index]['to']),)
                          )
                        ],
                      ),
                ),
              ));
            }));
  }
}

Widget buildTicket(
        {required BuildContext context,
        required String startTime,
        required String endTime,
        required String idNumber,
        required String name,
        required String date,
        required double price,
        required String classs,
        required int seatNumber,
        required int coachNumber,
        required String time,
        required String from,
        required String to}) =>
    Padding(
      padding: EdgeInsets.all(15.sp),
      child: Container(
        width: 95.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: ticketColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 2.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.sp,
                  vertical: 10.sp,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TicketsComponents.twoText(
                      context: context,
                      title: 'Ticket ID',
                      label:  idNumber,
                    ),
                    TicketsComponents.twoText(
                      context: context,
                      title: AppString.seat,
                      label: '$classs$coachNumber-$seatNumber',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8.h,
                child: trainStack(
                  context: context,
                  time: time,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.sp,
                  vertical: 10.sp,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TicketsComponents.twoText(
                      context: context,
                      title: from,
                      label: startTime,
                    ),
                    TicketsComponents.twoText(
                      context: context,
                      title: to,
                      label: endTime,
                    ),
                  ],
                ),
              ),
             SizedBox(
                height: 2.h,
              ),
            
              divider(
                context: context,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.sp,
                  vertical: 10.sp,
                ),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   TicketsComponents.twoText(
                      context: context,
                      title: AppString.date,
                      label: date,
                    ),
                  TicketsComponents.priceRow(
                    context: context,
                    price: price,
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );


Widget divider({
  required BuildContext context,
}) =>
    SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          Image(
            image: AssetImage(
              '${AppConstants.vectorsUrl}$ticketLeftCut',
            ),
          ),
          Expanded(
            child: Image(
              fit: BoxFit.fitWidth,
              image: AssetImage(
                '${AppConstants.vectorsUrl}Line 42.png',
              ),
            ),
          ),
          Image(
            image: AssetImage(
              '${AppConstants.vectorsUrl}$ticketRightCut',
            ),
          ),
        ],
      ),
    );

