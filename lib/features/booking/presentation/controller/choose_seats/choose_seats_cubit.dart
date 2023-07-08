import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'choose_seats_state.dart';

class ChooseSeatsCubit extends Cubit<ChooseSeatsState> {
  ChooseSeatsCubit() : super(ChooseSeatsInitialState());

  static ChooseSeatsCubit get(context) => BlocProvider.of(context);

  ScrollController sc = ScrollController();
  int firstIdx = 0;

  void initScrollCon() {
    sc.addListener(() {
      firstIdx = sc.offset ~/ 470;
      emit(ChangeScrollControllerState());
    });
  }
}
