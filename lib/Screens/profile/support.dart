import 'package:flutter/services.dart';
import 'package:bharatastro/untils/export_file.dart';

class Support extends StatefulWidget {
  const Support({super.key});

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
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
              "Support",
              style: GoogleFonts.dmSerifDisplay(
                  color: Kwhite, fontSize: kTwentyFont, fontWeight: kFW400),
            )),
        body: Container(
          margin: EdgeInsets.all(16),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/astrologo.png",
                  height: 240.h,
                  width: 240.w,
                  color: kblack,
                ),
                Text("If you are facing any issue?",
                    // "Join the journey to unlock the secrets of your stars. Personalize your astrological experience today!",

                    textAlign: TextAlign.start,
                    style: GoogleFonts.poppins(
                        fontSize: kTwelveFont,
                        fontWeight: kFW500,
                        color: KdarkText)),
                SizedBox(
                  height: 10.h,
                ),
                Text("Contact our support team",
                    // "Join the journey to unlock the secrets of your stars. Personalize your astrological experience today!",

                    textAlign: TextAlign.start,
                    style: GoogleFonts.poppins(
                        fontSize: kFourteenFont,
                        fontWeight: kFW500,
                        color: KdarkText)),
                Container(
                  margin: EdgeInsets.only(top: 65.h),

                  //height: 40,
                  width: double.infinity,
                  padding: EdgeInsets.all(6),
                  //  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Kform_border_twg,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "  Whatsapp",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: kSixteenFont,
                          color: Kwhite,
                          fontWeight: kFW700,
                        ),
                      ),
                      Image.asset(
                        "assets/images/whatts.png",
                        height: 45.h,
                        width: 45.w,
                        // color: kblack,
                      ),
                    ],
                  ),
                )
                // CustomButton(
                //     margin:
                //     borderRadius: BorderRadius.circular(8.r),
                //     Color: Kform_border_twg,
                //     textColor:

                //     label: "Change Password",
                //     fontSize:
                //     fontWeight:
                //     isLoading: false,
                //     onTap: () {}),
              ]),
        ));
  }
}
