import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traind_app/core/error/exceptions.dart';
import 'package:traind_app/features/tickets/data/models/first%20screen/from_to_date_model.dart';
import 'package:traind_app/features/tickets/data/models/first%20screen/trip_info_model.dart';
import 'package:traind_app/features/tickets/data/models/third%20screen/credit_card_model.dart';
import 'package:traind_app/features/tickets/data/models/third%20screen/payment_model.dart';
import 'package:traind_app/features/tickets/domain/usecase/payment_usecase.dart';
import 'package:traind_app/features/tickets/domain/usecase/trip_times_usecase.dart.dart';

import '../../../data/models/first screen/stations_model.dart';
import '../../../data/models/second screen/seat_model.dart';
import '../../../domain/entities/second screen/train_info_entity.dart';
import '../../../domain/usecase/credit_card_usecase.dart';
import '../../../domain/usecase/stations_usecase.dart';
import '../../../data/models/first screen/trip_times_model.dart';
import '../../../domain/usecase/train_info_usecase.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit(this.tripTimesDataUsecase, this.getStationsUseCase,
      this.trainInfoUseCase, this.creditCardUseCase, this.paymentUseCase)
      : super(FromToInitial()) {
    getStationsFromApi();
  }
  static BookingCubit get(context) => BlocProvider.of(context);
  //booking first screen data
  var fromToDateCon = TextEditingController();
  String fromDefaultValue = "Select";
  String toDefaultValue = "Select";
  String fromToDefaultDate = 'yyyy/mm/dd';
  dynamic errorMessage = 'Connection Error';
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
      errorMessage = 'Connection Error';
      emit(GetTripsErrorState(message: e.toString()));
    } on DioError catch (e) {
      errorMessage = e.response?.data['message'] ?? 'Connection Error';
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

  void bookSeat(String seatNumber) {
    int idx = int.parse(seatNumber);
    //firstCarSeats[idx - 1].book = !firstCarSeats[idx - 1].isAvailable;
    emit(ChooseSeatsBookSeatSuccessState());
  }

  bool visibleSelectedCarContainer = false;

  void changeVisibleSelectedCarContainer(int carNumber) {
    visibleSelectedCarContainer = !visibleSelectedCarContainer;

    emit(ChangeVisiableState());
  }

  ScrollController sc = ScrollController();
  int firstIdx = 0;

  void initScrollCon() {
    sc.addListener(() {
      firstIdx = sc.offset ~/ 480;
      emit(ChangeScrollControllerState());
    });
  }

  final TrainInfoUseCase trainInfoUseCase;
  late TrainInfoEntity trainInfoEntity;
  late double classAPrice;
  late double classBPrice;
  late double classCPrice;

  Future<void> getTrainInfo(int tripId, String tripDate) async {
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
      print('${classAPrice}  ${classBPrice}  ${classCPrice}');
      print(trainInfoEntity);

      emit(GetTrainInfoSuccessState());
    });
  }

  bool isBooked = false;
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
      emit(GetPaymentCustomerDataFailureState());
    }, (paymentCustomerData) async {
      print(paymentCustomerData);
      var data = await paymentUseCase.call(PaymentModel(
          customerId: paymentCustomerData.customerId,
          email: paymentCustomerData.email,
          description: "Test",
          currency: "USD",
          amount: 100));
      data.fold((failure) {
        debugPrint(failure.toString());
        emit(GetPaymentCustomerDataFailureState());
      }, (customerIdData) {
        print(customerIdData);
        emit(GetPaymentCustomerDataSuccessState());
      });
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
