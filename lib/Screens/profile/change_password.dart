import 'package:flutter/services.dart';
import 'package:bharatastro/untils/export_file.dart';

// class ChangePasword extends StatefulWidget {

import 'package:flutter/services.dart';
import 'package:bharatastro/untils/export_file.dart';

class ChangePasword extends StatefulWidget {
  const ChangePasword({super.key});

  @override
  State<ChangePasword> createState() => _ChangePaswordState();
}

class _ChangePaswordState extends State<ChangePasword> {
  final _formKey = GlobalKey<FormState>();
  String? selectedOption;
  bool passwordVisible = true;
  bool confirmpasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Kbg_theme_two,
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
              "Change Password",
              style: GoogleFonts.dmSerifDisplay(
                  color: Kwhite, fontSize: kTwentyFont, fontWeight: kFW400),
            )),
        body: Container(
          margin: EdgeInsets.all(16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Change Your Password",
                // "Join the journey to unlock the secrets of your stars. Personalize your astrological experience today!",
                maxLines: 2,
                textAlign: TextAlign.start,
                style: GoogleFonts.poppins(
                    fontSize: kEighteenFont,
                    fontWeight: kFW400,
                    color: KdarkText)),
            SizedBox(
              height: 18.h,
            ),
            Text(
              "Old Password",
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
                //    controller: authcontroller.regrEmailPasswordController,
                style: GoogleFonts.poppins(
                    fontSize: 14.sp, fontWeight: kFW500, color: kblack),
                decoration: InputDecoration(
                  focusColor: Kbg_theme,
                  filled: true,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 8),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: KText_border_twg, width: 0.5),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: KRed_twg, width: 0.5),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: KText_border_twg, width: 0.5),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Kform_border_twg, width: 1),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Kform_border_twg, width: 1),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  fillColor: Kbg_theme,

                  hintText: "Enter Old Password",
                  alignLabelWithHint: true,
                  suffixIcon: IconButton(
                    icon: Icon(
                      passwordVisible ? Icons.visibility : Icons.visibility_off,
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
                    return 'Please enter Old  Password';
                  }
                  return null;
                },
                onChanged: (value) {},
              ),
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
                //    controller: authcontroller.regrEmailPasswordController,
                style: GoogleFonts.poppins(
                    fontSize: 14.sp, fontWeight: kFW500, color: kblack),
                decoration: InputDecoration(
                  focusColor: Kbg_theme,
                  filled: true,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 8),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: KText_border_twg, width: 0.5),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: KRed_twg, width: 0.5),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: KText_border_twg, width: 0.5),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Kform_border_twg, width: 1),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Kform_border_twg, width: 1),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  fillColor: Kbg_theme,

                  hintText: "Enter Password",
                  alignLabelWithHint: true,
                  suffixIcon: IconButton(
                    icon: Icon(
                      passwordVisible ? Icons.visibility : Icons.visibility_off,
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
              height: 15.h,
            ),
            Text(
              "Confirm Password",
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
                //       controller: authcontroller.regrEmailnewswordController,
                style: GoogleFonts.poppins(
                    fontSize: 14.sp, fontWeight: kFW500, color: kblack),
                decoration: InputDecoration(
                  focusColor: Kbg_theme,
                  filled: true,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 8),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: KText_border_twg, width: 0.5),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: KRed_twg, width: 0.5),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: KText_border_twg, width: 0.5),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Kform_border_twg, width: 1),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Kform_border_twg, width: 1),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  fillColor: Kbg_theme,

                  hintText: "Enter Confirm Password",
                  alignLabelWithHint: true,
                  suffixIcon: IconButton(
                    icon: Icon(
                      passwordVisible ? Icons.visibility : Icons.visibility_off,
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
                    return 'Please enter confirm Password';
                  }
                  return null;
                },
                onChanged: (value) {},
              ),
            ),
            CustomButton(
                margin: EdgeInsets.only(top: 36.h),
                borderRadius: BorderRadius.circular(8.r),
                Color: Kform_border_twg,
                textColor: Kwhite,
                height: 40,
                width: double.infinity,
                label: "Change Password",
                fontSize: kSixteenFont,
                fontWeight: kFW700,
                isLoading: false,
                onTap: () {}),
          ]),
        ));
  }
}
