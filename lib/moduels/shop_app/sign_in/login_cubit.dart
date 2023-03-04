import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing/models/login_model.dart';
import 'package:testing/moduels/shop_app/sign_in/login_state.dart';
import 'package:testing/network/remote/dio_shop_app.dart';
import 'package:testing/shared/end_points.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(InitLoginState());

 static LoginCubit get(context) => BlocProvider.of(context);

  LoginModel? loginModel;

  void getLoginData({
    required String email,
    required String password,
  }) {
    emit(LeadingLogin());
    ShopDio.postData(
        url: login, data: {
      'email': email,
      'password': password,
    })?.then((value) {
      loginModel = LoginModel.fromJson(value?.data);
      emit(SuccessLogin(loginModel!));
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(ErrorLogin());
    });
  }
}
