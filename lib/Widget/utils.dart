import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  void toastmessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        //      timeInSecForIosWeb: 1,
        backgroundColor: const Color.fromARGB(255, 196, 14, 1),
        textColor: const Color.fromARGB(255, 158, 20, 10),
        fontSize: 24.0);
  }
}
