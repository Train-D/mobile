import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());


  static ProfileCubit get(context) => BlocProvider.of(context);

  var profileFirstNameCon = TextEditingController();
  var profileLastNameCon = TextEditingController();
  var profileUsernameCon = TextEditingController();  
  var profileEmailCon = TextEditingController();
  var profilePhoneCon = TextEditingController();
  var profileCityCon = TextEditingController();
  
}
