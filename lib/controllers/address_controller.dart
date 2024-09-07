import 'package:ecommerce_seller/models/address.dart';
import 'package:ecommerce_seller/requests/address_requests.dart';
import 'package:flutter/material.dart';

class AddresssController extends ChangeNotifier {
  static AddresssController instance = AddresssController.internal();
  AddresssController.internal();
  factory AddresssController() => instance;

  AddressApis apis = AddressApis();

  List<Address> addresses = [];

  init() {
    getAddresses();
  }

  getAddresses() async {
    addresses = await apis.getAddresses();
    print(addresses.length);
    notifyListeners();
  }

  createAddress(
      {name, phone, add1, add2, city, state, country, pincode}) async {
    await apis.addAddress(
        name: name,
        phone: phone,
        add1: add1,
        add2: add2,
        city: city,
        state: state,
        country: country,
        pincode: pincode);
    getAddresses();
  }

  updateAddress({id, name, phone, add1, add2, city, state, country, pincode}) {
    apis.updateAddress(
        id: id,
        name: name,
        phone: phone,
        add1: add1,
        add2: add2,
        city: city,
        state: state,
        country: country,
        pincode: pincode);
  }

  deleteAddress(Address address) {
    addresses.remove(address);
    notifyListeners();
    apis.deleteAddress(address);
  }
}
