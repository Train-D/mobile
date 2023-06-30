import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traind_app/features/tickets/presentation/controller/userValidBookedTickets_cubit/userValidBookedTickets_cubit.dart';

import '../../../../core/global/theme/app_color/app_color_light.dart';
import '../../../../core/services/services_locator.dart';
import '../../../../core/utils/components.dart';

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
                  colors: onBoardingBg,
                  child: Scaffold(
                      backgroundColor: transparent,
                      appBar: SharedComponents.defaultAppBar(context: context),
                      body: state is UserValidBookedTicketsLoadingState
                          ? Center(child: CircularProgressIndicator())
                          : Text('done')),
                ),
              );
            }));
  }
}
