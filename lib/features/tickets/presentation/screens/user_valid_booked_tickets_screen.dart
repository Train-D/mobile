import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:traind_app/features/tickets/presentation/controller/userValidBookedTickets_cubit/userValidBookedTickets_cubit.dart';
import 'package:traind_app/features/tickets/presentation/screens/ticket_screen.dart';

import '../../../../core/global/theme/app_color/app_color_light.dart';
import '../../../../core/services/services_locator.dart';
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
                      : SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: double.infinity,),
                             
                              buildTicket(
                                    context: context,
                                    startTime: '2:40 PM',
                                    endTime: '7:20 PM',
                                    idNumber: '9855',
                                    name: 'Hodaahmed',
                                    date: '30/06/2023',
                                    price: 10,
                                    classs: 'A',
                                    seatNumber: 1,
                                    coachNumber: 1,
                                    time: '04:40',
                                    from: 'Alexandria',
                                    to: 'Cairo'),
                                    
                            ],
                          ),
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
    Container(
      width: 95.w,
      height: 50.h,
      decoration: BoxDecoration(
        color: ticketColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Column(
        children: [
          SizedBox(height: 5.h,),
          SizedBox(
            height: 8.h,
            child: trainStack(
              context: context,
              time: time,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
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
          const SizedBox(
            height: 2,
          ),
          TicketsComponents.idNumberContainer(
            context: context,
            idNumber: idNumber,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
                TicketsComponents.twoText(
                  context: context,
                  title: AppString.date,
                  label: date,
                ),
                TicketsComponents.twoText(
            context: context,
            title: AppString.seat,
            label: '$classs$coachNumber-$seatNumber',
          ),
              ],
            ),
          ),
          
          const SizedBox(
            height: 10,
          ),
          cutsAndDivider(
            context: context,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TicketsComponents.priceRow(
                context: context,
                price: price,
              ),
            ],
          ),
        ],
      ),
    );
