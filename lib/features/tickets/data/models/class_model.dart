import '../../domain/entities/class_entity.dart';

class ClassModel extends ClassEntity {
  const ClassModel({
    required super.className,
    required super.coaches,
    required super.numberOfSeatsCoach,
    required super.classPrice,
  });
  factory ClassModel.fromJson(Map<String, dynamic> json) {
    return ClassModel(
      className: json['className'],
      coaches: json['coaches'],
      numberOfSeatsCoach: json['numberOfSeatsCoach'],
      classPrice: json['classPrice'],
    );
  }
}