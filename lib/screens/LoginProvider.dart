import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController mobileController = TextEditingController();

  void sendOtp() {
    final number = mobileController.text;
    if (number.length == 10) {
      print("OTP sent to $number");
      // API call yahan karein
    } else {
      print("Invalid number");
    }
  }

  void googleLogin() {
    print("Google login tapped");
    // Google SignIn logic
  }
}
