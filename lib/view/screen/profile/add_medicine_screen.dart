import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../constant/styles_const.dart';
import '../../../controller/profile_controller/profile_controller.dart';
import '../../components/buy_now_custom_btn.dart';

class AddMedicineScreen extends StatefulWidget {
  const AddMedicineScreen({super.key});

  @override
  State<AddMedicineScreen> createState() => _AddMedicineScreenState();
}

class _AddMedicineScreenState extends State<AddMedicineScreen> {
  final ProfileController controller = Get.put(ProfileController());
  TextEditingController productName = TextEditingController();
  TextEditingController productFormula = TextEditingController();
  TextEditingController productDetails = TextEditingController();
  TextEditingController productIngredient = TextEditingController();
  TextEditingController productDosage = TextEditingController();
  TextEditingController productPrecaution = TextEditingController();
  TextEditingController productSideEffects = TextEditingController();
  TextEditingController productUsage = TextEditingController();
  TextEditingController productPrice = TextEditingController();
  TextEditingController contactNo = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    productDetails;
    productDosage;
    productFormula;
    productIngredient;
    productName;
    productPrecaution;
    productSideEffects;
    productUsage;
    contactNo;
    productPrice;

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    productDetails.dispose();
    productDosage.dispose();
    productFormula.dispose();
    productIngredient.dispose();
    productName.dispose();
    productPrecaution.dispose();
    productSideEffects.dispose();
    productUsage.dispose();
    contactNo.dispose();
    productPrice.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Add product to pharmacy',
                    style: largePrimaryText,
                  ),
                ),
                Center(
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.orange,
                        radius: screenHeight * 0.06,
                        child: controller.medicineImageFile == null
                            ? const Icon(
                                Icons.local_pharmacy_outlined,
                                size: 30,
                              )
                            : Image.file(
                                controller.medicineImageFile!,
                                fit: BoxFit.cover, // Optional: fills the circle
                              ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: InkWell(
                          onTap: () {
                            Get.bottomSheet(
                              backgroundColor: Colors.orange,
                              SizedBox(
                                height: 200,
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Update Product Image',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () async {
                                              // Pick image from camera
                                              final pickedFile = await controller
                                                  .medicinePickImageFromSource(
                                                      ImageSource.camera);
                                              if (pickedFile != null) {
                                                controller.medicineImageFile =
                                                    pickedFile;
                                              }
                                              Get.back();
                                            },
                                            child: const Icon(Icons.camera),
                                          ),
                                          ElevatedButton(
                                            onPressed: () async {
                                              // Pick image from gallery
                                              final pickedFile = await controller
                                                  .medicinePickImageFromSource(
                                                      ImageSource.gallery);
                                              if (pickedFile != null) {
                                                controller.medicineImageFile =
                                                    pickedFile;
                                              }
                                              Get.back();
                                            },
                                            child: const Icon(
                                                Icons.photo_camera_back),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          child: CircleAvatar(
                            radius: screenHeight * 0.02,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.edit,
                              color: Colors.orange,
                              size: screenHeight * 0.02,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Product Name",
                  style: mediumPrimaryText,
                ),
                SizedBox(height: screenHeight * 0.01),
                TextField(
                  controller: productName,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          BorderSide(color: Colors.grey.withOpacity(0.5)),
                    ),
                    hintText: "Enter product name",
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  "Product Formula",
                  style: mediumPrimaryText,
                ),
                SizedBox(height: screenHeight * 0.01),
                TextField(
                  controller: productFormula,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          BorderSide(color: Colors.grey.withOpacity(0.5)),
                    ),
                    hintText: "Enter product formula",
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  "Product Details",
                  style: mediumPrimaryText,
                ),
                SizedBox(height: screenHeight * 0.01),
                TextField(
                  controller: productDetails,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          BorderSide(color: Colors.grey.withOpacity(0.5)),
                    ),
                    hintText: "Enter product Details",
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  "Product Ingredients",
                  style: mediumPrimaryText,
                ),
                SizedBox(height: screenHeight * 0.01),
                TextField(
                  controller: productIngredient,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          BorderSide(color: Colors.grey.withOpacity(0.5)),
                    ),
                    hintText: "Enter product ingredients",
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  "Product dosage",
                  style: mediumPrimaryText,
                ),
                SizedBox(height: screenHeight * 0.01),
                TextField(
                  controller: productDosage,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          BorderSide(color: Colors.grey.withOpacity(0.5)),
                    ),
                    hintText: "Enter product dosage",
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  "Product Precaution",
                  style: mediumPrimaryText,
                ),
                SizedBox(height: screenHeight * 0.01),
                TextField(
                  controller: productPrecaution,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          BorderSide(color: Colors.grey.withOpacity(0.5)),
                    ),
                    hintText: "Enter product precaution",
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  "Product Side Effects",
                  style: mediumPrimaryText,
                ),
                SizedBox(height: screenHeight * 0.01),
                TextField(
                  controller: productSideEffects,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          BorderSide(color: Colors.grey.withOpacity(0.5)),
                    ),
                    hintText: "Enter product side effects",
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  "Product Usage",
                  style: mediumPrimaryText,
                ),
                SizedBox(height: screenHeight * 0.01),
                TextField(
                  controller: productUsage,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          BorderSide(color: Colors.grey.withOpacity(0.5)),
                    ),
                    hintText: "Enter product usage",
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
                Text(
                  "Product Price",
                  style: mediumPrimaryText,
                ),
                TextField(
                  controller: productPrice,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          BorderSide(color: Colors.grey.withOpacity(0.5)),
                    ),
                    hintText: "Enter product Price",
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
                Text(
                  "Product contact no ",
                  style: mediumPrimaryText,
                ),
                SizedBox(height: screenHeight * 0.01),
                TextField(
                  controller: contactNo,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          BorderSide(color: Colors.grey.withOpacity(0.5)),
                    ),
                    hintText: "Enter product contact",
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
                Obx(() => controller.addMedicineIsLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(color: Colors.black),
                      )
                    : BuyNowCustomBtn(
                        myText: 'Upload Now',
                        onTap: () {
                          if (productDetails.text.isEmpty ||
                              productDosage.text.isEmpty ||
                              productFormula.text.isEmpty ||
                              productIngredient.text.isEmpty ||
                              productName.text.isEmpty ||
                              productPrecaution.text.isEmpty ||
                              productSideEffects.text.isEmpty ||
                              productUsage.text.isEmpty ||
                              contactNo.text.isEmpty ||
                              productPrice.text.isEmpty ||
                              controller.medicineImageFile == null) {
                            Get.snackbar(
                                'Failed', 'Please fill in the required fields',
                                backgroundColor: Colors.red.withOpacity(0.3));
                          } else {
                            controller.medicineRegistration(
                                productDetails.text.trim(),
                                productDosage.text.trim(),
                                productFormula.text.trim(),
                                productIngredient.text.trim(),
                                productName.text.trim(),
                                productPrecaution.text.trim(),
                                productSideEffects.text.trim(),
                                productUsage.text.trim(),
                                contactNo.text.trim(),
                                productPrice.text.trim(),
                                context);
                          }
                        },
                      ))
              ],
            ),
          ),
        ));
  }
}
