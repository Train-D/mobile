import 'package:flutter/material.dart';
import 'package:traind_app/core/global/theme/theme_data/theme_data_light.dart';

Future<DateTime?> datePicker(BuildContext context) => showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime(DateTime.now().year + 1),
    builder: (context, child) => Theme(data: lightTheme(), child: child!),);
