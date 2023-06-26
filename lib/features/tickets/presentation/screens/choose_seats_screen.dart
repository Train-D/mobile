import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:traind_app/core/global/theme/app_color/app_color_light.dart';
import 'package:traind_app/core/utils/app_constants.dart';
import 'package:traind_app/core/utils/app_strings.dart';
import 'package:traind_app/core/utils/components.dart';
import 'package:traind_app/features/tickets/presentation/components/reusable_component/choose_seats_screen_components.dart';
import 'package:traind_app/features/tickets/presentation/components/widgets/train_first_car_widget.dart';
import 'package:traind_app/features/tickets/presentation/controller/booking_cubit/booking_cubit.dart';
import 'package:traind_app/features/tickets/presentation/controller/choose_seats/choose_seats_cubit.dart';
import 'package:traind_app/features/tickets/presentation/controller/choose_seats/choose_seats_state.dart';
import '../../../../core/utils/app_images.dart';
import '../components/reusable_component/tickets_components.dart';
import '../components/widgets/choose_seats_alert_dialog_content_widget.dart';
import '../components/widgets/train_second_car.dart';

class ChooseSeatsScreen extends StatelessWidget {
  const ChooseSeatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> trainCars = [
      trainFirstCar(context: context),
      //trainSecondCar(context: context),
      //trainSecondCar(context: context),
      //trainSecondCar(context: context),
    ];
    return SafeArea(
        child: SharedComponents.linearGradientBg(
      colors: profileBg,
      child: BlocConsumer<BookingCubit, BookingState>(
        listener: (context, state) {},
        builder: (context, state) {
          BookingCubit cubit = BookingCubit.get(context);
          return Scaffold(
              backgroundColor: transparent,
              appBar: SharedComponents.defaultAppBar(
                context: context,
                chooseSeatsScreenAppBar: true,
              ),
              body: state is GetTrainInfoLoadingState ||
                      state is GetTrainInfoFailureState
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 30.sp,
                              ),
                              /*ChooseSeatsComponents.buttonAndWordRow(
                        context: context,
                        isAvailable: true,
                        text: AppString.available,
                      ),
                      ChooseSeatsComponents.buttonAndWordRow(
                        context: context,
                        isAvailable: false,
                        text: AppString.unavailable,
                      ),
                      */
                              const SizedBox(
                                height: 50,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      ChooseSeatsComponents.trainCarClassText(
                                        context: context,
                                        carClass: '1A',
                                      ),
                                      ChooseSeatsComponents.trainCarClassText(
                                        context: context,
                                        carClass: '2A',
                                      ),
                                      ChooseSeatsComponents.trainCarClassText(
                                        context: context,
                                        carClass: '1B',
                                      ),
                                      ChooseSeatsComponents.trainCarClassText(
                                        context: context,
                                        carClass: '2B',
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Stack(
                                    alignment: Alignment.topCenter,
                                    children: [
                                      Image(
                                        image: AssetImage(
                                          '${AppConstants.vectorsUrl}$smallTrainLine',
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          AnimatedCrossFade(
                                            firstChild: ChooseSeatsComponents
                                                .trainSmallCarWithSelectedContainer(
                                              image: smallTrainFirstCar,
                                              showBorder:
                                                  selectedTrainContainerColor,
                                            ),
                                            secondChild: ChooseSeatsComponents
                                                .trainSmallCarWithSelectedContainer(
                                              image: smallTrainFirstCar,
                                              showBorder: transparent,
                                            ),
                                            crossFadeState: cubit.firstIdx == 0
                                                ? CrossFadeState.showFirst
                                                : CrossFadeState.showSecond,
                                            duration: const Duration(
                                              milliseconds: 150,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          AnimatedCrossFade(
                                            firstChild: ChooseSeatsComponents
                                                .trainSmallCarWithSelectedContainer(
                                              image: smallTrainDefaultCar,
                                              showBorder:
                                                  selectedTrainContainerColor,
                                            ),
                                            secondChild: ChooseSeatsComponents
                                                .trainSmallCarWithSelectedContainer(
                                              image: smallTrainDefaultCar,
                                              showBorder: transparent,
                                            ),
                                            crossFadeState: cubit.firstIdx == 1
                                                ? CrossFadeState.showFirst
                                                : CrossFadeState.showSecond,
                                            duration: const Duration(
                                              milliseconds: 150,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          AnimatedCrossFade(
                                            firstChild: ChooseSeatsComponents
                                                .trainSmallCarWithSelectedContainer(
                                              image: smallTrainDefaultCar,
                                              showBorder:
                                                  selectedTrainContainerColor,
                                            ),
                                            secondChild: ChooseSeatsComponents
                                                .trainSmallCarWithSelectedContainer(
                                              image: smallTrainDefaultCar,
                                              showBorder: transparent,
                                            ),
                                            crossFadeState: cubit.firstIdx == 2
                                                ? CrossFadeState.showFirst
                                                : CrossFadeState.showSecond,
                                            duration: const Duration(
                                              milliseconds: 150,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          AnimatedCrossFade(
                                            firstChild: ChooseSeatsComponents
                                                .trainSmallCarWithSelectedContainer(
                                              image: smallTrainDefaultCar,
                                              showBorder:
                                                  selectedTrainContainerColor,
                                            ),
                                            secondChild: ChooseSeatsComponents
                                                .trainSmallCarWithSelectedContainer(
                                              image: smallTrainDefaultCar,
                                              showBorder: transparent,
                                            ),
                                            crossFadeState: cubit.firstIdx == 3
                                                ? CrossFadeState.showFirst
                                                : CrossFadeState.showSecond,
                                            duration: const Duration(
                                              milliseconds: 150,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                top: 20,
                              ),
                              child: Image(
                                width: 220,
                                fit: BoxFit.contain,
                                image: AssetImage(
                                  '${AppConstants.vectorsUrl}$trainLines',
                                ),
                              ),
                            ),
                            SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              controller: cubit.sc,
                              child: Padding(
                                padding: const EdgeInsetsDirectional.only(
                                  top: 40,
                                  end: 15,
                                ),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 50,
                                    ),
                                    SizedBox(
                                      width: 220,
                                      child: ListView.separated(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, idx) =>
                                            trainCars[idx],
                                        separatorBuilder: (context, idx) =>
                                            const SizedBox(height: 20),
                                        itemCount: trainCars.length,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ));
        },
      ),
    ));
  }
}

dynamic showChooseSeatsAlertDialog({
  required BuildContext context,
  required double price,
  required bool isBooked,
}) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return TicketsComponents.defaultAlertDialog(
        height: 190,
        content: chooseSeatsAlertDialogContent(
          context: context,
          price: price,
          isBooked: isBooked,
        ),
      );
    },
  );
}
