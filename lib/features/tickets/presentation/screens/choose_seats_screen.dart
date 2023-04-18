import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traind_app/core/global/theme/app_color/app_color_light.dart';
import 'package:traind_app/core/utils/components.dart';
import 'package:traind_app/features/tickets/presentation/components/widgets/train_first_car_widget.dart';
import 'package:traind_app/features/tickets/presentation/controller/choose_seats/choose_seats_cubit.dart';
import 'package:traind_app/features/tickets/presentation/controller/choose_seats/choose_seats_state.dart';
import '../components/reusable_component/tickets_components.dart';
import '../components/widgets/choose_seats_alert_dialog_content_widget.dart';

class ChooseSeatsScreen extends StatelessWidget {
  const ChooseSeatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> trainCars = [
      trainFirstCar(context: context),
      trainFirstCar(context: context),
      trainFirstCar(context: context)
    ];
    return SafeArea(
        child: SharedComponents.linearGradientBg(
      colors: profileBg,
      child: BlocConsumer<ChooseSeatsCubit, ChooseSeatsState>(
        listener: (context, state) {},
        builder: (context, state) {
          //ChooseSeatsCubit cubit = ChooseSeatsCubit.get(context);
          return Scaffold(
            backgroundColor: transparent,
            appBar: SharedComponents.defaultAppBar(
              context: context,
              chooseSeatsScreenAppBar: true,
            ),
            body: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'avialable\n unavialable',
                ),
                SizedBox(
                  width: 220,
                  //height: double.infinity,
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, idx) => trainCars[idx],
                    separatorBuilder: (context, idx) =>
                        const SizedBox(height: 20),
                    itemCount: trainCars.length,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    ));
  }
}

dynamic showChooseSeatsAlertDialog({
  required BuildContext context,
  required String seatNumber,
}) {
  showDialog(
    barrierDismissible: true,
    context: context,
    builder: (BuildContext context) {
      return TicketsComponents.defaultAlertDialog(
        height: 190,
        content: chooseSeatsAlertDialogContent(
          context: context,
          seatNumber: seatNumber,
        ),
      );
    },
  );
}
