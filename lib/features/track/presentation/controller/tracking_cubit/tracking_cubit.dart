// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:traind_app/features/track/data/models/track_model.dart';

import 'package:traind_app/features/track/domain/usecase/get_track_info_usecase.dart';

part 'tracking_state.dart';

class TrackingCubit extends Cubit<TrackingState> {
  TrackingCubit(
    this.trackInfoUsecase,
  ) : super(TrackingInitial());

  static TrackingCubit get(context) => BlocProvider.of(context);
  final Completer<GoogleMapController> mapController = Completer();
  LatLng sourceLocation = LatLng(30.07194661668976, 31.31761422664301);
  List<LatLng> polylineCoordinates = [];
  var googleApiKey = 'AIzaSyCUUWf60Ms4DRskKz7-y6GuuIWirjPVKAY';
  var trackingFormKey = GlobalKey<FormState>();
  var trainId = TextEditingController();
  String message = '';
  final GetTrackInfoUsecase trackInfoUsecase;
  TrackModel trackModel = TrackModel(
      fromStation: '',
      startTime: '',
      arrivalTime: '',
      trainId: 0,
      longitude: 0.0,
      latitude: 0.0);
  Future<void> getTrackInfo(String ticketId) async {
    emit(GetTrackInfoLoadingState());
    var result = await trackInfoUsecase.call(ticketId);
    result.fold((failure) {
      print(failure.toString());
      message = failure.message.toString();
      emit(GetTrackInfoFailureState());
    }, (trackInfo) {
      print(trackInfo);
      trackModel = TrackModel(
          fromStation: trackInfo.fromStation,
          startTime: trackInfo.startTime,
          arrivalTime: trackInfo.arrivalTime,
          trainId: trackInfo.trainId,
          longitude: trackInfo.longitude,
          latitude: trackInfo.latitude);
      emit(GetTrackInfoSuccessState());
    });
  }

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        googleApiKey,
        PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
        PointLatLng(trackModel.latitude, trackModel.longitude));
    if (result.points.isNotEmpty) {
      result.points.forEach((element) {
        polylineCoordinates.add(LatLng(element.latitude, element.longitude));
      });
    }
    emit(GetPolylineCoordinateState());
  }
}
