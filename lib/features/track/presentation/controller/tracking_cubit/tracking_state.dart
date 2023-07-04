part of 'tracking_cubit.dart';

abstract class TrackingState{}

class TrackingInitial extends TrackingState {}

class GetTrackInfoLoadingState extends TrackingState {}
class GetTrackInfoSuccessState extends TrackingState {}
class GetTrackInfoFailureState extends TrackingState {}
class GetPolylineCoordinateState extends TrackingState{}
class GetCoordinateState extends TrackingState{}