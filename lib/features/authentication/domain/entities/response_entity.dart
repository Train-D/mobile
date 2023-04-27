import 'package:equatable/equatable.dart';

class Response extends Equatable {
  final String token;

  const Response({required this.token});
  @override
  List<Object?> get props => [token];
}
