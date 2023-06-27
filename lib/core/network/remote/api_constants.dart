class ApiConstants {
  static const String baseUrl = 'https://traind.azurewebsites.net/api';
  static const String registerPath = '$baseUrl/User/Register';
  static const String loginPath = '$baseUrl/User/Login';
  static const String fromToStationsPath = '$baseUrl/Trips/FromTo';
  static const String tripTimesPath = '$baseUrl/Trips/TripTimes';
  static const String profileGetEndPoint = '/Profile/UserData';
  static const String profilePutEndPoint = '/Profile/UpdateProfile';
  static const String getAllStationsNamesEndPoint = '/Stations';
  static const String trainInfoEndPoint = '/Trips/TrainInfo';
  static const String creditCardEndPoint = '/Stripe/customer/add';
  static const String paymentEndPoint = '/Stripe/Payment/add';
  static const String bookingTicketEndPoint = '/Ticket/Book';
  static const String forgotPaswword = '/User/ForgotPassword';
}
