import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:screenshot/screenshot.dart';
import '../controller/booking_cubit/booking_cubit.dart';
import '../../../layout/presentation/screens/home_screen.dart';
import '../../../../core/global/theme/app_color/app_color_light.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../core/utils/components.dart';
import '../components/reusable_component/tickets_components.dart';
import '../../../../core/utils/app_strings.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
        BlocBuilder<BookingCubit, BookingState>(builder: (context, state) {
      BookingCubit cubit = BookingCubit.get(context);
      Widget ticketData = buildTicket(
          context: context,
          startTime: cubit.ticketInfoModel.startTime,
          endTime: cubit.ticketInfoModel.endTime,
          idNumber: cubit.ticketInfoModel.ticketId.toString(),
          name: cubit.ticketInfoModel.passengerName,
          date: cubit.ticketInfoModel.date,
          price: cubit.ticketInfoModel.price,
          classs: cubit.ticketInfoModel.className,
          seatNumber: cubit.ticketInfoModel.seatNumber,
          coachNumber: cubit.ticketInfoModel.coachNumber,
          time: cubit.ticketInfoModel.duration,
          from: cubit.ticketInfoModel.from,
          to: cubit.ticketInfoModel.to);
      return SharedComponents.linearGradientBg(
          colors: profileBg,
          child: Screenshot(
              controller: cubit.screenshotCon,
              child: Scaffold(
                backgroundColor: transparent,
                appBar: SharedComponents.defaultAppBar(context: context),
                //appBar: SharedComponents.defaultAppBar(context: context),
                body: state is GetTicketDataLoadingState
                    ? const Center(child: CircularProgressIndicator())
                    : SingleChildScrollView(
                        child: Center(
                          child: Column(children: [
                            SizedBox(
                              height: 2.h,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 25,
                              ),
                              child: Center(
                                child: ticketData,
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            SharedComponents.defaultButton(
                              context: context,
                              function: () async {
                                final ticket = await cubit.screenshotCon
                                    .captureFromWidget(ticketData);
                                await cubit.saveImage(ticket);
                                cubit.showDialog = true;
                                //await cubit.captureWidget();
                                showTicketAlertDialog(context: context);
                              },
                              text: AppString.download,
                              width: AppSizes.width(context) / 2.5,
                              height: AppSizes.height(context) / 14,
                              radius: AppSizes.defaultBottomRadius,
                              withIcon: true,
                              icon: Icons.arrow_downward_outlined,
                              iconSize: 18.sp,
                            ),
                          ]),
                        ),
                      ),
              )));
    }));
  }
}

Widget ticketLogoAndAppName() => Row(
      children: [
        Image(
          image: AssetImage('${AppConstants.vectorsUrl}$ticketLogo'),
        ),
        const Text(
          AppString.appName,
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Grechen Fuemen',
            color: lightColor,
          ),
        ),
      ],
    );

Widget trainStack({
  required BuildContext context,
  required String time,
}) =>
    Stack(
      alignment: Alignment.center,
      children: [
        Image(
          image: AssetImage(
            '${AppConstants.vectorsUrl}$ticketTrainCurveVector',
          ),
        ),
        Text(
          time,
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w100,
              ),
        ),
      ],
    );
Widget cutsAndDivider({
  required BuildContext context,
}) =>
    Row(
      children: [
        Image(
          image: AssetImage(
            '${AppConstants.vectorsUrl}$ticketLeftCut',
          ),
        ),
        const Spacer(),
        Row(children: [
          // TextButton(
          //   onPressed: () {
          //     print(wid);
          //   },
          //   child: Text('test'),
          // ),
          //for (int i = 0; i < (wid - 103) / 9; i++)
          Image(
            fit: BoxFit.fitWidth,
            image: AssetImage(
              '${AppConstants.vectorsUrl}tss.png',
            ),
          ),
        ]),
        const Spacer(),
        Image(
          image: AssetImage(
            '${AppConstants.vectorsUrl}$ticketRightCut',
          ),
        ),
      ],
    );

Widget buildTicket(
        {required BuildContext context,
        required String startTime,
        required String endTime,
        required String idNumber,
        required String name,
        required String date,
        required double price,
        required String classs,
        required int seatNumber,
        required int coachNumber,
        required String time,
        required String from,
        required String to}) =>
    Container(
      width: 328,
      height: 610,
      decoration: BoxDecoration(
        color: ticketColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(25),
            child: ticketLogoAndAppName(),
          ),
          const SizedBox(
            height: 30,
          ),
          trainStack(
            context: context,
            time: time,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TicketsComponents.twoText(
                  context: context,
                  title: from,
                  label: startTime,
                ),
                TicketsComponents.twoText(
                  context: context,
                  title: to,
                  label: endTime,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          TicketsComponents.idNumberContainer(
            context: context,
            idNumber: idNumber,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TicketsComponents.twoText(
                  context: context,
                  title: AppString.passenger,
                  label: name,
                ),
                TicketsComponents.twoText(
                  context: context,
                  title: AppString.date,
                  label: date,
                ),
              ],
            ),
          ),
          TicketsComponents.twoText(
            context: context,
            title: AppString.seat,
            label: '$classs$coachNumber-$seatNumber',
          ),
          const SizedBox(
            height: 20,
          ),
          cutsAndDivider(
            context: context,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TicketsComponents.priceRow(
                context: context,
                price: price,
              ),
              Container(
                color: lightColor,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: BarcodeWidget(
                    barcode: Barcode.qrCode(),
                    data: 'From: $from ($startTime)\nTo: $to ($endTime)\nPassenger: $name\nDate: $date\nSeat: $classs$coachNumber-$seatNumber',
                    width: 70,
                    height: 70,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );

Widget alertDialogTicketContent({
  required BuildContext context,
}) =>
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: AssetImage('${AppConstants.vectorsUrl}$ticketSuccessDownload'),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          AppString.ticketSuccessDownload,
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
        ),
        const SizedBox(
          height: 20,
        ),
        BlocConsumer<BookingCubit, BookingState>(
            listener: (context, state) {},
            builder: (context, state) {
              var cubit = BookingCubit.get(context);
              return SharedComponents.defaultButton(
                context: context,
                function: () {
                  cubit.resetData();
                  SharedComponents.navigateToRemove(
                    context,
                    const HomeScreen(),
                  );
                },
                text: AppString.backToHome,
                width: 150,
                radius: AppSizes.defaultBottomRadius,
                textSize: 16,
              );
            }),
      ],
    );

showTicketAlertDialog({
  required BuildContext context,
}) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return TicketsComponents.defaultAlertDialog(
        height: 220,
        content: alertDialogTicketContent(context: context),
      );
    },
  );
}
