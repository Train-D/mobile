import '../../domain/entities/profile_user_data_entity.dart';

// ignore: must_be_immutable
class ProfileUserDataModel extends ProfileUserDataEntity {
  const ProfileUserDataModel({
    String? email,
    String? userName,
    String? firstName,
    String? lastName,
    dynamic image,
    String? city,
    String? phoneNumber,
  }) : super(
          email: email,
          userName: userName,
          firstName: firstName,
          lastName: lastName,
          city: city,
          phoneNumber: phoneNumber,
          image: image,
        );

  factory ProfileUserDataModel.fromJson(Map<String, dynamic> json) {
    return ProfileUserDataModel(
      email: json['email'],
      userName: json['userName'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      city: json['city'],
      phoneNumber: json['phoneNumber'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    // return {
    //   "firstName": firstName,
    //   "lastName" : lastName,
    //   "city" : city,
    //   "phoneNumber": phoneNumber,
    //   "image" : image,
    // };
    final Map<String, dynamic> data = <String, dynamic> {};
    //data['email'] = email;
    //data['userName'] = userName;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['city'] = city;
    data['phoneNumber'] = phoneNumber;
    data['image'] = image;
    return data;
  }
}
