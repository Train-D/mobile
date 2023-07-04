part of 'train_tracking_cubit.dart';

abstract class TrainTrackingState{}

class TrainTrackingInitial extends TrainTrackingState {}

class GetTrainTrackInfoLoadingState extends TrainTrackingState {}
class GetTrainTrackInfoSuccessState extends TrainTrackingState {}
class GetTrainTrackInfoFailureState extends TrainTrackingState {}
class GetPolylineCoordinateState extends TrainTrackingState{}