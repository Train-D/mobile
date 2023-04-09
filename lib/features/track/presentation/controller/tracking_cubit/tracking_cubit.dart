import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tracking_state.dart';

class TrackingCubit extends Cubit<TrackingState> {
  TrackingCubit() : super(TrackingInitial());

  static TrackingCubit get(context) => BlocProvider.of(context);

  var trainId = TextEditingController();

}

