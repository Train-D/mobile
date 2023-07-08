import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/booking_cubit/booking_cubit.dart';
import '../../screens/choose_seats_screen.dart';
import '../classes/train_default_car_custom_paint.dart';
import '../reusable_component/choose_seats_screen_components.dart';

Widget trainC1Car({
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
              painter: TrainDefaultCarShape(),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ChooseSeatsComponents.columnSeats(
                        context: context,
                        isFourRows: true,
                        firstRowTwoSeats: ChooseSeatsComponents.twoSeats(
                          context: context,
                          seat1: cubit.carC1[0],
                          fun1: () {
                            cubit.seatNumber =
                                cubit.carC1[0].seatNumber;
                            cubit.coach = cubit.carC1[0].coach;
                            cubit.classs = cubit.carC1[0].classChar;
                            cubit.seatPrice = cubit.classCPrice;
                            showChooseSeatsAlertDialog(
                              context: context,
                              price: cubit.classCPrice,
                              isBooked: cubit.isSeatBooked(
                                cubit.carC1[0],
                              ),
                            );
                            //print('${cubit.carC1[0]}');
                          },
                          booked1: cubit.isSeatBooked(
                            cubit.carC1[0],
                          ),
                          seat2: cubit.carC1[1],
                          fun2: () {
                            cubit.seatNumber =
                                cubit.carC1[1].seatNumber;
                            cubit.coach = cubit.carC1[1].coach;
                            cubit.classs = cubit.carC1[1].classChar;
                            cubit.seatPrice = cubit.classCPrice;
                            showChooseSeatsAlertDialog(
                              context: context,
                              price: cubit.classCPrice,
                              isBooked: cubit.isSeatBooked(
                                cubit.carC1[1],
                              ),
                            );
                            //print('${cubit.carC1[1]}');
                          },
                          booked2: cubit.isSeatBooked(
                            cubit.carC1[1],
                          ),
                        ),
                        secondRowTwoSeats: ChooseSeatsComponents.twoSeats(
                          context: context,
                          seat1: cubit.carC1[4],
                          booked1: cubit.isSeatBooked(
                            cubit.carC1[4],
                          ),
                          fun1: () {
                            cubit.seatNumber =
                                cubit.carC1[4].seatNumber;
                            cubit.coach = cubit.carC1[4].coach;
                            cubit.classs = cubit.carC1[4].classChar;
                            cubit.seatPrice = cubit.classCPrice;
                            showChooseSeatsAlertDialog(
                              context: context,
                              price: cubit.classCPrice,
                              isBooked: cubit.isSeatBooked(
                                cubit.carC1[4],
                              ),
                            );
                            //print('${cubit.carC1[4]}');
                          },
                          seat2: cubit.carC1[5],
                          booked2: cubit.isSeatBooked(
                            cubit.carC1[5],
                          ),
                          fun2: () {
                            cubit.seatNumber =
                                cubit.carC1[5].seatNumber;
                            cubit.coach = cubit.carC1[5].coach;
                            cubit.classs = cubit.carC1[5].classChar;
                            cubit.seatPrice = cubit.classCPrice;
                            showChooseSeatsAlertDialog(
                              context: context,
                              price: cubit.classCPrice,
                              isBooked: cubit.isSeatBooked(
                                cubit.carC1[5],
                              ),
                            );
                            //print('${cubit.carC1[5]}');
                          },
                        ),
                        thirdRowTwoSeats: ChooseSeatsComponents.twoSeats(
                          context: context,
                          seat1: cubit.carC1[8],
                          seat2: cubit.carC1[9],
                          fun1: () {
                            cubit.seatNumber =
                                cubit.carC1[8].seatNumber;
                            cubit.coach = cubit.carC1[8].coach;
                            cubit.classs = cubit.carC1[8].classChar;
                            cubit.seatPrice = cubit.classCPrice;
                            showChooseSeatsAlertDialog(
                              context: context,
                              price: cubit.classCPrice,
                              isBooked: cubit.isSeatBooked(
                                cubit.carC1[8],
                              ),
                            );
                            //print('${cubit.carC1[8]}');
                          },
                          fun2: () {
                            cubit.seatNumber =
                                cubit.carC1[9].seatNumber;
                            cubit.coach = cubit.carC1[9].coach;
                            cubit.classs = cubit.carC1[9].classChar;
                            cubit.seatPrice = cubit.classCPrice;
                            showChooseSeatsAlertDialog(
                              context: context,
                              price: cubit.classCPrice,
                              isBooked: cubit.isSeatBooked(
                                cubit.carC1[9],
                              ),
                            );
                            //print('${cubit.carC1[9]}');
                          },
                          booked1: cubit.isSeatBooked(
                            cubit.carC1[8],
                          ),
                          booked2: cubit.isSeatBooked(
                            cubit.carC1[9],
                          ),
                        ),
                        fourthRowTwoSeats: ChooseSeatsComponents.twoSeats(
                          context: context,
                          seat1: cubit.carC1[12],
                          seat2: cubit.carC1[13],
                          fun1: () {
                            cubit.seatNumber =
                                cubit.carC1[12].seatNumber;
                            cubit.coach = cubit.carC1[12].coach;
                            cubit.classs = cubit.carC1[12].classChar;
                            cubit.seatPrice = cubit.classCPrice;
                            showChooseSeatsAlertDialog(
                              context: context,
                              price: cubit.classCPrice,
                              isBooked: cubit.isSeatBooked(
                                cubit.carC1[12],
                              ),
                            );
                            //print('${cubit.carC1[12]}');
                          },
                          fun2: () {
                            cubit.seatNumber =
                                cubit.carC1[13].seatNumber;
                            cubit.coach = cubit.carC1[13].coach;
                            cubit.classs = cubit.carC1[13].classChar;
                            cubit.seatPrice = cubit.classCPrice;
                            showChooseSeatsAlertDialog(
                              context: context,
                              price: cubit.classCPrice,
                              isBooked: cubit.isSeatBooked(
                                cubit.carC1[13],
                              ),
                            );
                            //print('${cubit.carC1[13]}');
                          },
                          booked1: cubit.isSeatBooked(
                            cubit.carC1[12],
                          ),
                          booked2: cubit.isSeatBooked(
                            cubit.carC1[13],
                          ),
                        ),
                      
                      ),
                      ChooseSeatsComponents.defaultDividerLine(
                        height: 245,
                      ),
                      ChooseSeatsComponents.columnSeats(
                        context: context,
                        isFourRows: true,
                        firstRowTwoSeats: ChooseSeatsComponents.twoSeats(
                          context: context,
                          seat1: cubit.carC1[2],
                          seat2: cubit.carC1[3],
                          fun1: () {
                            cubit.seatNumber =
                                cubit.carC1[2].seatNumber;
                            cubit.coach = cubit.carC1[2].coach;
                            cubit.classs = cubit.carC1[2].classChar;
                            cubit.seatPrice = cubit.classCPrice;
                            showChooseSeatsAlertDialog(
                              context: context,
                              price: cubit.classCPrice,
                              isBooked: cubit.isSeatBooked(
                                cubit.carC1[2],
                              ),
                            );
                            //print('${cubit.carC1[2]}');
                          },
                          fun2: () {
                            cubit.seatNumber =
                                cubit.carC1[3].seatNumber;
                            cubit.coach = cubit.carC1[3].coach;
                            cubit.classs = cubit.carC1[3].classChar;
                            cubit.seatPrice = cubit.classCPrice;
                            showChooseSeatsAlertDialog(
                              context: context,
                              price: cubit.classCPrice,
                              isBooked: cubit.isSeatBooked(
                                cubit.carC1[3],
                              ),
                            );
                            //print('${cubit.carC1[3]}');
                          },
                          booked1: cubit.isSeatBooked(
                            cubit.carC1[2],
                          ),
                          booked2: cubit.isSeatBooked(
                            cubit.carC1[3],
                          ),
                        ),
                        secondRowTwoSeats: ChooseSeatsComponents.twoSeats(
                          context: context,
                          seat1: cubit.carC1[6],
                          seat2: cubit.carC1[7],
                          fun1: () {
                            cubit.seatNumber =
                                cubit.carC1[6].seatNumber;
                            cubit.coach = cubit.carC1[6].coach;
                            cubit.classs = cubit.carC1[6].classChar;
                            cubit.seatPrice = cubit.classCPrice;
                            showChooseSeatsAlertDialog(
                              context: context,
                              price: cubit.classCPrice,
                              isBooked: cubit.isSeatBooked(
                                cubit.carC1[6],
                              ),
                            );
                            //print('${cubit.carC1[6]}');
                          },
                          fun2: () {
                            cubit.seatNumber =
                                cubit.carC1[7].seatNumber;
                            cubit.coach = cubit.carC1[7].coach;
                            cubit.classs = cubit.carC1[7].classChar;
                            cubit.seatPrice = cubit.classCPrice;
                            showChooseSeatsAlertDialog(
                              context: context,
                              price: cubit.classCPrice,
                              isBooked: cubit.isSeatBooked(
                                cubit.carC1[7],
                              ),
                            );
                            //print('${cubit.carC1[7]}');
                          },
                          booked1: cubit.isSeatBooked(
                            cubit.carC1[6],
                          ),
                          booked2: cubit.isSeatBooked(
                            cubit.carC1[7],
                          ),
                        ),
                        thirdRowTwoSeats: ChooseSeatsComponents.twoSeats(
                          context: context,
                          seat1: cubit.carC1[10],
                          seat2: cubit.carC1[11],
                          fun1: () {
                            cubit.seatNumber =
                                cubit.carC1[10].seatNumber;
                            cubit.coach = cubit.carC1[10].coach;
                            cubit.classs = cubit.carC1[10].classChar;
                            cubit.seatPrice = cubit.classCPrice;
                            showChooseSeatsAlertDialog(
                              context: context,
                              price: cubit.classCPrice,
                              isBooked: cubit.isSeatBooked(
                                cubit.carC1[10],
                              ),
                            );
                            //print('${cubit.carC1[10]}');
                          },
                          fun2: () {
                            cubit.seatNumber =
                                cubit.carC1[11].seatNumber;
                            cubit.coach = cubit.carC1[11].coach;
                            cubit.classs = cubit.carC1[11].classChar;
                            cubit.seatPrice = cubit.classCPrice;
                            showChooseSeatsAlertDialog(
                              context: context,
                              price: cubit.classCPrice,
                              isBooked: cubit.isSeatBooked(
                                cubit.carC1[11],
                              ),
                            );
                            //print('${cubit.carC1[11]}');
                          },
                          booked1: cubit.isSeatBooked(
                            cubit.carC1[10],
                          ),
                          booked2: cubit.isSeatBooked(
                            cubit.carC1[11],
                          ),
                        ),
                        fourthRowTwoSeats: ChooseSeatsComponents.twoSeats(
                          context: context,
                          seat1: cubit.carC1[14],
                          seat2: cubit.carC1[15],
                          fun1: () {
                            cubit.seatNumber =
                                cubit.carC1[14].seatNumber;
                            cubit.coach = cubit.carC1[14].coach;
                            cubit.classs = cubit.carC1[14].classChar;
                            cubit.seatPrice = cubit.classCPrice;
                            showChooseSeatsAlertDialog(
                              context: context,
                              price: cubit.classCPrice,
                              isBooked: cubit.isSeatBooked(
                                cubit.carC1[14],
                              ),
                            );
                            //print('${cubit.carC1[14]}');
                          },
                          fun2: () {
                            cubit.seatNumber =
                                cubit.carC1[15].seatNumber;
                            cubit.coach = cubit.carC1[15].coach;
                            cubit.classs = cubit.carC1[15].classChar;
                            cubit.seatPrice = cubit.classCPrice;
                            showChooseSeatsAlertDialog(
                              context: context,
                              price: cubit.classCPrice,
                              isBooked: cubit.isSeatBooked(
                                cubit.carC1[15],
                              ),
                            );
                            //print('${cubit.carC1[15]}');
                          },
                          booked1: cubit.isSeatBooked(
                            cubit.carC1[14],
                          ),
                          booked2: cubit.isSeatBooked(
                            cubit.carC1[15],
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
