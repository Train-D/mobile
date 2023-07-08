import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_images.dart';
import '../../controller/booking_cubit/booking_cubit.dart';
import '../../screens/choose_seats_screen.dart';
import '../classes/train_first_car_custom_paint.dart';
import '../reusable_component/choose_seats_screen_components.dart';

Widget trainFirstCar({
  required BuildContext context,
}) =>
    BlocConsumer<BookingCubit, BookingState>(
      listener: (context, state) {},
      builder: (context, state) {
        BookingCubit cubit = BookingCubit.get(context);
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
                          fun1: () {
                            cubit.seatNumber =
                                cubit.firstCarSeats[0].seatNumber;
                            cubit.coach = cubit.firstCarSeats[0].coach;
                            cubit.classs = cubit.firstCarSeats[0].classChar;
                            cubit.seatPrice = cubit.classAPrice;
                            showChooseSeatsAlertDialog(
                              context: context,
                              price: cubit.classAPrice,
                              isBooked: cubit.isSeatBooked(
                                cubit.firstCarSeats[0],
                              ),
                            );
                            //print('${cubit.firstCarSeats[0]}');
                          },
                          booked1: cubit.isSeatBooked(
                            cubit.firstCarSeats[0],
                          ),
                          seat2: cubit.firstCarSeats[1],
                          fun2: () {
                            cubit.seatNumber =
                                cubit.firstCarSeats[1].seatNumber;
                            cubit.coach = cubit.firstCarSeats[1].coach;
                            cubit.classs = cubit.firstCarSeats[1].classChar;
                            cubit.seatPrice = cubit.classAPrice;
                            showChooseSeatsAlertDialog(
                              context: context,
                              price: cubit.classAPrice,
                              isBooked: cubit.isSeatBooked(
                                cubit.firstCarSeats[1],
                              ),
                            );
                            //print('${cubit.firstCarSeats[1]}');
                          },
                          booked2: cubit.isSeatBooked(
                            cubit.firstCarSeats[1],
                          ),
                        ),
                        secondRowTwoSeats: ChooseSeatsComponents.twoSeats(
                          context: context,
                          seat1: cubit.firstCarSeats[4],
                          booked1: cubit.isSeatBooked(
                            cubit.firstCarSeats[4],
                          ),
                          fun1: () {
                            cubit.seatNumber =
                                cubit.firstCarSeats[4].seatNumber;
                            cubit.coach = cubit.firstCarSeats[4].coach;
                            cubit.classs = cubit.firstCarSeats[4].classChar;
                            cubit.seatPrice = cubit.classAPrice;
                            showChooseSeatsAlertDialog(
                              context: context,
                              price: cubit.classAPrice,
                              isBooked: cubit.isSeatBooked(
                                cubit.firstCarSeats[4],
                              ),
                            );
                            //print('${cubit.firstCarSeats[4]}');
                          },
                          seat2: cubit.firstCarSeats[5],
                          booked2: cubit.isSeatBooked(
                            cubit.firstCarSeats[5],
                          ),
                          fun2: () {
                            cubit.seatNumber =
                                cubit.firstCarSeats[5].seatNumber;
                            cubit.coach = cubit.firstCarSeats[5].coach;
                            cubit.classs = cubit.firstCarSeats[5].classChar;
                            cubit.seatPrice = cubit.classAPrice;
                            showChooseSeatsAlertDialog(
                              context: context,
                              price: cubit.classAPrice,
                              isBooked: cubit.isSeatBooked(
                                cubit.firstCarSeats[5],
                              ),
                            );
                            //print('${cubit.firstCarSeats[5]}');
                          },
                        ),
                        thirdRowTwoSeats: ChooseSeatsComponents.twoSeats(
                          context: context,
                          seat1: cubit.firstCarSeats[8],
                          seat2: cubit.firstCarSeats[9],
                          fun1: () {
                            cubit.seatNumber =
                                cubit.firstCarSeats[8].seatNumber;
                            cubit.coach = cubit.firstCarSeats[8].coach;
                            cubit.classs = cubit.firstCarSeats[8].classChar;
                            cubit.seatPrice = cubit.classAPrice;
                            showChooseSeatsAlertDialog(
                              context: context,
                              price: cubit.classAPrice,
                              isBooked: cubit.isSeatBooked(
                                cubit.firstCarSeats[8],
                              ),
                            );
                           // print('${cubit.firstCarSeats[8]}');
                          },
                          fun2: () {
                            cubit.seatNumber =
                                cubit.firstCarSeats[9].seatNumber;
                            cubit.coach = cubit.firstCarSeats[9].coach;
                            cubit.classs = cubit.firstCarSeats[9].classChar;
                            cubit.seatPrice = cubit.classAPrice;
                            showChooseSeatsAlertDialog(
                              context: context,
                              price: cubit.classAPrice,
                              isBooked: cubit.isSeatBooked(
                                cubit.firstCarSeats[9],
                              ),
                            );
                           // print('${cubit.firstCarSeats[9]}');
                          },
                          booked1: cubit.isSeatBooked(
                            cubit.firstCarSeats[8],
                          ),
                          booked2: cubit.isSeatBooked(
                            cubit.firstCarSeats[9],
                          ),
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
                          fun1: () {
                            cubit.seatNumber =
                                cubit.firstCarSeats[2].seatNumber;
                            cubit.coach = cubit.firstCarSeats[2].coach;
                            cubit.classs = cubit.firstCarSeats[2].classChar;
                            cubit.seatPrice = cubit.classAPrice;
                            showChooseSeatsAlertDialog(
                              context: context,
                              price: cubit.classAPrice,
                              isBooked: cubit.isSeatBooked(
                                cubit.firstCarSeats[2],
                              ),
                            );
                            //print('${cubit.firstCarSeats[2]}');
                          },
                          fun2: () {
                            cubit.seatNumber =
                                cubit.firstCarSeats[3].seatNumber;
                            cubit.coach = cubit.firstCarSeats[3].coach;
                            cubit.classs = cubit.firstCarSeats[3].classChar;
                            cubit.seatPrice = cubit.classAPrice;
                            showChooseSeatsAlertDialog(
                              context: context,
                              price: cubit.classAPrice,
                              isBooked: cubit.isSeatBooked(
                                cubit.firstCarSeats[3],
                              ),
                            );
                            //print('${cubit.firstCarSeats[3]}');
                          },
                          booked1: cubit.isSeatBooked(
                            cubit.firstCarSeats[2],
                          ),
                          booked2: cubit.isSeatBooked(
                            cubit.firstCarSeats[3],
                          ),
                        ),
                        secondRowTwoSeats: ChooseSeatsComponents.twoSeats(
                          context: context,
                          seat1: cubit.firstCarSeats[6],
                          seat2: cubit.firstCarSeats[7],
                          fun1: () {
                            cubit.seatNumber =
                                cubit.firstCarSeats[6].seatNumber;
                            cubit.coach = cubit.firstCarSeats[6].coach;
                            cubit.classs = cubit.firstCarSeats[6].classChar;
                            cubit.seatPrice = cubit.classAPrice;
                            showChooseSeatsAlertDialog(
                              context: context,
                              price: cubit.classAPrice,
                              isBooked: cubit.isSeatBooked(
                                cubit.firstCarSeats[6],
                              ),
                            );
                            //print('${cubit.firstCarSeats[6]}');
                          },
                          fun2: () {
                            cubit.seatNumber =
                                cubit.firstCarSeats[7].seatNumber;
                            cubit.coach = cubit.firstCarSeats[7].coach;
                            cubit.classs = cubit.firstCarSeats[7].classChar;
                            cubit.seatPrice = cubit.classAPrice;
                            showChooseSeatsAlertDialog(
                              context: context,
                              price: cubit.classAPrice,
                              isBooked: cubit.isSeatBooked(
                                cubit.firstCarSeats[7],
                              ),
                            );
                            //print('${cubit.firstCarSeats[7]}');
                          },
                          booked1: cubit.isSeatBooked(
                            cubit.firstCarSeats[6],
                          ),
                          booked2: cubit.isSeatBooked(
                            cubit.firstCarSeats[7],
                          ),
                        ),
                        thirdRowTwoSeats: ChooseSeatsComponents.twoSeats(
                          context: context,
                          seat1: cubit.firstCarSeats[10],
                          seat2: cubit.firstCarSeats[11],
                          fun1: () {
                            cubit.seatNumber =
                                cubit.firstCarSeats[10].seatNumber;
                            cubit.coach = cubit.firstCarSeats[10].coach;
                            cubit.classs = cubit.firstCarSeats[10].classChar;
                            cubit.seatPrice = cubit.classAPrice;
                            showChooseSeatsAlertDialog(
                              context: context,
                              price: cubit.classAPrice,
                              isBooked: cubit.isSeatBooked(
                                cubit.firstCarSeats[10],
                              ),
                            );
                            //print('${cubit.firstCarSeats[10]}');
                          },
                          fun2: () {
                            cubit.seatNumber =
                                cubit.firstCarSeats[11].seatNumber;
                            cubit.coach = cubit.firstCarSeats[11].coach;
                            cubit.classs = cubit.firstCarSeats[11].classChar;
                            cubit.seatPrice = cubit.classAPrice;
                            showChooseSeatsAlertDialog(
                              context: context,
                              price: cubit.classAPrice,
                              isBooked: cubit.isSeatBooked(
                                cubit.firstCarSeats[11],
                              ),
                            );
                            //print('${cubit.firstCarSeats[11]}');
                          },
                          booked1: cubit.isSeatBooked(
                            cubit.firstCarSeats[10],
                          ),
                          booked2: cubit.isSeatBooked(
                            cubit.firstCarSeats[11],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        );
      },
    );
