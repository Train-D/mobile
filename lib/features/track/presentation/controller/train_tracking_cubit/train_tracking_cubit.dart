// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:traind_app/features/track/presentation/controller/tracking_cubit/tracking_cubit.dart';

part 'train_tracking_state.dart';

class TrainTrackingCubit extends Cubit<TrainTrackingState> {
  TrainTrackingCubit() : super(TrainTrackingInitial()) {}

  static TrainTrackingCubit get(context) => BlocProvider.of(context);
  
  final Completer<GoogleMapController> mapController = Completer();
  LatLng sourceLocation = LatLng(30.620959, 32.269623);
  LatLng distenationLocation = LatLng(32.27027825482803, 30.59309145055676);
  List<LatLng> polylineCoordinates = [];
  String time = '';
  String message = '';
  PolylinePoints polylinePoints = PolylinePoints();
  String apiKey = 'AIzaSyCUUWf60Ms4DRskKz7-y6GuuIWirjPVKAY';

  void drawPolyline(double lat, double lng) async {
    
    final Dio dio = Dio();
    String url = 'https://maps.googleapis.com/maps/api/directions/json?'
        'origin=${sourceLocation.latitude},${sourceLocation.longitude}'
        '&destination=$lat,$lng'
        '&mode=driving'
        '&polyline=true'
        '&key=$apiKey';
    final response = await dio.get(url);
    final jsonResult = response.data;
    var routes = jsonResult['routes'][0]['legs'][0];
    var distance = routes['distance']['text'];
    var duration = routes['duration']['text'];
    for (var steps in routes['steps']) {
      var points = steps['polyline']['points'];
      var longLatPoints = PolylinePoints().decodePolyline(points);
      for (var coordinate in longLatPoints) {
        polylineCoordinates
            .add(LatLng(coordinate.latitude, coordinate.longitude));
      }
    }
    time = duration;
    print('Distance: $distance');
    print('Duration: $duration');
    emit(GetPolylineCoordinateState());
  }

  /*final DatabaseReference database = FirebaseDatabase.instance
      .ref('https://esp32-gps-firebase-8ac4c-default-rtdb.firebaseio.com/');
  void fetchPoints() {
    database.child('latitude').onValue.listen((event) {
      final data = event.snapshot.value;
      if (data != null) {
        print(data);
        //final pointsList = (data as Map<dynamic, dynamic>).values.toList();
        //final points = pointsList.map((pointData) => Point.fromMap(pointData)).toList();
        // emit(state.copyWith(points: points));
      }
    });
  }*/
}
