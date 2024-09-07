import 'dart:io';

import 'package:ecommerce_seller/models/login_user_api_response.dart';
import 'package:ecommerce_seller/models/register_user_api_response.dart';
import 'package:ecommerce_seller/requests/auth_requests.dart';
import 'package:flutter/foundation.dart';

enum Status { success, failed }

class AuthController extends ChangeNotifier {
  bool isLoading = false;

  set loading(value) {
    isLoading = value;
    notifyListeners();
  }

  String email = "";

  AuthApis authApis = AuthApis();

  signIn({email, password}) async {
    loading = true;
    LoginUserApiResponse? res =
        await authApis.login(email: email, password: password);
    loading = false;
    return res == null ? Status.failed : Status.success;
  }

  verifyOtp(otp) async {
    return authApis.verifyOtp(otp);
  }

  resendOtp() {
    return authApis.resendOtp();
  }

  registerUser({name, email, password, mobile}) async {
    loading = true;
    RegisterUserApiResponse? response = await authApis.register(
        name: name, email: email, password: password, mobile: mobile);
    loading = false;
    return response == null ? Status.failed : Status.success;
  }

  uploadImage(File file) {
    authApis.uploadImage(file);
  }

  forgetPassword(email) {
    authApis.forgetPassword(email);
    email = email;
  }

  verifyForgetOtp(otp) {
    authApis.verifyForgetPasswordOtp(otp, email);
  }
}
