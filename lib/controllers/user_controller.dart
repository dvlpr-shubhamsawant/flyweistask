import 'package:ecommerce_seller/models/user_details_model.dart';
import 'package:ecommerce_seller/requests/auth_requests.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

class AppUser extends ChangeNotifier {
  static AppUser instance = AppUser.internal();
  AppUser.internal();
  factory AppUser() => instance;

  final authApis = AuthApis();

  UserDetailsModel? userDetails;

  String? _token;
  String? _uid;

  get name => userDetails!.data!.user!.userName;
  get email => userDetails!.data!.user!.email;
  get mobileNumber => userDetails!.data!.user!.mobileNumber;
  get wallet => userDetails!.data!.user!.wallet;

  String? get token => _token;
  bool get isLogin => _token != null;
  get uid => _uid;

  clear() async {
    final box = await Hive.openBox("token");
    box.clear();
  }

  set setToken(token) {
    _token = token;
  }

  set setUid(uid) {
    _uid = uid;
  }

  init() {
    fetchToken();
  }

  fetchToken() async {
    final box = await Hive.openBox("token");
    _token = box.get("token");
    _uid = box.get("uid");
    box.close();

    if (token != null) {
      userDetails = await AuthApis().getUserProfile();
    }
  }
}
