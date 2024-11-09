import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicine_app/constant/styles_const.dart';
import 'package:medicine_app/controller/auth_controller/sign_up_controller.dart';
import 'package:medicine_app/view/screen/auth/login/login_screen.dart';
import 'package:medicine_app/view/screen/customer/customer_main_home_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpController signUpController = Get.put(SignUpController());
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // final SignUpController _controller = Get.put(SignUpController());

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
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
                children: [
                  Image.asset(
                    "assets/images/medical-icon_i-health-services.png",
                    height: screenHeight * 0.1,
                    width: screenWidth * 0.2,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    "Sign Up",
                    style: extraLargePrimaryText,
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Sign up as:", style: mediumPrimaryText),
                  SizedBox(height: screenHeight * 0.02),
                  /* Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Obx(() => ChoiceChip(
                        label: const Text("Customer"),
                        selected: _controller.userType.value == 'Customer',
                        onSelected: (selected) {
                          if (selected) {
                            _controller.setUserType('Customer');
                          }
                        },
                      )),
                      Obx(() => ChoiceChip(
                        label: const Text("Seller"),
                        selected: _controller.userType.value == 'Seller',
                        onSelected: (selected) {
                          if (selected) {
                            _controller.setUserType('Seller');
                          }
                        },
                      )),
                    ],
                  ),*/
                  // SizedBox(height: screenHeight * 0.03),
                  Text("Name", style: mediumPrimaryText),
                  // SizedBox(height: screenHeight * 0.01),
                  TextField(
                    controller: _name,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            BorderSide(color: Colors.grey.withOpacity(0.5)),
                      ),
                      hintText: "Enter your name",
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Text("Email", style: mediumPrimaryText),
                  SizedBox(height: screenHeight * 0.01),
                  TextField(
                    controller: _emailController,
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
                  Text("Password", style: mediumPrimaryText),
                  SizedBox(height: screenHeight * 0.01),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            BorderSide(color: Colors.grey.withOpacity(0.5)),
                      ),
                      hintText: "Enter your password",
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                 Obx(()=>  signUpController.isLoading.value
                     ? const Center(
                     child: CircularProgressIndicator(
                       color: Colors.black,
                     ))
                     :   ElevatedButton(
                   onPressed: () {
                     if (signUpController.isValidInputs(
                         _name, _emailController, _passwordController)) {
                       signUpController.signup(
                           _emailController, _passwordController, _name);
                     }
                     /*
                      signUpController.signup(
                          _emailController, _passwordController, _name);*/
                     /*  String email = _emailController.text;
                      String password = _passwordController.text;
                      String userType = _controller.userType.value;*/
                     // Get.to(() => const CustomerMainHomeScreen());
                   },
                   style: ElevatedButton.styleFrom(
                     backgroundColor: const Color(0xffEE6315),
                     padding:
                     EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(100),
                     ),
                   ),
                   child: const Center(
                     child: Text("Sign Up",
                         style: TextStyle(fontSize: 18, color: Colors.white)),
                   ),
                 ),),

                  SizedBox(height: screenHeight * 0.02),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Already have an account? Login",
                        style: TextStyle(color: Color(0xff1D2A4D)),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  // Additional space at the bottom
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
