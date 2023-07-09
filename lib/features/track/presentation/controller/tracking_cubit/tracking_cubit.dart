// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:traind_app/features/track/data/models/track_model.dart';
import 'package:traind_app/features/track/domain/usecase/get_track_info_usecase.dart';

part 'tracking_state.dart';

class TrackingCubit extends Cubit<TrackingState> {
  TrackingCubit(
    this.trackInfoUsecase,
  ) : super(TrackingInitial());

  static TrackingCubit get(context) => BlocProvider.of(context);

  Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();
  double sourceLat = 0.0;
  double sourceLng = 0.0;
  LatLng distenationLocation = LatLng(32.27027825482803, 30.59309145055676);
  List<LatLng> polylineCoordinates = [];
  var googleApiKey = 'AIzaSyCUUWf60Ms4DRskKz7-y6GuuIWirjPVKAY';
  String distanceToArrive = '';

  //
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
      //print(failure.toString());
      message = failure.message.toString();
      emit(GetTrackInfoFailureState());
    }, (trackInfo) async {
      //print(trackInfo);
      trackModel = TrackModel(
          fromStation: trackInfo.fromStation,
          startTime: trackInfo.startTime,
          arrivalTime: trackInfo.arrivalTime,
          trainId: trackInfo.trainId,
          longitude: trackInfo.longitude,
          latitude: trackInfo.latitude);
      mapController = Completer<GoogleMapController>();

      emit(GetTrackInfoSuccessState());
    });
  }

  PolylinePoints polylinePoints = PolylinePoints();
  String apiKey = 'AIzaSyCUUWf60Ms4DRskKz7-y6GuuIWirjPVKAY';

  void animatedCamera(double lat, double lng) async {
    double minLat = min(lat, trackModel.latitude);
    double minLng = min(lng, trackModel.longitude);
    double maxLat = max(lat, trackModel.latitude);
    double maxLng = max(lng, trackModel.longitude);
    if (!mapController.isCompleted) return;

    GoogleMapController controller = await mapController.future;
    dynamic bounds = LatLngBounds(
        southwest: LatLng(minLat, minLng), northeast: LatLng(maxLat, maxLng));
    dynamic cameraUpdate = CameraUpdate.newLatLngBounds(bounds, 50);
    await controller.animateCamera(cameraUpdate);
  }

  /*Future<void> getPolyline(double lat, double lng) async {
    sourceLat = lat;
    sourceLng = lng;

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        apiKey,
        PointLatLng(lat, lng),
        PointLatLng(trackModel.latitude, trackModel.longitude),
        travelMode: TravelMode.driving);
    polylineCoordinates.clear();
    if (result.points.isNotEmpty) {
      result.points.forEach((element) {
        polylineCoordinates.add(LatLng(element.latitude, element.longitude));
      });
      //print(polylineCoordinates);
    } else {
      print(' error');
    }
    emit(GetPolylineCoordinateState());
  }*/

  final DatabaseReference database = FirebaseDatabase.instance.ref();
  void fetchPoints() {
    database.onValue.listen((event) async {
      final data = event.snapshot.value;
      if (data != null && data is Map) {
        final double latitude = double.parse(data['latitude']);
        final double longitude = double.parse(data['longitude']);
        await getDrivingRoute(latitude, longitude);
        animatedCamera(latitude, longitude);
      }
    });

    emit(GetCoordinateState());
  }

  String TimeToArrive = '';
  String timeNow = '';

  Future<void> getDrivingRoute(double lat, double lng) async {
    sourceLat = lat;
    sourceLng = lng;

    final Dio dio = Dio();
    final url =
        'https://maps.googleapis.com/maps/api/directions/json?origin=$lat,$lng&destination=${trackModel.latitude},${trackModel.longitude}&key=$apiKey';
    final response = await dio.get(url);
    if (response.statusCode == 200) {
      final result = response.data;
      final routes = result['routes'];
      final legs = routes[0]['legs'];
      final duration = legs[0]['duration'];
      final durationValue = duration['text'];
      print(durationValue);
      TimeToArrive = durationValue;
      distanceToArrive = legs[0]['distance']['text'];
      //
      /* changeTimeDistance('${(durationValue ~/ 3600)}',
          '${((durationValue % 3600) ~/ 60)}', legs[0]['distance']['text']);*/
      //
      // Decode polyline to get the list of LatLng points
      final points = routes[0]['overview_polyline']['points'];
      final polylinePoints = PolylinePoints();
      final decodedPoints = polylinePoints.decodePolyline(points);
      polylineCoordinates.clear();
      polylineCoordinates = decodedPoints
          .map((point) => LatLng(point.latitude, point.longitude))
          .toList();

      //print(polylineCoordinates);
    } else {
      throw Exception('Failed to retrieve driving route');
    }
    emit(GetPolylineCoordinateState());
  }
}
