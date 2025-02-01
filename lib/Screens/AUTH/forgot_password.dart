import 'package:flutter/services.dart';
import 'package:bharatastro/untils/export_file.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
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
                    Text("Lost Your Cosmic Key",
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
                    Text(
                        "Don’t worry, the stars will help you recover it. Enter your registered email to reset your password and realign your journey.",
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
                    Obx(
                      () => authcontroller.userfpasswordInLoading == true
                          ? Center(
                              child: CircularProgressIndicator(
                                color: Kform_border_twg,
                              ),
                            )
                          : CustomButton(
                              margin: EdgeInsets.only(top: 150.h),
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
                                };

                                // if (_formKey.currentState!.validate()) {
                                //   authcontroller.userSignIn(payload);
                                // }
                                if (_formKey.currentState!.validate()) {
                                  authcontroller.userForgotpassword(payload);
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
    );
  }
}
