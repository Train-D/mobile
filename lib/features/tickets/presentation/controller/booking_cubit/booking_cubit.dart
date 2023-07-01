import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import '../../../../../core/error/exceptions.dart';
import '../../../data/models/first%20screen/from_to_date_model.dart';
import '../../../data/models/first%20screen/trip_info_model.dart';
import '../../../data/models/fourth%20screen/booking_ticket_model.dart';
import '../../../data/models/fourth%20screen/ticket_info_model.dart';
import '../../../data/models/third%20screen/credit_card_model.dart';
import '../../../data/models/third%20screen/payment_model.dart';
import '../../../domain/usecase/payment_usecase.dart';
import '../../../domain/usecase/trip_times_usecase.dart.dart';

import '../../../data/models/first screen/stations_model.dart';
import '../../../data/models/second screen/seat_model.dart';
import '../../../domain/entities/second screen/train_info_entity.dart';
import '../../../domain/usecase/booking_ticket_usecase.dart';
import '../../../domain/usecase/credit_card_usecase.dart';
import '../../../domain/usecase/stations_usecase.dart';
import '../../../data/models/first screen/trip_times_model.dart';
import '../../../domain/usecase/train_info_usecase.dart';
import 'dart:ui' as ui;
import 'package:path_provider/path_provider.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit(
      this.tripTimesDataUsecase,
      this.getStationsUseCase,
      this.trainInfoUseCase,
      this.creditCardUseCase,
      this.paymentUseCase,
      this.bookingTicketUsecase)
      : super(BookingInitial()) {
    getStationsFromApi();
  }
  static BookingCubit get(context) => BlocProvider.of(context);
  //booking first screen data
  var fromToDateCon = TextEditingController();
  String fromDefaultValue = "Select";
  String toDefaultValue = "Select";
  String fromToDefaultDate = 'yyyy/mm/dd';
  dynamic firstScreenErrorMessage = 'Connection Error';
  dynamic thirdScreenErrorMessage = 'Connection Error';
  List<String> allStations = ["Select"];
  List<String> toStations = ["Select"];

  //booking third screen data
  var cardNumber = TextEditingController();
  var expiryYear = TextEditingController();
  var expiryMonth = TextEditingController();
  var email = TextEditingController();
  var cardHolderName = TextEditingController();
  var cvvCode = TextEditingController();
  bool saveCardData = false;
  dynamic tripID;
  late dynamic paymentID;

  //fourth screen data
  // ignore: prefer_typing_uninitialized_variables
  var seatNumber;
  // ignore: prefer_typing_uninitialized_variables
  var coach;
  // ignore: prefer_typing_uninitialized_variables
  var classs;
  // ignore: prefer_typing_uninitialized_variables
  var seatPrice;
  final screenshotCon = ScreenshotController();
  Future<String> saveImage(Uint8List bytes) async {
    await [Permission.storage].request();

    final time = DateTime.now().toString();
    final name = 'ticket $time';
    final result = await ImageGallerySaver.saveImage(
      bytes,
      name: name,
    );
    return result['filePath'];
  }

  final GlobalKey globalKey = GlobalKey();

  Future<void> captureWidget() async {
    try {
       emit(DownloadWidgetLoadingState());
      final RenderRepaintBoundary boundary =
          globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;

      final ui.Image image = await boundary.toImage(pixelRatio: 1.0);

      final ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);

      final Uint8List pngBytes = byteData!.buffer.asUint8List();
      
      //save the image to the gallery
      final result = await ImageGallerySaver.saveImage(pngBytes);

      if (result['isSuccess'] == true) {
        emit(DownloadWidgetSuccessState());
      } else {
        emit(DownloadWidgetErrorState());
      }
    } catch (e) {
       emit(DownloadWidgetErrorState());
      print(e.toString());
    }
  }

  bool showDialog = false;

  // clean data of the cubit
  cleanData() {
    /*fromDefaultValue = "Select";
    toDefaultValue = "Select";
    fromToDefaultDate = 'yyyy/mm/dd';
    firstScreenErrorMessage = 'Connection Error';*/
    cardNumber.clear();
    expiryYear.clear();
    expiryMonth.clear();
    email.clear();
    cardHolderName.clear();
    cvvCode.clear();
    emit(CleanCubitDataState());
  }

  resetData() {
    emit(BookingInitial());
  }

  //get data of booking first screen
  final GetStationsUseCase getStationsUseCase;
  late StationsModel stationsModel;

  Future<void> getStationsFromApi() async {
    emit(FromToStationsLoadingState());
    try {
      final result = await getStationsUseCase();
      result.fold((l) {}, (r) {
        stationsModel = StationsModel.fromJson(r.stations);
        //print(stationsModel.stations);
        for (var station in stationsModel.stations.keys) {
          allStations.add(station);
        }
      });
      emit(FromToStationsSuccessState());
    } on ServerException catch (e) {
      stationsModel = StationsModel.fromJson(const {});
      emit(FromToStationsErrorState(e.toString()));
    } on DioError catch (e) {
      stationsModel = StationsModel.fromJson(const {});
      emit(FromToStationsErrorState(e.response.toString()));
    }
  }

  final TripTimesDataUsecase tripTimesDataUsecase;
  late TripTimesModel tripTimesModel;
  Future<void> getTripTimes() async {
    emit(GetTripsLoadingState());

    try {
      final result = await tripTimesDataUsecase(FromToDateModel(
          fromStation: fromDefaultValue,
          toStation: toDefaultValue,
          date: fromToDefaultDate));
      result.fold((l) {}, (r) {
        tripTimesModel = TripTimesModel.fromjson(r.tripTimes);
      });
      emit(GetTripsSuccessState());
    } on ServerException catch (e) {
      firstScreenErrorMessage = 'Connection Error';
      emit(GetTripsErrorState(message: e.toString()));
    } on DioError catch (e) {
      firstScreenErrorMessage =
          e.response?.data['message'] ?? 'Connection Error';
      emit(GetTripsErrorState(message: e.message.toString()));
    }
  }

  //get data of booking train screen

  List<SeatModel> firstCarSeats = [
    const SeatModel(
      seatNumber: 1,
      coach: 1,
      classChar: "A",
    ),
    const SeatModel(
      seatNumber: 2,
      coach: 1,
      classChar: "A",
    ),
    const SeatModel(
      seatNumber: 3,
      coach: 1,
      classChar: "A",
    ),
    const SeatModel(
      seatNumber: 4,
      coach: 1,
      classChar: "A",
    ),
    const SeatModel(
      seatNumber: 5,
      coach: 1,
      classChar: "A",
    ),
    const SeatModel(
      seatNumber: 6,
      coach: 1,
      classChar: "A",
    ),
    const SeatModel(
      seatNumber: 7,
      coach: 1,
      classChar: "A",
    ),
    const SeatModel(
      seatNumber: 8,
      coach: 1,
      classChar: "A",
    ),
    const SeatModel(
      seatNumber: 9,
      coach: 1,
      classChar: "A",
    ),
    const SeatModel(
      seatNumber: 10,
      coach: 1,
      classChar: "A",
    ),
    const SeatModel(
      seatNumber: 11,
      coach: 1,
      classChar: "A",
    ),
    const SeatModel(
      seatNumber: 12,
      coach: 1,
      classChar: "A",
    ),
  ];

  List<SeatModel> carA2 = [
    const SeatModel(
      seatNumber: 1,
      coach: 2,
      classChar: "A",
    ),
    const SeatModel(
      seatNumber: 2,
      coach: 2,
      classChar: "A",
    ),
    const SeatModel(
      seatNumber: 3,
      coach: 2,
      classChar: "A",
    ),
    const SeatModel(
      seatNumber: 4,
      coach: 2,
      classChar: "A",
    ),
    const SeatModel(
      seatNumber: 5,
      coach: 2,
      classChar: "A",
    ),
    const SeatModel(
      seatNumber: 6,
      coach: 2,
      classChar: "A",
    ),
    const SeatModel(
      seatNumber: 7,
      coach: 2,
      classChar: "A",
    ),
    const SeatModel(
      seatNumber: 8,
      coach: 2,
      classChar: "A",
    ),
    const SeatModel(
      seatNumber: 9,
      coach: 2,
      classChar: "A",
    ),
    const SeatModel(
      seatNumber: 10,
      coach: 2,
      classChar: "A",
    ),
    const SeatModel(
      seatNumber: 11,
      coach: 2,
      classChar: "A",
    ),
    const SeatModel(
      seatNumber: 12,
      coach: 2,
      classChar: "A",
    ),
  ];

  List<SeatModel> carB1 = [
    const SeatModel(
      seatNumber: 1,
      coach: 1,
      classChar: "B",
    ),
    const SeatModel(
      seatNumber: 2,
      coach: 1,
      classChar: "B",
    ),
    const SeatModel(
      seatNumber: 3,
      coach: 1,
      classChar: "B",
    ),
    const SeatModel(
      seatNumber: 4,
      coach: 1,
      classChar: "B",
    ),
    const SeatModel(
      seatNumber: 5,
      coach: 1,
      classChar: "B",
    ),
    const SeatModel(
      seatNumber: 6,
      coach: 1,
      classChar: "B",
    ),
    const SeatModel(
      seatNumber: 7,
      coach: 1,
      classChar: "B",
    ),
    const SeatModel(
      seatNumber: 8,
      coach: 1,
      classChar: "B",
    ),
    const SeatModel(
      seatNumber: 9,
      coach: 1,
      classChar: "B",
    ),
    const SeatModel(
      seatNumber: 10,
      coach: 1,
      classChar: "B",
    ),
    const SeatModel(
      seatNumber: 11,
      coach: 1,
      classChar: "B",
    ),
    const SeatModel(
      seatNumber: 12,
      coach: 1,
      classChar: "B",
    ),
    const SeatModel(
      seatNumber: 13,
      coach: 1,
      classChar: "B",
    ),
    const SeatModel(
      seatNumber: 14,
      coach: 1,
      classChar: "B",
    ),
    const SeatModel(
      seatNumber: 15,
      coach: 1,
      classChar: "B",
    ),
    const SeatModel(
      seatNumber: 16,
      coach: 1,
      classChar: "B",
    ),
  ];

  List<SeatModel> carB2 = [
    const SeatModel(
      seatNumber: 1,
      coach: 2,
      classChar: "B",
    ),
    const SeatModel(
      seatNumber: 2,
      coach: 2,
      classChar: "B",
    ),
    const SeatModel(
      seatNumber: 3,
      coach: 2,
      classChar: "B",
    ),
    const SeatModel(
      seatNumber: 4,
      coach: 2,
      classChar: "B",
    ),
    const SeatModel(
      seatNumber: 5,
      coach: 2,
      classChar: "B",
    ),
    const SeatModel(
      seatNumber: 6,
      coach: 2,
      classChar: "B",
    ),
    const SeatModel(
      seatNumber: 7,
      coach: 2,
      classChar: "B",
    ),
    const SeatModel(
      seatNumber: 8,
      coach: 2,
      classChar: "B",
    ),
    const SeatModel(
      seatNumber: 9,
      coach: 2,
      classChar: "B",
    ),
    const SeatModel(
      seatNumber: 10,
      coach: 2,
      classChar: "B",
    ),
    const SeatModel(
      seatNumber: 11,
      coach: 2,
      classChar: "B",
    ),
    const SeatModel(
      seatNumber: 12,
      coach: 2,
      classChar: "B",
    ),
    const SeatModel(
      seatNumber: 13,
      coach: 2,
      classChar: "B",
    ),
    const SeatModel(
      seatNumber: 14,
      coach: 2,
      classChar: "B",
    ),
    const SeatModel(
      seatNumber: 15,
      coach: 2,
      classChar: "B",
    ),
    const SeatModel(
      seatNumber: 16,
      coach: 2,
      classChar: "B",
    ),
  ];

  List<SeatModel> carC1 = [
    const SeatModel(
      seatNumber: 1,
      coach: 1,
      classChar: "C",
    ),
    const SeatModel(
      seatNumber: 2,
      coach: 1,
      classChar: "C",
    ),
    const SeatModel(
      seatNumber: 3,
      coach: 1,
      classChar: "C",
    ),
    const SeatModel(
      seatNumber: 4,
      coach: 1,
      classChar: "C",
    ),
    const SeatModel(
      seatNumber: 5,
      coach: 1,
      classChar: "B",
    ),
    const SeatModel(
      seatNumber: 6,
      coach: 1,
      classChar: "C",
    ),
    const SeatModel(
      seatNumber: 7,
      coach: 1,
      classChar: "C",
    ),
    const SeatModel(
      seatNumber: 8,
      coach: 1,
      classChar: "C",
    ),
    const SeatModel(
      seatNumber: 9,
      coach: 1,
      classChar: "C",
    ),
    const SeatModel(
      seatNumber: 10,
      coach: 1,
      classChar: "C",
    ),
    const SeatModel(
      seatNumber: 11,
      coach: 1,
      classChar: "C",
    ),
    const SeatModel(
      seatNumber: 12,
      coach: 1,
      classChar: "C",
    ),
    const SeatModel(
      seatNumber: 13,
      coach: 1,
      classChar: "C",
    ),
    const SeatModel(
      seatNumber: 14,
      coach: 1,
      classChar: "C",
    ),
    const SeatModel(
      seatNumber: 15,
      coach: 1,
      classChar: "C",
    ),
    const SeatModel(
      seatNumber: 16,
      coach: 1,
      classChar: "C",
    ),
  ];

  List<SeatModel> carC2 = [
    const SeatModel(
      seatNumber: 1,
      coach: 2,
      classChar: "C",
    ),
    const SeatModel(
      seatNumber: 2,
      coach: 2,
      classChar: "C",
    ),
    const SeatModel(
      seatNumber: 3,
      coach: 2,
      classChar: "C",
    ),
    const SeatModel(
      seatNumber: 4,
      coach: 2,
      classChar: "C",
    ),
    const SeatModel(
      seatNumber: 5,
      coach: 2,
      classChar: "B",
    ),
    const SeatModel(
      seatNumber: 6,
      coach: 2,
      classChar: "C",
    ),
    const SeatModel(
      seatNumber: 7,
      coach: 2,
      classChar: "C",
    ),
    const SeatModel(
      seatNumber: 8,
      coach: 2,
      classChar: "C",
    ),
    const SeatModel(
      seatNumber: 9,
      coach: 2,
      classChar: "C",
    ),
    const SeatModel(
      seatNumber: 10,
      coach: 2,
      classChar: "C",
    ),
    const SeatModel(
      seatNumber: 11,
      coach: 2,
      classChar: "C",
    ),
    const SeatModel(
      seatNumber: 12,
      coach: 2,
      classChar: "C",
    ),
    const SeatModel(
      seatNumber: 13,
      coach: 2,
      classChar: "C",
    ),
    const SeatModel(
      seatNumber: 14,
      coach: 2,
      classChar: "C",
    ),
    const SeatModel(
      seatNumber: 15,
      coach: 2,
      classChar: "C",
    ),
    const SeatModel(
      seatNumber: 16,
      coach: 2,
      classChar: "C",
    ),
  ];

  List<SeatModel> carC3 = [
    const SeatModel(
      seatNumber: 1,
      coach: 3,
      classChar: "C",
    ),
    const SeatModel(
      seatNumber: 2,
      coach: 3,
      classChar: "C",
    ),
    const SeatModel(
      seatNumber: 3,
      coach: 3,
      classChar: "C",
    ),
    const SeatModel(
      seatNumber: 4,
      coach: 3,
      classChar: "C",
    ),
    const SeatModel(
      seatNumber: 5,
      coach: 3,
      classChar: "B",
    ),
    const SeatModel(
      seatNumber: 6,
      coach: 3,
      classChar: "C",
    ),
    const SeatModel(
      seatNumber: 7,
      coach: 3,
      classChar: "C",
    ),
    const SeatModel(
      seatNumber: 8,
      coach: 3,
      classChar: "C",
    ),
    const SeatModel(
      seatNumber: 9,
      coach: 3,
      classChar: "C",
    ),
    const SeatModel(
      seatNumber: 10,
      coach: 3,
      classChar: "C",
    ),
    const SeatModel(
      seatNumber: 11,
      coach: 3,
      classChar: "C",
    ),
    const SeatModel(
      seatNumber: 12,
      coach: 3,
      classChar: "C",
    ),
    const SeatModel(
      seatNumber: 13,
      coach: 3,
      classChar: "C",
    ),
    const SeatModel(
      seatNumber: 14,
      coach: 3,
      classChar: "C",
    ),
    const SeatModel(
      seatNumber: 15,
      coach: 3,
      classChar: "C",
    ),
    const SeatModel(
      seatNumber: 16,
      coach: 3,
      classChar: "C",
    ),
  ];

  final TrainInfoUseCase trainInfoUseCase;
  late TrainInfoEntity trainInfoEntity;
  late double classAPrice;
  late double classBPrice;
  late double classCPrice;

  Future<void> getTrainInfo(int tripId, String tripDate) async {
    tripID = tripId;
    emit(GetTrainInfoLoadingState());
    var result = await trainInfoUseCase
        .call(TripInfoModel(tripId: tripId, tripDate: tripDate));
    result.fold((failure) {
      debugPrint(failure.toString());
      emit(GetTrainInfoFailureState());
    }, (trainInfoData) {
      trainInfoEntity = trainInfoData;
      classAPrice = trainInfoData.classes[0].classPrice;
      classBPrice = trainInfoData.classes[1].classPrice;
      classCPrice = trainInfoData.classes[2].classPrice;
      //print('${classAPrice}  ${classBPrice}  ${classCPrice}');
      //print(trainInfoEntity);

      emit(GetTrainInfoSuccessState());
    });
  }

  bool isSeatBooked(SeatModel model) {
    for (int i = 0; i < trainInfoEntity.seats.length; i++) {
      if (trainInfoEntity.seats[i].coach == model.coach &&
          trainInfoEntity.seats[i].classChar == model.classChar &&
          trainInfoEntity.seats[i].seatNumber == model.seatNumber) {
        return true;
      }
    }
    return false;
  }

  //get data of booking third screen
  final CreditCardUseCase creditCardUseCase;
  final PaymentUseCase paymentUseCase;
  Future<void> getPaymentCustomerData() async {
    emit(GetPaymentCustomerDataLoadingState());
    var result = await creditCardUseCase.call(CreditCardModel(
        email: email.text,
        name: cardHolderName.text,
        creditCard: {
          "name": cardHolderName.text,
          "cardNumber": cardNumber.text,
          "expirationYear": expiryYear.text,
          "expirationMonth": expiryMonth.text,
          "cvc": cvvCode.text
        }));
    result.fold((failure) {
      debugPrint(failure.toString());
      thirdScreenErrorMessage = failure.message;
      print(failure);
      emit(GetPaymentCustomerDataFailureState());
    }, (paymentCustomerData) async {
      //print(paymentCustomerData);
      var data = await paymentUseCase.call(PaymentModel(
          customerId: paymentCustomerData.customerId,
          email: paymentCustomerData.email,
          description: "Test",
          currency: "USD",
          amount: seatPrice.toInt() * 100));
      data.fold((failure) {
        debugPrint(failure.toString());
        thirdScreenErrorMessage = failure.message;
        //print(failure);
        emit(GetPaymentCustomerDataFailureState());
      }, (paymentIdData) {
        //print(paymentIdData);
        paymentID = paymentIdData.paymentId;
        emit(GetPaymentCustomerDataSuccessState());
      });
    });
  }

  //get data of booking fourth screen
  final BookingTicketUsecase bookingTicketUsecase;
  TicketInfoModel ticketInfoModel = const TicketInfoModel(
      from: '',
      to: '',
      startTime: '',
      endTime: '',
      ticketId: 0,
      passengerName: '',
      date: '',
      className: '',
      coachNumber: 0,
      seatNumber: 0,
      price: 0,
      duration: '');
  Future<void> getTicketData() async {
    emit(GetTicketDataLoadingState());
    var result = await bookingTicketUsecase.call(BookingTicketModel(
        tripId: tripID,
        date: fromToDefaultDate,
        seatNumber: seatNumber,
        coach: coach,
        classs: classs,
        amount: seatPrice,
        paymentId: paymentID));
    result.fold((failure) {
      debugPrint(failure.toString());

      emit(GetTicketDataFailureState());
    }, (ticketData) async {
      //print(ticketData);
      ticketInfoModel = TicketInfoModel(
        from: ticketData.from,
        to: ticketData.to,
        startTime: ticketData.startTime,
        endTime: ticketData.endTime,
        ticketId: ticketData.ticketId,
        passengerName: ticketData.passengerName,
        date: ticketData.date,
        className: ticketData.className,
        coachNumber: ticketData.coachNumber,
        seatNumber: ticketData.seatNumber,
        price: ticketData.price,
        duration: ticketData.duration,
      );
      //print(ticketInfoModel);
      emit(GetTicketDataSuccessState());
    });
  }

  //change UI of booking first screen
  void getToStationsData(String fromStation) {
    toStations.removeRange(1, toStations.length);
    if (fromStation != 'Select') {
      for (var station in stationsModel.stations[fromStation]) {
        toStations.add(station);
      }
    } else {
      toDefaultValue = "Select";
    }
    emit(GetToStationsDataState());
  }

  void changeDefualtDate(String newDate) {
    fromToDefaultDate = newDate;
    emit(ChangeDefualtDateState());
  }

  void changeDropDownButtonValue(int option, String newValue) {
    if (option == 1) {
      fromDefaultValue = newValue;
      toDefaultValue = "Select";
      emit(ChangeDropDownButtonValueState());
    } else {
      toDefaultValue = newValue;
      emit(ChangeDropDownButtonValueState());
    }
  }

  //change UI of third booking screen
  void changeCheckboxValue() {
    saveCardData = !saveCardData;
    emit(PaymentSaveDataCheckboxChangeState());
  }
}
