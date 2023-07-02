// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:traind_app/features/track/domain/usecase/get_track_info_usecase.dart';

part 'tracking_state.dart';

class TrackingCubit extends Cubit<TrackingState> {
  TrackingCubit(
    this.trackInfoUsecase,
  ) : super(TrackingInitial());

  static TrackingCubit get(context) => BlocProvider.of(context);
  var trackingFormKey = GlobalKey<FormState>();
  var trainId = TextEditingController();
  String message = '';
  final GetTrackInfoUsecase trackInfoUsecase;

  Future<void> getTrackInfo(String ticketId) async {
    emit(GetTrackInfoLoadingState());
    var result = await trackInfoUsecase.call(ticketId);
    result.fold((failure) {
      print(failure.toString());
      message = failure.message.toString();
      emit(GetTrackInfoFailureState());
    }, (trackInfo) {
      print(trackInfo);
      emit(GetTrackInfoSuccessState());
    });
  }
}
