import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/second screen/seat_model.dart';
import '../../components/classes/seat_details.dart';
import 'choose_seats_state.dart';

class ChooseSeatsCubit extends Cubit<ChooseSeatsState> {
  ChooseSeatsCubit() : super(ChooseSeatsInitialState());

  static ChooseSeatsCubit get(context) => BlocProvider.of(context);

  List<SeatModel> firstCarSeats = [
    const SeatModel(
      seatNumber: 1,
      coach: 1,
      classChar: "A",
    ),
    const SeatModel(
      seatNumber: 2,
      coach: 1,
      classChar: "A",
    ),
    const SeatModel(
      seatNumber: 3,
      coach: 1,
      classChar: "A",
    ),
    const SeatModel(
      seatNumber: 4,
      coach: 1,
      classChar: "A",
    ),
    const SeatModel(
      seatNumber: 5,
      coach: 1,
      classChar: "A",
    ),
    const SeatModel(
      seatNumber: 6,
      coach: 1,
      classChar: "A",
    ),
    const SeatModel(
      seatNumber: 7,
      coach: 1,
      classChar: "A",
    ),
    const SeatModel(
      seatNumber: 8,
      coach: 1,
      classChar: "A",
    ),
    const SeatModel(
      seatNumber: 9,
      coach: 1,
      classChar: "A",
    ),
    const SeatModel(
      seatNumber: 10,
      coach: 1,
      classChar: "A",
    ),
    const SeatModel(
      seatNumber: 11,
     coach: 1,
      classChar: "A",
    ),
    const SeatModel(
      seatNumber: 12,
      coach: 1,
      classChar: "A",
    ),
  ];

  List<Seat> secondCarSeats = [
    Seat(
      seatNumber: '01',
      isAvailable: true,
    ),
    Seat(
      seatNumber: '02',
      isAvailable: false,
    ),
    Seat(
      seatNumber: '03',
      isAvailable: false,
    ),
    Seat(
      seatNumber: '04',
      isAvailable: true,
    ),
    Seat(
      seatNumber: '05',
      isAvailable: true,
    ),
    Seat(
      seatNumber: '06',
      isAvailable: true,
    ),
    Seat(
      seatNumber: '07',
      isAvailable: false,
    ),
    Seat(
      seatNumber: '08',
      isAvailable: true,
    ),
    Seat(
      seatNumber: '09',
      isAvailable: true,
    ),
    Seat(
      seatNumber: '10',
      isAvailable: false,
    ),
    Seat(
      seatNumber: '11',
      isAvailable: true,
    ),
    Seat(
      seatNumber: '12',
      isAvailable: true,
    ),
    Seat(
      seatNumber: '13',
      isAvailable: false,
    ),
    Seat(
      seatNumber: '14',
      isAvailable: true,
    ),
    Seat(
      seatNumber: '15',
      isAvailable: true,
    ),
    Seat(
      seatNumber: '16',
      isAvailable: true,
    ),
  ];

  void bookSeat(String seatNumber) {
    int idx = int.parse(seatNumber);
    //firstCarSeats[idx - 1].book = !firstCarSeats[idx - 1].isAvailable;
    emit(ChooseSeatsBookSeatSuccessState());
  }

  bool visibleSelectedCarContainer = false;

  void changeVisibleSelectedCarContainer(int carNumber) {
    visibleSelectedCarContainer = !visibleSelectedCarContainer;

    emit(ChangeVisiableState());
  }

  ScrollController sc = ScrollController();
  int firstIdx = 0;

  void initScrollCon() {
    sc.addListener(() {
      firstIdx = sc.offset ~/ 480;
      emit(ChangeScrollControllerState());
    });
  }
}
