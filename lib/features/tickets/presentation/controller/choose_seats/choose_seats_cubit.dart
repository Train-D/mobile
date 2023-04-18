import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/classes/seat_details.dart';
import 'choose_seats_state.dart';


class ChooseSeatsCubit extends Cubit<ChooseSeatsState> {
  ChooseSeatsCubit() : super(ChooseSeatsInitialState());

  static ChooseSeatsCubit get(context) => BlocProvider.of(context);

  List<Seat> firstCarSeats = [
    Seat(
      seatNumber: '01',
      isAvailable: false,
      //bookSeat: () {},
    ),
    Seat(
      seatNumber: '02',
      isAvailable: true,
      //bookSeat: () {},
    ),
  ];

  void bookSeat(String seatNumber) {
    int idx = int.parse(seatNumber);
    firstCarSeats[idx - 1].isAvailable = !firstCarSeats[idx - 1].isAvailable;
    emit(ChooseSeatsBookSeatSuccessState());
  }
}
