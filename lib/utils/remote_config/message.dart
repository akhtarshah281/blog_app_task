import 'package:fluttertoast/fluttertoast.dart';

import '../app_colors.dart';


class Message {
  static void success(String message) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 4,
      backgroundColor: AppColors.GREEN,
      textColor: AppColors.WHITE,
    );
  }

  static void error(String message) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 4,
      backgroundColor: AppColors.RED,
      textColor: AppColors.WHITE,
    );
  }
}
