import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traind_app/features/tickets/presentation/controller/choose_seats/choose_seats_state.dart';

import '../../components/widgets/classes/seat_details.dart';


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
