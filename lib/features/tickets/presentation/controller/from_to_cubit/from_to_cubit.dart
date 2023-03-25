import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'from_to_state.dart';

class FromToCubit extends Cubit<FromToState> {
  FromToCubit() : super(FromToInitial());
  static FromToCubit get(context) => BlocProvider.of(context);

  var fromToDateCon = TextEditingController();
}
