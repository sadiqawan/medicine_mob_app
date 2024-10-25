import 'package:get/get.dart';

class SignUpController extends GetxController {
  var userType = 'Customer'.obs; // Observable variable for user type

  void setUserType(String type) {
    userType.value = type;
  }
}
