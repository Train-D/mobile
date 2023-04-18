import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traind_app/features/tickets/presentation/controller/choose_seats/choose_seats_cubit.dart';
import 'package:traind_app/features/tickets/presentation/controller/choose_seats/choose_seats_state.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_images.dart';
import '../classes/train_first_car_custom_paint.dart';
import '../reusable_component/choose_seats_screen_components.dart';

Widget trainFirstCar({
  required BuildContext context,
}) =>
    BlocConsumer<ChooseSeatsCubit, ChooseSeatsState>(
      listener: (context, state) {},
      builder: (context, state) {
        ChooseSeatsCubit cubit = ChooseSeatsCubit.get(context);
        return SizedBox(
          width: 220,
          height: 430,
          child: CustomPaint(
              painter: TrainFirstCarShape(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image(
                      image: AssetImage(
                          '${AppConstants.vectorsUrl}$trainCarOneFrontVector'),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ChooseSeatsComponents.columnSeats(
                        context: context,
                        firstRowTwoSeats: ChooseSeatsComponents.twoSeats(
                          context: context,
                          seat1: cubit.firstCarSeats[0],
                          seat2: cubit.firstCarSeats[1],
                        ),
                        secondRowTwoSeats: ChooseSeatsComponents.twoSeats(
                          context: context,
                          seat1: cubit.firstCarSeats[4],
                          seat2: cubit.firstCarSeats[5],
                        ),
                        thirdRowTwoSeats: ChooseSeatsComponents.twoSeats(
                          context: context,
                          seat1: cubit.firstCarSeats[8],
                          seat2: cubit.firstCarSeats[9],
                        ),
                      ),
                      ChooseSeatsComponents.defaultDividerLine(
                        height: 245,
                      ),
                      ChooseSeatsComponents.columnSeats(
                        context: context,
                        firstRowTwoSeats: ChooseSeatsComponents.twoSeats(
                          context: context,
                          seat1: cubit.firstCarSeats[2],
                          seat2: cubit.firstCarSeats[3],
                        ),
                        secondRowTwoSeats: ChooseSeatsComponents.twoSeats(
                          context: context,
                          seat1: cubit.firstCarSeats[6],
                          seat2: cubit.firstCarSeats[7],
                        ),
                        thirdRowTwoSeats: ChooseSeatsComponents.twoSeats(
                          context: context,
                          seat1: cubit.firstCarSeats[10],
                          seat2: cubit.firstCarSeats[11],
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        );
      },
    );
