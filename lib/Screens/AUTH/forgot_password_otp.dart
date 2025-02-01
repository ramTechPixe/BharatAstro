import 'package:flutter/services.dart';
import 'package:bharatastro/untils/export_file.dart';

class ForgotPasswordOTP extends StatefulWidget {
  const ForgotPasswordOTP({super.key});

  @override
  State<ForgotPasswordOTP> createState() => _ForgotPasswordOTPState();
}

class _ForgotPasswordOTPState extends State<ForgotPasswordOTP> {
  AuthController authcontroller = Get.put(AuthController());
  final _formKey = GlobalKey<FormState>();
  String? selectedOption;
  bool passwordVisible = true;
  bool confirmpasswordVisible = true;

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              'Are you sure?',
              style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            content: Text(
              'Do you want to exit this App',
              style: GoogleFonts.roboto(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(
                  'No',
                  style: GoogleFonts.roboto(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
              TextButton(
                onPressed: () => SystemNavigator.pop(),
                child: Text(
                  'Yes',
                  style: GoogleFonts.roboto(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Kform_border_twg),
                ),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  void initState() {
    // setState(() {
    //   authcontroller.UserEmailSignInController.text = "androidtest@gmail.com";

    //   authcontroller.UserEmailPasswordController.text = "Bstore@123";
    // });

    super.initState();
  }

  /////
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            //  height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(
                top: 16.h,
                //top: MediaQuery.of(context).size.height / 4,
                left: 16.w,
                right: 16.w,
                bottom: 16.w),

            // height: MediaQuery.of(context).size.height,
            // width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage(
                    "assets/images/astro_bg.png",
                  ),
                  fit: BoxFit.fill,
                ),
                color: Kwhite),
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  // autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 3.5,
                      ),
                      Text("Email OTP",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          style: GoogleFonts.dmSerifDisplay(
                              fontSize: 21.sp,
                              fontWeight: kFW400,
                              color: Kbluetheme)),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text("Please enter OTP and reset password",
                          maxLines: 3,
                          textAlign: TextAlign.start,
                          style: GoogleFonts.poppins(
                              fontSize: 13.sp,
                              fontWeight: kFW400,
                              color: KdarkText)),
                      SizedBox(
                        height: 25.h,
                      ),
                      CustomFormFields(
                        ontap: () {
                          //  Get.toNamed(kSearchPlaces); // kForgotPassword
                        },
                        controller: authcontroller.UserEmailSignInController,
                        enabled: true,
                        labelColor: KText,
                        obscureText: false,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 8),
                        fontSize: kFourteenFont,
                        fontWeight: FontWeight.w500,
                        hintText: "Email",
                        maxLines: 1,
                        readOnly: false,
                        label: "Email",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter Email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      CustomFormFields(
                        ontap: () {
                          //  Get.toNamed(kSearchPlaces); // kForgotPassword
                        },
                        controller: authcontroller.fpaswdNewPasswordController,
                        enabled: true,
                        labelColor: KText,
                        obscureText: false,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 8),
                        fontSize: kFourteenFont,
                        fontWeight: FontWeight.w500,
                        hintText: "Enter new password",
                        maxLines: 1,
                        readOnly: false,
                        label: "New Password",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter new password';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      CustomFormFields(
                        ontap: () {
                          //  Get.toNamed(kSearchPlaces); // kForgotPassword
                        },
                        controller: authcontroller.fpaswdOTPController,
                        enabled: true,
                        labelColor: KText,
                        obscureText: false,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 8),
                        fontSize: kFourteenFont,
                        fontWeight: FontWeight.w500,
                        hintText: "Enter otp",
                        maxLines: 1,
                        readOnly: false,
                        label: "OTP",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter OTP';
                          }
                          return null;
                        },
                      ),
                      Obx(
                        () => authcontroller.userfpasswordotpInLoading == true
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: Kform_border_twg,
                                ),
                              )
                            : CustomButton(
                                margin:
                                    EdgeInsets.only(top: 110.h, bottom: 50.h),
                                borderRadius: BorderRadius.circular(8.r),
                                Color: Kform_border_twg,
                                textColor: Kwhite,
                                height: 40,
                                width: double.infinity,
                                label: "Send reset Link",
                                fontSize: kSixteenFont,
                                fontWeight: kFW700,
                                isLoading: false,
                                onTap: () {
                                  var payload = {
                                    "user_email": authcontroller
                                        .UserEmailSignInController.text,
                                    "newPassword": authcontroller
                                        .fpaswdNewPasswordController.text,
                                    "otp":
                                        authcontroller.fpaswdOTPController.text,
                                  };

                                  // if (_formKey.currentState!.validate()) {
                                  //   authcontroller.userSignIn(payload);
                                  // }
                                  if (_formKey.currentState!.validate()) {
                                    authcontroller
                                        .userForgotpasswordotp(payload);
                                  }
                                  // Get.toNamed(kNavigation);
                                }),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
