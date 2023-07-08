// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../controller/choose_seats/choose_seats_cubit.dart';
// import '../../controller/choose_seats/choose_seats_state.dart';
// import '../classes/train_default_car_custom_paint.dart';
// import '../reusable_component/choose_seats_screen_components.dart';

// Widget trainSecondCar({
//   required BuildContext context,
// }) =>
//     BlocConsumer<ChooseSeatsCubit, ChooseSeatsState>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         //int leftIdx = -4;
//         //int rightIdx = -2;
//         ChooseSeatsCubit cubit = ChooseSeatsCubit.get(context);
//         return SizedBox(
//           width: 220,
//           height: 430,
//           child: CustomPaint(
//               painter: TrainDefaultCarShape(),
//               child: Column(
//                 children: [
//                   const SizedBox(
//                     height: 55,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SizedBox(
//                         width: 107,
//                         height: 300,
//                         child: ListView.separated(
//                           shrinkWrap: true,
//                           physics: const NeverScrollableScrollPhysics(),
//                           itemBuilder: (context, idx) {
//                             leftIdx += 4;
//                             return Padding(
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 15,
//                               ),
//                               /*child: ChooseSeatsComponents.twoSeats(
//                                 context: context,
//                                 seat1: cubit.secondCarSeats[leftIdx],
//                                 seat2: cubit.secondCarSeats[leftIdx + 1],
//                               ),
//                             */
//                             );
//                           },
//                           separatorBuilder: (context, idx) => const SizedBox(
//                             height: 35,
//                           ),
//                           itemCount: (cubit.secondCarSeats.length ~/ 4).toInt(),
//                         ),
//                       ),
//                       ChooseSeatsComponents.defaultDividerLine(
//                         height: 310,
//                       ),
//                       SizedBox(
//                         width: 107,
//                         height: 300,
//                         child: ListView.separated(
//                           shrinkWrap: true,
//                           physics: const NeverScrollableScrollPhysics(),
//                           itemBuilder: (context, idx) {
//                             rightIdx += 4;
//                             return Padding(
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 15,
//                               ),
//                               /*child: ChooseSeatsComponents.twoSeats(
//                                 context: context,
//                                 seat1: cubit.secondCarSeats[rightIdx],
//                                 seat2: cubit.secondCarSeats[rightIdx + 1],
//                               ),*/
//                             );
//                           },
//                           separatorBuilder: (context, idx) => const SizedBox(
//                             height: 35,
//                           ),
//                           itemCount: (cubit.secondCarSeats.length ~/ 4).toInt(),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               )),
//         );
//       },
//     );
