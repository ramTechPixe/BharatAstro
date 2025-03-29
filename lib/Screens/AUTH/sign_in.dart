import 'package:flutter/services.dart';
import 'package:bharatastro/untils/export_file.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
    setState(() {
      authcontroller.UserEmailSignInController.text = "somu123@gmail.com";
      // "sugaliramanayak7777@gmail.com";
      authcontroller.UserEmailPasswordController.text = "Somu1234@";
      // "SRN@ram12345";
      // authcontroller.UserEmailSignInController.text = "ram123@gmail.com";
      // authcontroller.UserEmailPasswordController.text = "ram1234";
      // "ramNayak123@";

//email:sugaliramanayak777@gmail.com
//password:SRN_ram1234
      // authcontroller.UserEmailSignInController.text =
      //     "sugaliramanayak77775@gmail.com";

      // authcontroller.UserEmailPasswordController.text = "ramNayak123@";
    });

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
                      Text("Welcome to Bharat Astro Card",
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
                          "Unlock the stars and align your journey. Let the universe guide you!",
                          maxLines: 2,
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
                        height: 15.h,
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
                          controller:
                              authcontroller.UserEmailPasswordController,
                          style: GoogleFonts.poppins(
                              fontSize: 14.sp,
                              fontWeight: kFW500,
                              color: kblack),
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
                              borderSide: BorderSide(
                                  color: KText_border_twg, width: 0.5),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: KRed_twg, width: 0.5),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: KText_border_twg, width: 0.5),
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
                          onChanged: (value) {},
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            Get.toNamed(kForgotPassword);
                          },
                          child: Text(
                            "Forgot password?",
                            textAlign: TextAlign.end,
                            style: GoogleFonts.poppins(
                                fontSize: kTwelveFont,
                                //  letterSpacing: 1,
                                color: Kform_border_twg,
                                fontWeight: kFW400),
                          ),
                        ),
                      ),

                      //////////////
                      Obx(
                        () => authcontroller.userSignInLoading == true
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
                                label: "Sign In",
                                fontSize: kSixteenFont,
                                fontWeight: kFW700,
                                isLoading: false,
                                onTap: () {
                                  var payload = {
                                    "user_email": authcontroller
                                        .UserEmailSignInController.text,
                                    "user_password": authcontroller
                                        .UserEmailPasswordController.text
                                  };

                                  // if (_formKey.currentState!.validate()) {
                                  //   authcontroller.userSignIn(payload);
                                  // }
                                  if (_formKey.currentState!.validate()) {
                                    authcontroller.userSignIn(payload);
                                  }
                                  // Get.toNamed(kNavigation);
                                }),
                      ),

                      SizedBox(
                        height: 20.h,
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(kSignUps);
                        },
                        // kSignUp
                        child: Center(
                          child: RichText(
                            textScaleFactor: 1,
                            textAlign: TextAlign.left,
                            text: TextSpan(
                              text: "Don't have an account?  ",
                              style: GoogleFonts.poppins(
                                fontSize: 11.sp,
                                fontWeight: kFW400,
                                color: KBlack_twg,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: "Sign up",
                                  style: GoogleFonts.roboto(
                                      fontSize: kSixteenFont,
                                      color: Kform_border_twg,
                                      fontWeight: kFW600),
                                ),
                              ],
                            ),
                          ),
                        ),
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
