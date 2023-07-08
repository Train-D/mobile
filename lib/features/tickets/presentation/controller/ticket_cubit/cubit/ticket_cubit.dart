import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';

import 'ticket_state.dart';

class TicketCubit extends Cubit<TicketState> {
  TicketCubit() : super(TicketInitialState());

  static TicketCubit get(context) => BlocProvider.of(context);

  final screenshotCon = ScreenshotController();

  // Future<String> saveImage(Uint8List bytes) async {
  //   await [Permission.storage].request();

  //   final time = DateTime.now().toString();
  //   final name = 'ticket $time';
  //   final result = await ImageGallerySaver.saveImage(
  //     bytes,
  //     name: name,
  //   );
  //   return result['filePath'];
  // }

  Future<String?> saveImage(Uint8List bytes) async {
    //await [Permission.storage].request();
    //final PermissionStatus permissionStatus = await Permission.storage.status;

    //if (permissionStatus.isGranted) {
    final time = DateTime.now().toString();
    final name = 'ticket $time';
    final result = await ImageGallerySaver.saveImage(
      bytes,
      name: name,
    );
    return result['filePath'];
    //}
    //else {
    //return null;
    //}
  }

  bool showDialog = false;
}
