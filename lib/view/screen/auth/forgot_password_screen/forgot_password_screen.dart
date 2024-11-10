import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicine_app/constant/styles_const.dart';
import 'package:medicine_app/controller/auth_controller/login_contorller.dart';
import 'package:medicine_app/view/screen/auth/login/login_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: screenHeight * 0.4,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xff1D2A4D),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                  ),
                ),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/medical-icon_i-health-services.png",
                      height: screenHeight * 0.1,
                      width: screenWidth * 0.2,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email",
                      style: mediumPrimaryText,
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    TextField(
                      controller: loginController.forgetController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              BorderSide(color: Colors.grey.withOpacity(0.5)),
                        ),
                        hintText: "Enter your email",
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    SizedBox(height: screenHeight * 0.03),
                    Obx(
                      () => loginController.isLoading.value
                          ? const Center(
                              child: CircularProgressIndicator(
                              color: Colors.black,
                            ))
                          : ElevatedButton(
                              onPressed: () {
                                loginController.sendPasswordResetEmail();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xffEE6315),
                                padding: EdgeInsets.symmetric(
                                    vertical: screenHeight * 0.02),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  "Submit",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                              ),
                            ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Get.offAll(() => const LoginScreen());
                        },
                        child: const Text(
                          "Back to Login",
                          style: TextStyle(color: Color(0xff1D2A4D)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
