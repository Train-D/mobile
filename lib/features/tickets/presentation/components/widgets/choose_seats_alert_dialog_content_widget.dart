// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traind_app/features/tickets/presentation/controller/choose_seats/choose_seats_cubit.dart';
import 'package:traind_app/features/tickets/presentation/controller/choose_seats/choose_seats_state.dart';

import '../../../../../core/utils/app_sizes.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/components.dart';
import '../../components/reusable_component/tickets_components.dart';

Widget chooseSeatsAlertDialogContent({
  required BuildContext context,
  required String seatNumber,
}) =>
    BlocConsumer<ChooseSeatsCubit, ChooseSeatsState>(
      listener: (context, state) {},
      builder: (context, state) {
        ChooseSeatsCubit cubit = ChooseSeatsCubit.get(context);
        return Padding(
          padding: const EdgeInsetsDirectional.only(
            top: 60,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TicketsComponents.priceRow(
                    context: context,
                    price: 24.5,
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              SharedComponents.defaultButton(
                context: context,
                function: () {
                  cubit.bookSeat(seatNumber);
                },
                text: AppString.book,
                width: 100,
                radius: AppSizes.defaultBottomRadius,
                textSize: 16,
              ),
            ],
          ),
        );
      },
    );
