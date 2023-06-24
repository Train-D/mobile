import 'package:equatable/equatable.dart';

class ClassEntity extends Equatable {
  final String className;
  final int coaches;
  final int numberOfSeatsCoach;
  final double classPrice;
  const ClassEntity({
    required this.className,
    required this.coaches,
    required this.numberOfSeatsCoach,
    required this.classPrice,
  });

  @override
  List<Object?> get props => [
        className,
        coaches,
        numberOfSeatsCoach,
        classPrice,
      ];
}
