import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:path/path.dart';
import 'package:ecommerce_seller/consts/endpoints.dart';
import 'package:ecommerce_seller/controllers/auth_controller.dart';
import 'package:ecommerce_seller/controllers/user_controller.dart';
import 'package:ecommerce_seller/main.dart';
import 'package:ecommerce_seller/models/login_user_api_response.dart';
import 'package:ecommerce_seller/models/register_user_api_response.dart';
import 'package:ecommerce_seller/models/user_details_model.dart';

import 'package:ecommerce_seller/services/local_notification.dart';
import 'package:ecommerce_seller/utility/snackbar.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:hive/hive.dart';

// static String baseUrl = "https://sanjay-tiwari-backend.vercel.app";

// static String getUserProfile = "/api/user/profile";
// static String getUserProfileById = "/api/user/users/6687dbbc452b9ba48d9f7795";
// static String updateProfile = "/api/user/update";
// static String uploadProfilePicture = "/api/user/upload-profile-picture";
// static String deleteUser = "/api/user/users/65166718a9d6ed4607f5336a";
// static String uploadId = "api/user/upload-id-picture";
// static String addShopDetails = "api/user/update-documents";
// static String updateBankDetails = "api/user/updateBankDetails";

class AuthApis {
  storeDataInHive(data) async {
    final box = await Hive.openBox("user");
    box.put("details", data);
    box.close();
  }

  storeToken(token) async {
    final box = await Hive.openBox("token");
    box.put("token", token);
    AppUser().setToken = token;
  }

  storeUserid(uid) async {
    print(uid);
    final box = await Hive.openBox("token");
    box.put("userid", uid);
    AppUser().setUid = uid;
  }

  Future<RegisterUserApiResponse?> register(
      {name, email, mobile, password}) async {
    var data = {
      "userName": name,
      "email": email,
      "mobileNumber": mobile,
      "password": password
    };
    var header = {"Content-Type": "application/json"};
    Uri url =
        Uri.parse("https://sanjay-tiwari-backend.vercel.app/api/user/register");

    try {
      http.Response response =
          await http.post(url, headers: header, body: jsonEncode(data));
      var res = jsonDecode(response.body);
      logger.d(res);
      if (response.statusCode == 201) {
        storeUserid(res['data']['_id']);
        displaySnackbar(message: res['message']);
        LocalNotificationService().showNotification(
            id: 0, title: "", body: "Your OTP is ${res['data']['otp']}");
        return RegisterUserApiResponse.fromJson(res);
      }
      displaySnackbar(message: res['message'], color: Colors.red);
    } catch (e) {
      logger.e(e);
    }

    return null;
  }

  login({email, password}) async {
    Uri url = Uri.parse(Endpoints.baseUrl + Endpoints.login);
    try {
      var header = {"Content-Type": "application/json"};
      var data = {"email": email, "password": password};
      http.Response response =
          await http.post(url, body: jsonEncode(data), headers: header);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        logger.d(data);
        storeToken(data['token']);
        storeUserid(data['data']['_id']);
        LocalNotificationService().showNotification(
            id: 0, title: "", body: "Your OTP is ${data['data']['otp']}");
        return LoginUserApiResponse.fromJson(data);
      }

      displaySnackbar(message: "Invalid Credentials", color: Colors.red);
    } catch (e) {
      logger.e(e);
    }
    return null;
  }

  verifyOtp(otp) async {
    Uri url =
        Uri.parse(Endpoints.baseUrl + Endpoints.verifyOtp + AppUser().uid);
    var header = {"Content-Type": "application/json"};
    var data = {"otp": otp};

    try {
      http.Response response =
          await http.post(url, headers: header, body: jsonEncode(data));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        logger.d(data);
        displaySnackbar(message: data['message']);
        storeToken(data['token']);
        return Status.success;
      }
    } catch (e) {
      logger.e(e);
    }
    return Status.failed;
  }

  resendOtp() async {
    print(AppUser().uid);
    Uri url = Uri.parse(
        "https://sanjay-tiwari-backend.vercel.app/api/user/resend/" +
            AppUser().uid);

    try {
      http.Response response = await http.post(url);
      logger.d(jsonDecode(response.body));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        logger.d(data);
        LocalNotificationService().showNotification(
            id: 0, title: "", body: "Your OTP is ${data['data']}");
        return Status.success;
      }
    } catch (e) {
      logger.e(e);
    }
    return Status.failed;
  }

  forgetPassword(email) async {
    Uri url = Uri.parse(
        "https://sanjay-tiwari-backend.vercel.app/api/user/forgetPassword");
    var body = {"email": email};
    var header = {"Content-Type": "application/json"};

    try {
      http.Response response =
          await http.post(url, headers: header, body: jsonEncode(body));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        logger.d(data);

        LocalNotificationService().showNotification(
            id: 0, title: "", body: "Your OTP is ${data['data']['otp']}");
      }
    } catch (e) {
      logger.e(e);
    }
  }

  getUserProfile() async {
    log("Fetching profile details");
    Uri url =
        Uri.parse("https://sanjay-tiwari-backend.vercel.app/api/user/profile");

    var headers = {'Authorization': 'Bearer ${AppUser().token}'};

    try {
      http.Response response = await http.get(url, headers: headers);

      logger.d(
        jsonDecode(
          response.body,
        ),
      );
      return UserDetailsModel.fromJson(jsonDecode(response.body));
    } catch (e) {
      logger.e(e);
    }
  }

  verifyForgetPasswordOtp(otp, email) async {
    Uri url = Uri.parse(
        "https://sanjay-tiwari-backend.vercel.app/api/user/forgotVerifyotp");
    var body = {"email": email, "otp": otp};
    var header = {"Content-Type": "application/json"};

    try {
      http.Response response =
          await http.post(url, headers: header, body: jsonEncode(body));
      var data = jsonDecode(response.body);

      logger.d(data);
      displaySnackbar(message: data['message']);
    } catch (e) {
      logger.e(e);
    }
  }

  Future<void> uploadImage(File imageFile) async {
    var url = Uri.parse(
        "https://sanjay-tiwari-backend.vercel.app/api/user/upload-id-picture");

    // Create the request
    var request = http.MultipartRequest('PUT', url);

    // Add the bearer token in the headers
    request.headers['Authorization'] = 'Bearer ${AppUser().token}';

    // Add the image file as multipart form data
    var stream = http.ByteStream(imageFile.openRead());
    var length = await imageFile.length();

    var multipartFile = http.MultipartFile(
      'image', // key for form data
      stream,
      length,
      filename: basename(imageFile.path),
    );

    request.files.add(multipartFile);

    // Send the request
    var response = await request.send();

    // Check the response status
    if (response.statusCode == 200) {
      displaySnackbar(message: "Image Uploaded Successfully");
    } else {
      displaySnackbar(message: "Failed to upload image:");
    }
  }
}
