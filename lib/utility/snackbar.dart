import 'package:ecommerce_seller/main.dart';
import 'package:flutter/material.dart';

displaySnackbar({message, color = Colors.green}) {
  ScaffoldMessenger.of(appContext).showSnackBar(
    SnackBar(
        content: Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: color),
  );
}
