import 'package:flutter/services.dart';
import 'package:bharatastro/untils/export_file.dart';

// class EditProfile extends StatefulWidget {

import 'package:flutter/services.dart';
import 'package:bharatastro/untils/export_file.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
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
              "User Details",
              style: GoogleFonts.dmSerifDisplay(
                  color: Kwhite, fontSize: kTwentyFont, fontWeight: kFW400),
            )),
        body: Container(
          margin: EdgeInsets.all(16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Your Details",
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
            CustomFormFields(
              ontap: () {
                //  Get.toNamed(kSearchPlaces); // kForgotPassword
              },
              // controller: authcontroller.regrnameInController,
              enabled: true,
              labelColor: KText,
              obscureText: false,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              fontSize: kFourteenFont,
              fontWeight: FontWeight.w500,
              hintText: "Enter name",
              maxLines: 1,
              label: "Full name",
              readOnly: false,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter name';
                }
                return null;
              },
            ),
            SizedBox(
              height: 15.h,
            ),
            CustomFormFields(
              ontap: () {
                //  Get.toNamed(kSearchPlaces); // kForgotPassword
              },
              //     controller: authcontroller.regrEmailSignInController,
              enabled: true,
              labelColor: KText,
              obscureText: false,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
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
            CustomFormFields(
              ontap: () {
                //  Get.toNamed(kSearchPlaces); // kForgotPassword
              },
              //     controller: authcontroller.regrEmailSignInController,
              enabled: true,
              labelColor: KText,
              keyboardType: TextInputType.number,
              obscureText: false,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              fontSize: kFourteenFont,
              fontWeight: FontWeight.w500,
              hintText: "Enter mobile number",
              maxLines: 1,
              readOnly: false,
              label: "Mobile Number",
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter mobile number';
                }
                return null;
              },
            ),
            SizedBox(
              height: 15.h,
            ),
            CustomFormFields(
              ontap: () {
                //  Get.toNamed(kSearchPlaces); // kForgotPassword
              },
              //     controller: authcontroller.regrEmailSignInController,
              enabled: true,
              labelColor: KText,
              obscureText: false,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              fontSize: kFourteenFont,
              fontWeight: FontWeight.w500,
              hintText: "Enter languge",
              maxLines: 1,
              readOnly: false,
              label: "Language",
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter language';
                }
                return null;
              },
            ),
            CustomButton(
                margin: EdgeInsets.only(top: 36.h),
                borderRadius: BorderRadius.circular(8.r),
                Color: Kform_border_twg,
                textColor: Kwhite,
                height: 40,
                width: double.infinity,
                label: "Update Details",
                fontSize: kSixteenFont,
                fontWeight: kFW700,
                isLoading: false,
                onTap: () {}),
          ]),
        ));
  }
}
