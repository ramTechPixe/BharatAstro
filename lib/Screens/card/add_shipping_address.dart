import 'package:flutter/services.dart';
import 'package:bharatastro/untils/export_file.dart';

class ShippingAddress extends StatefulWidget {
  const ShippingAddress({super.key});

  @override
  State<ShippingAddress> createState() => _ShippingAddressState();
}

class _ShippingAddressState extends State<ShippingAddress> {
  DashboardController dashController = Get.put(DashboardController());
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    setState(() {
      dashController.shipFirstname.text = "ram";

      dashController.shipLastName.text = "nayak";
      dashController.shipAddessController.text = "11-121";
      dashController.shipCityController.text = "Hyderabad";

      dashController.shipPincodeController.text = "500072";

      //,
      dashController.shipCountryController.text = "India";

      dashController.shipStateController.text = "Telangana";

      dashController.shipEmailController.text = "sugaliramanayak777@gmail.com";

      dashController.shipMobileController.text = "6281682528";
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: KbluethemeThick,
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Kwhite,
              size: 22.sp,
            ),
          ),
          title: Text(
            "Add Shipping Address ",
            style: GoogleFonts.dmSerifDisplay(
                color: Kwhite, fontSize: kTwentyFont, fontWeight: kFW400),
          )),
      backgroundColor: Kbg_theme_two,
      body: SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.only(
                top: 16.h, left: 16.w, right: 16.w, bottom: 16.h),
            child: Obx(
              () => dashController.userCreateOrderLoading == true ||
                      dashController.savepaymentLoading == true

                  //  matchingController.astroDataLoading == true
                  ? Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 250.h,
                          ),
                          CircularProgressIndicator(
                            color: Kform_border_twg,
                          ),
                        ],
                      ),
                    )
                  : Form(
                      key: _formKey,
                      // autovalidateMode: AutovalidateMode.always,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Enter your Details",
                              style: GoogleFonts.poppins(
                                  fontSize: kEighteenFont,
                                  fontWeight: kFW400,
                                  color: KdarkText)),
                          SizedBox(
                            height: 25.h,
                          ),
                          CustomFormFields(
                            ontap: () {
                              //  Get.toNamed(kSearchPlaces); // kForgotPassword
                            },
                            controller: dashController.shipEmailController,
                            enabled: true,
                            labelColor: KText,
                            obscureText: false,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 8),
                            fontSize: kFourteenFont,
                            fontWeight: FontWeight.w500,
                            hintText: "Enter Email",
                            maxLines: 1,
                            label: "Email",
                            readOnly: false,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter email';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          CustomFormFields(
                            ontap: () {
                              //  Get.toNamed(kSearchPlaces); // kForgotPassword
                            },
                            controller: dashController.shipMobileController,
                            //   controller: authcontroller.regrEmailSignInController,
                            enabled: true,
                            keyboardType: TextInputType.phone,
                            labelColor: KText,
                            obscureText: false,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 8),
                            fontSize: kFourteenFont,
                            fontWeight: FontWeight.w500,
                            hintText: "enter number",
                            maxLines: 1,
                            readOnly: false,
                            label: "Mobile number",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter number';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          CustomFormFields(
                            ontap: () {
                              //  Get.toNamed(kSearchPlaces); // kForgotPassword
                            },
                            controller: dashController.shipFirstname,
                            //   controller: authcontroller.regrEmailSignInController,
                            enabled: true,

                            labelColor: KText,
                            obscureText: false,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 8),
                            fontSize: kFourteenFont,
                            fontWeight: FontWeight.w500,
                            hintText: "first name",
                            maxLines: 1,
                            readOnly: false,
                            label: "First name",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter first name';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          CustomFormFields(
                            ontap: () {
                              //  Get.toNamed(kSearchPlaces); // kForgotPassword
                            },
                            controller: dashController.shipLastName,
                            //   controller: authcontroller.regrEmailSignInController,
                            enabled: true,

                            labelColor: KText,
                            obscureText: false,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 8),
                            fontSize: kFourteenFont,
                            fontWeight: FontWeight.w500,
                            hintText: "last name",
                            maxLines: 1,
                            readOnly: false,
                            label: "Last name",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter last name';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          CustomFormFields(
                            ontap: () {},
                            enabled: true,
                            controller: dashController.shipAddessController,
                            labelColor: KText,
                            obscureText: false,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 8),
                            fontSize: kFourteenFont,
                            fontWeight: FontWeight.w500,
                            hintText: "enter address",
                            maxLines: 1,
                            readOnly: false,
                            label: "Address",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter address';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          CustomFormFields(
                            ontap: () {},
                            enabled: true,
                            controller: dashController.shipAddess2Controller,
                            labelColor: KText,
                            obscureText: false,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 8),
                            fontSize: kFourteenFont,
                            fontWeight: FontWeight.w500,
                            hintText: "enter address ",
                            maxLines: 1,
                            readOnly: false,
                            label: "Address",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter address';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          CustomFormFields(
                            ontap: () {},
                            enabled: true,
                            controller: dashController.shipPincodeController,
                            keyboardType: TextInputType.numberWithOptions(),
                            labelColor: KText,
                            obscureText: false,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 8),
                            fontSize: kFourteenFont,
                            fontWeight: FontWeight.w500,
                            hintText: "enter pincode",
                            maxLines: 1,
                            readOnly: false,
                            label: "Pin Code",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter pin code';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          CustomFormFields(
                            ontap: () {},
                            enabled: true,
                            controller: dashController.shipCityController,
                            labelColor: KText,
                            obscureText: false,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 8),
                            fontSize: kFourteenFont,
                            fontWeight: FontWeight.w500,
                            hintText: "enter City",
                            maxLines: 1,
                            readOnly: false,
                            label: "City",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter city';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          CustomFormFields(
                            ontap: () {},
                            enabled: true,
                            controller: dashController.shipStateController,
                            labelColor: KText,
                            obscureText: false,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 8),
                            fontSize: kFourteenFont,
                            fontWeight: FontWeight.w500,
                            hintText: "enter state",
                            maxLines: 1,
                            readOnly: false,
                            label: "State",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter state';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          CustomFormFields(
                            ontap: () {},
                            controller: dashController.shipCountryController,
                            enabled: true,
                            labelColor: KText,
                            obscureText: false,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 8),
                            fontSize: kFourteenFont,
                            fontWeight: FontWeight.w500,
                            hintText: "enter country",
                            maxLines: 1,
                            readOnly: false,
                            label: "Country",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter country';
                              }
                              return null;
                            },
                          ),
                          Obx(
                            () => dashController.userCreateOrderLoading == true
                                ? Center(
                                    child: CircularProgressIndicator(
                                      color: Kform_border_twg,
                                    ),
                                  )
                                : CustomButton(
                                    margin: EdgeInsets.only(top: 36.h),
                                    borderRadius: BorderRadius.circular(8.r),
                                    Color: Kform_border_twg,
                                    textColor: Kwhite,
                                    height: 40,
                                    width: double.infinity,
                                    label: "Submit",
                                    fontSize: kSixteenFont,
                                    fontWeight: kFW700,
                                    isLoading: false,
                                    onTap: () {
                                      var payload = {
                                        // "shipping_email": "durgaprasadtechpixe@gmail.com",
                                        // "shipping_customer_name": "Durga Prasad",
                                        // "shipping_last_name": "Sunkara",
                                        // "shipping_phone": "7993916648",
                                        // "shipping_pincode": "534350",
                                        // "shipping_address": "14-161",
                                        // "shipping_city": "Kovvuru",
                                        // "shipping_state": "Telangana",
                                        // "shipping_country": "India"
                                        //update
                                        "shipping_customer_name": dashController
                                            .shipFirstname.text
                                            .trim(),
                                        "shipping_last_name": dashController
                                            .shipLastName.text
                                            .trim(),
                                        "shipping_address": dashController
                                            .shipAddessController.text
                                            .trim(),
                                        "shipping_address_2": dashController
                                            .shipAddess2Controller.text
                                            .trim(),
                                        "shipping_city": dashController
                                            .shipCityController.text
                                            .trim(),
                                        "shipping_pincode": int.parse(
                                            dashController
                                                .shipPincodeController.text
                                                .trim()),

                                        //500072,
                                        "shipping_country": dashController
                                            .shipCountryController.text
                                            .trim(),
                                        "shipping_state": dashController
                                            .shipStateController.text
                                            .trim(),
                                        "shipping_email": dashController
                                            .shipEmailController.text
                                            .trim(),
                                        "shipping_phone": dashController
                                            .shipMobileController.text
                                            .trim(),
                                        //
                                        // "shipping_email":
                                        //                             dashController.shipEmailController.text.trim(),
                                        //                         //"durgaprasadtechpixe@gmail.com",
                                        //                         "shipping_customer_name":
                                        //                             dashController.shipFirstname.text.trim(),
                                        //                         //"Durga Prasad",
                                        //                         "shipping_last_name":
                                        //                             dashController.shipLastName.text.trim(),
                                        //                         // "Sunkara",
                                        //                         "shipping_phone":
                                        //                             dashController.shipMobileController.text.trim(),
                                        //                         //"7993916648",
                                        //                         "shipping_pincode": dashController
                                        //                             .shipPincodeController.text
                                        //                             .trim(),
                                        //                         //"534350",
                                        //                         "shipping_address":
                                        //                             dashController.shipAddessController.text.trim(),
                                        //                         // "14-161",
                                        //                         "shipping_city":
                                        //                             dashController.shipCityController.text.trim(),
                                        //                         //"Kovvuru",
                                        //                         "shipping_state":
                                        //                             dashController.shipStateController.text.trim(),
                                        //                         //"Telangana",
                                        //                         "shipping_country":
                                        //                             dashController.shipCountryController.text.trim()
                                        //                         // "India"
                                      };

                                      // "shipping_email":
                                      //     dashController.shipEmailController.text,
                                      // "shipping_customer_name":
                                      //     dashController.shipFirstname.text,
                                      // "shipping_last_name":
                                      //     dashController.shipLastName.text,
                                      // "shipping_phone":
                                      //     dashController.shipMobileController.text,
                                      // "shipping_pincode":
                                      //     dashController.shipPincodeController.text,
                                      // "shipping_address":
                                      //     dashController.shipAddessController.text,
                                      // "shipping_city":
                                      //     dashController.shipCityController.text,
                                      // "shipping_state":
                                      //     dashController.shipStateController.text,
                                      // "shipping_country":
                                      //     dashController.shipCountryController.text

                                      // if (_formKey.currentState!.validate()) {
                                      //   authcontroller.userSignIn(payload);
                                      // }
                                      if (_formKey.currentState!.validate()) {
                                        dashController.useCreateOrders(payload);
                                      }
                                      // if (_formKey.currentState!.validate()) {
                                      //   authcontroller.userSignIn(payload);
                                      // }
                                      // Get.toNamed(kNavigation);
                                    }),
                          ),
                          // CustomButton(
                          //     margin: EdgeInsets.only(top: 36.h),
                          //     borderRadius: BorderRadius.circular(8.r),
                          //     Color: Kform_border_twg,
                          //     textColor: Kwhite,
                          //     height: 40,
                          //     width: double.infinity,
                          //     label: "Save and deliver here",
                          //     fontSize: kSixteenFont,
                          //     fontWeight: kFW700,
                          //     isLoading: false,
                          //     onTap: () {
                          //       Get.toNamed(kAddUser);
                          //     }),
                        ],
                      ),
                    ),
            )),
      ),
    );
  }
}
