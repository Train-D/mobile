import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/global/theme/app_color/app_color_light.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/components.dart';
import '../components/reusable_component/choose_seats_screen_components.dart';
import '../components/widgets/train_first_car_widget.dart';
import '../controller/choose_seats/choose_seats_cubit.dart';
import '../controller/choose_seats/choose_seats_state.dart';
import '../../../../core/utils/app_images.dart';
import '../components/reusable_component/tickets_components.dart';
import '../components/widgets/choose_seats_alert_dialog_content_widget.dart';
import '../components/widgets/train_a2_car.dart';
import '../components/widgets/train_b1_car.dart';
import '../components/widgets/train_b2_car.dart';
import '../components/widgets/train_c1_car.dart';
import '../components/widgets/train_c2_car.dart';
import '../components/widgets/train_c3_car.dart';
import '../components/widgets/train_second_car.dart';
import '../controller/booking_cubit/booking_cubit.dart';

class ChooseSeatsScreen extends StatelessWidget {
  const ChooseSeatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> trainCars = [
      trainFirstCar(context: context),
      trainA2Car(context: context),
      trainB1Car(context: context),
      trainB2Car(context: context),
      trainC1Car(context: context),
      trainC2Car(context: context),
      trainC3Car(context: context),
    ];
    return SafeArea(
        child: SharedComponents.linearGradientBg(
      colors: profileBg,
      child: BlocProvider(
        create: (context) => ChooseSeatsCubit()..initScrollCon(),
        child:BlocConsumer<BookingCubit, BookingState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Scaffold(
                backgroundColor: transparent,
                appBar: SharedComponents.defaultAppBar(
                  context: context,
                  chooseSeatsScreenAppBar: true,
                ),
                body: state is GetTrainInfoLoadingState ||
                        state is GetTrainInfoFailureState
                    ? const Center(
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
                                  height: 15.sp,
                                ),
                                ChooseSeatsComponents.buttonAndWordRow(
                                  context: context,
                                  isAvailable: true,
                                  text: AppString.available,
                                ),
                                ChooseSeatsComponents.buttonAndWordRow(
                                  context: context,
                                  isAvailable: false,
                                  text: AppString.unavailable,
                                ),
                                const SizedBox(
                                  height: 5,
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
                                         ChooseSeatsComponents.trainCarClassText(
                                          context: context,
                                          carClass: '1C',
                                        ),
                                         ChooseSeatsComponents.trainCarClassText(
                                          context: context,
                                          carClass: '2C',
                                        ),
                                         ChooseSeatsComponents.trainCarClassText(
                                          context: context,
                                          carClass: '3C',
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
                                        BlocConsumer<ChooseSeatsCubit,
                                                ChooseSeatsState>(
                                            listener: (context, state) {},
                                            builder: (context, state) {
                                              ChooseSeatsCubit cubit =
                                                  ChooseSeatsCubit.get(context);
                                              return Column(
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
                                                    crossFadeState: cubit
                                                                .firstIdx ==
                                                            0
                                                        ? CrossFadeState.showFirst
                                                        : CrossFadeState.showSecond,
                                                    duration: const Duration(
                                                      milliseconds: 150,
                                                    ),
                                                  ),
                                                  // const SizedBox(
                                                  //   height: 1,
                                                  // ),
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
                                                    crossFadeState: cubit
                                                                .firstIdx ==
                                                            1
                                                        ? CrossFadeState.showFirst
                                                        : CrossFadeState.showSecond,
                                                    duration: const Duration(
                                                      milliseconds: 150,
                                                    ),
                                                  ),
                                                  // const SizedBox(
                                                  //   height: 15,
                                                  // ),
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
                                                    crossFadeState: cubit
                                                                .firstIdx ==
                                                            2
                                                        ? CrossFadeState.showFirst
                                                        : CrossFadeState.showSecond,
                                                    duration: const Duration(
                                                      milliseconds: 150,
                                                    ),
                                                  ),
                                                  // const SizedBox(
                                                  //   height: 15,
                                                  // ),
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
                                                    crossFadeState: cubit
                                                                .firstIdx ==
                                                            3
                                                        ? CrossFadeState.showFirst
                                                        : CrossFadeState.showSecond,
                                                    duration: const Duration(
                                                      milliseconds: 150,
                                                    ),
                                                  ),
                                                  // const SizedBox(
                                                  //   height: 15,
                                                  // ),
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
                                                    crossFadeState: cubit
                                                                .firstIdx ==
                                                            4
                                                        ? CrossFadeState.showFirst
                                                        : CrossFadeState.showSecond,
                                                    duration: const Duration(
                                                      milliseconds: 150,
                                                    ),
                                                  ),
                                                  //  const SizedBox(
                                                  //   height: 15,
                                                  // ),
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
                                                    crossFadeState: cubit
                                                                .firstIdx ==
                                                            5
                                                        ? CrossFadeState.showFirst
                                                        : CrossFadeState.showSecond,
                                                    duration: const Duration(
                                                      milliseconds: 150,
                                                    ),
                                                  ),
                                                  //  const SizedBox(
                                                  //   height: 15,
                                                  // ),
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
                                                    crossFadeState: cubit
                                                                .firstIdx ==
                                                            6
                                                        ? CrossFadeState.showFirst
                                                        : CrossFadeState.showSecond,
                                                    duration: const Duration(
                                                      milliseconds: 150,
                                                    ),
                                                  ),
                                                ],
                                              );
                                            }),
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
                              BlocConsumer<ChooseSeatsCubit, ChooseSeatsState>(
                                  listener: (context, state) {},
                                  builder: (context, state) {
                                    ChooseSeatsCubit cubit =
                                        ChooseSeatsCubit.get(context);
                                    return SingleChildScrollView(
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
                                    );
                                  }),
                            ],
                          ),
                        ],
                      ),
              );
            },
          )
        )) 
    );
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
