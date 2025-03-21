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
  //
  String? passwordError;

  ////Password Error
  bool ispasswordcorrect = false;
  bool isbothpasswordscorrect = false;

  ///
  ///////validate password
  String? validatePassword(String password) {
    String pattern =
        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';
    RegExp regExp = RegExp(pattern);

    if (password.isEmpty) {
      setState(() {
        ispasswordcorrect = false;
      });
      return 'Password cannot be empty';
    } else if (!regExp.hasMatch(password)) {
      setState(() {
        ispasswordcorrect = false;
      });
      return 'Password must be at least 8 characters long,\ncontain uppercase, lowercase,\ndigit, and special character.';
    }
    setState(() {
      ispasswordcorrect = true;
    });
    return null;
  }

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
    return Scaffold(
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
                    Text(
                      "Password",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                          fontSize: kSixteenFont,
                          //  letterSpacing: 1,
                          color: KBlack_twg,
                          fontWeight: kFW400),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Kbg_theme,
                      ),
                      child: TextFormField(
                        cursorColor: Kform_border_twg,
                        obscureText: passwordVisible,
                        obscuringCharacter: '*',
                        enabled: true,
                        readOnly: false,
                        controller: authcontroller.fpaswdNewPasswordController,
                        //  controller: authcontroller.regrEmailPasswordController,
                        //   controller: dashController.changeNewPasswordController,
                        style: GoogleFonts.poppins(
                            fontSize: 14.sp, fontWeight: kFW500, color: kblack),
                        decoration: InputDecoration(
                          focusColor: Kbg_theme,
                          filled: true,
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 8),

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: KText_border_twg, width: 0.5),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: KRed_twg, width: 0.5),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: KText_border_twg, width: 0.5),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Kform_border_twg, width: 1),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Kform_border_twg, width: 1),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          fillColor: Kbg_theme,

                          hintText: "Enter Password",
                          alignLabelWithHint: true,
                          suffixIcon: IconButton(
                            icon: Icon(
                              passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              size: 20.sp,
                            ),
                            onPressed: () {
                              setState(
                                () {
                                  passwordVisible = !passwordVisible;
                                },
                              );
                            },
                          ),
                          //make hint text
                          hintStyle: GoogleFonts.poppins(
                            color: KLighText_twg,
                            fontSize: 14.sp,
                            fontWeight: kFW400,
                          ),
                          //////////////////

                          ////////////

                          //create lable
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter Password';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            passwordError = validatePassword(value);
                          });
                          setState(() {});
                        },
                        //onChanged: (value) {},
                      ),
                    ),
                    if (passwordError != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          passwordError!,
                          style: TextStyle(color: KRed_twg, fontSize: 12.sp),
                        ),
                      ),
                    // CustomFormFields(
                    //   ontap: () {
                    //     //  Get.toNamed(kSearchPlaces); // kForgotPassword
                    //   },
                    //   controller: authcontroller.fpaswdNewPasswordController,
                    //   enabled: true,
                    //   labelColor: KText,
                    //   obscureText: false,
                    //   contentPadding: const EdgeInsets.symmetric(
                    //       vertical: 16, horizontal: 8),
                    //   fontSize: kFourteenFont,
                    //   fontWeight: FontWeight.w500,
                    //   hintText: "Enter new password",
                    //   maxLines: 1,
                    //   readOnly: false,
                    //   label: "New Password",
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return 'Please enter new password';
                    //     }
                    //     return null;
                    //   },
                    // ),
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
                              margin: EdgeInsets.only(top: 110.h, bottom: 50.h),
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

                                if (_formKey.currentState!.validate()) {
                                  if (
                                      //isbothpasswordscorrect == true &&
                                      ispasswordcorrect == true) {
                                    authcontroller
                                        .userForgotpasswordotp(payload);
                                  } else {
                                    Fluttertoast.showToast(
                                      msg: "Please enter Password correctly",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: KDarkPink_twg,
                                      textColor: Kwhite,
                                      fontSize: 16.0,
                                    );
                                  }

                                  // if (_formKey.currentState!.validate()) {
                                  //   authcontroller.userForgotpasswordotp(payload);
                                  // }
                                }
                              }),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
