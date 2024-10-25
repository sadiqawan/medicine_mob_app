import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicine_app/constant/styles_const.dart';
import 'package:medicine_app/view/screen/auth/registration/sign_up_screen.dart';
import 'package:medicine_app/view/screen/customer/customer_main_home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
                decoration: BoxDecoration(
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
                    Text(
                      "Login",
                      style: extraLargePrimaryText,
                    ),
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
                      controller: _emailController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                        ),
                        hintText: "Enter your email",
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Text(
                      "Password",
                      style: mediumPrimaryText,
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                        ),
                        hintText: "Enter your password",
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    ElevatedButton(
                      onPressed: () {
                        String email = _emailController.text;
                        String password = _passwordController.text;
                                              Get.to(()=>CustomerMainHomeScreen());

                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffEE6315),
                        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Login",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Get.to(() => SignUpScreen());
                        },
                        child: Text(
                          "Don't have an account? Sign Up",
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
