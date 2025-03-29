import 'package:flutter/services.dart';
import 'package:bharatastro/untils/export_file.dart';

class HowToUse extends StatefulWidget {
  const HowToUse({super.key});

  @override
  State<HowToUse> createState() => _HowToUseState();
}

class _HowToUseState extends State<HowToUse> {
  DashboardController dashController = Get.put(DashboardController());
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
              "How To Use",
              style: GoogleFonts.dmSerifDisplay(
                  color: Kwhite, fontSize: kTwentyFont, fontWeight: kFW400),
            )),
        body: Stack(
          children: [
            Image.asset(
              "assets/images/test_night.png",
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(13),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Account Creation",
                        style: GoogleFonts.poppins(
                            fontSize: 20.sp,
                            fontWeight: kFW500,
                            color: kAstro_yellow)),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                        "Sign up with your basic details to unlock access to all the services on this website.",
                        style: GoogleFonts.poppins(
                            fontSize: 14.sp,
                            fontWeight: kFW400,
                            color: Kwhite)),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                        "Log in using the credentials you provided during sign-up. Make sure to remember your email ID and password for future access.",
                        style: GoogleFonts.poppins(
                            fontSize: 14.sp,
                            fontWeight: kFW400,
                            color: Kwhite)),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text("Choose a Plan",
                        style: GoogleFonts.poppins(
                            fontSize: 20.sp,
                            fontWeight: kFW500,
                            color: kAstro_yellow)),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                        "Select a plan to unlock exclusive features and services tailored to your needs.",
                        style: GoogleFonts.poppins(
                            fontSize: 14.sp,
                            fontWeight: kFW400,
                            color: Kwhite)),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                        "Before purchasing, review the plan details carefully and choose the one that suits you best.",
                        style: GoogleFonts.poppins(
                            fontSize: 14.sp,
                            fontWeight: kFW400,
                            color: Kwhite)),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                        "Ensure you provide a valid shipping address to receive your items securely.",
                        style: GoogleFonts.poppins(
                            fontSize: 14.sp,
                            fontWeight: kFW400,
                            color: Kwhite)),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                        "Submit accurate personal information, including your date, time, and place of birth, along with any other required details.",
                        style: GoogleFonts.poppins(
                            fontSize: 14.sp,
                            fontWeight: kFW400,
                            color: Kwhite)),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text("Explore Features",
                        style: GoogleFonts.poppins(
                            fontSize: 20.sp,
                            fontWeight: kFW500,
                            color: kAstro_yellow)),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                        "Experience the convenience of our NFC card. Simply tap it on your mobile to receive your astrological insights via WhatsApp.",
                        style: GoogleFonts.poppins(
                            fontSize: 14.sp,
                            fontWeight: kFW400,
                            color: Kwhite)),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                        "Discover a variety of services including Predictions, Horoscopes, Matchmaking, and more. Access them instantly through the dashboard with just a click.",
                        style: GoogleFonts.poppins(
                            fontSize: 14.sp,
                            fontWeight: kFW400,
                            color: Kwhite)),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                        "Save and view your astrological data easily on your PC for future reference.",
                        style: GoogleFonts.poppins(
                            fontSize: 14.sp,
                            fontWeight: kFW400,
                            color: Kwhite)),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text("Personalized Services",
                        style: GoogleFonts.poppins(
                            fontSize: 20.sp,
                            fontWeight: kFW500,
                            color: kAstro_yellow)),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                        "Access insights about your career, health, love, and spiritual journey through the dashboard.",
                        style: GoogleFonts.poppins(
                            fontSize: 14.sp,
                            fontWeight: kFW400,
                            color: Kwhite)),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                        "Explore our matching service to discover how your lifestyle aligns with your life partner.",
                        style: GoogleFonts.poppins(
                            fontSize: 14.sp,
                            fontWeight: kFW400,
                            color: Kwhite)),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text("Get Plans",
                        style: GoogleFonts.poppins(
                            fontSize: 20.sp,
                            fontWeight: kFW500,
                            color: kAstro_yellow)),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                        "Discover the benefits of our NFC card and web app. The NFC card allows seamless access to your personalized astrological details with just a tap on your mobile device. The web app complements this by providing a comprehensive platform to manage and explore additional features anytime, anywhere.",
                        style: GoogleFonts.poppins(
                            fontSize: 14.sp,
                            fontWeight: kFW400,
                            color: Kwhite)),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                        "Learn about how the NFC card and web app work together to offer a smooth and connected experience tailored to your needs.",
                        style: GoogleFonts.poppins(
                            fontSize: 14.sp,
                            fontWeight: kFW400,
                            color: Kwhite)),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                        "Upgrade your plan to unlock other features, enhanced services, and exclusive benefits for an even better experience.",
                        style: GoogleFonts.poppins(
                            fontSize: 14.sp,
                            fontWeight: kFW400,
                            color: Kwhite)),
                    SizedBox(
                      height: 30.h,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
