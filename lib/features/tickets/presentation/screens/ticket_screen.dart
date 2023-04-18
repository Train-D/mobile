import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:screenshot/screenshot.dart';
import '../../../layout/presentation/screens/home_screen.dart';
import '../../../../core/global/theme/app_color/app_color_light.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../core/utils/components.dart';
import '../components/reusable_component/tickets_components.dart';
import '../../../../core/utils/app_strings.dart';
import '../controller/ticket_cubit/cubit/ticket_cubit.dart';
import '../controller/ticket_cubit/cubit/ticket_state.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SharedComponents.linearGradientBg(
        colors: profileBg,
        child: BlocConsumer<TicketCubit, TicketState>(
          builder: (context, state) {
            var cubit = TicketCubit.get(context);
            return Screenshot(
              controller: cubit.screenshotCon,
              child: Scaffold(
                backgroundColor: transparent,
                appBar: SharedComponents.defaultAppBar(context),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 2.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                        ),
                        child: Center(
                          child: buildTicket(
                            context: context,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      SharedComponents.defaultButton(
                        context: context,
                        function: () async {
                          //final ticket = await cubit.screenshotCon.capture();
                          final ticket =
                              await cubit.screenshotCon.captureFromWidget(
                            buildTicket(context: context),
                          );
                          await cubit.saveImage(ticket);
                          cubit.showDialog = true;
                          //print({'resulltttttt $res'});
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
                    ],
                  ),
                ),
              ),
            );
          },
          listener: (context, state) {},
        ),
      ),
    );
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

Widget cutsAndDivider() => Row(
      children: [
        Image(
          image: AssetImage(
            '${AppConstants.vectorsUrl}$ticketLeftCut',
          ),
        ),
        const Spacer(),
        Image(
          image: AssetImage(
            '${AppConstants.vectorsUrl}$ticketDivider',
          ),
        ),
        const Spacer(),
        Image(
          image: AssetImage(
            '${AppConstants.vectorsUrl}$ticketRightCut',
          ),
        ),
      ],
    );

Widget buildTicket({
  required BuildContext context,
}) =>
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
            time: '2h 20m',
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
                  title: AppString.from,
                  label: '08:30 am',
                ),
                TicketsComponents.twoText(
                  context: context,
                  title: AppString.to,
                  label: '10:50 am',
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          TicketsComponents.idNumberContainer(
            context: context,
            idNumber: 'ID Number',
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
                  label: 'Dina Gamal',
                ),
                TicketsComponents.twoText(
                  context: context,
                  title: AppString.date,
                  label: '13/10/2023',
                ),
              ],
            ),
          ),
          TicketsComponents.twoText(
            context: context,
            title: AppString.seat,
            label: 'A2-2',
          ),
          cutsAndDivider(),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(40),
                child: TicketsComponents.priceRow(
                  context: context,
                  price: 34.5,
                ),
              ),
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
        SharedComponents.defaultButton(
          context: context,
          function: () {
            SharedComponents.navigateToRemove(
              context,
              const HomeScreen(),
            );
          },
          text: AppString.backToHome,
          width: 150,
          radius: AppSizes.defaultBottomRadius,
          textSize: 16,
        ),
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
