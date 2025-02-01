import 'dart:math';

import 'package:flutter/services.dart';
import 'package:bharatastro/untils/export_file.dart';
import 'package:text_3d/text_3d.dart';

class Pricing extends StatefulWidget {
  const Pricing({super.key});

  @override
  State<Pricing> createState() => _PricingState();
}

class _PricingState extends State<Pricing> {
  AuthController authcontroller = Get.put(AuthController());
  DashboardController dashController = Get.put(DashboardController());
  @override
  void initState() {
    setState(() {
      authcontroller.selectedPlan.value = "card";
      dashController.selectedPlanAmount.value =
          dashController.allPlans[2]["offerPrice"].toString();
      dashController.selectedPlanType.value =
          dashController.allPlans[2]["planType"];

      dashController.selectedPlanId.value =
          dashController.allPlans[2]["planTypeId"].toString();
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
            "BharatAstro Plans",
            style: GoogleFonts.dmSerifDisplay(
                color: Kwhite, fontSize: kTwentyFont, fontWeight: kFW400),
          )),
      // appBar: AppBar(
      //     backgroundColor: kAstroBgblue,
      //     automaticallyImplyLeading: false,
      //     titleSpacing: 0,
      //     leading: InkWell(
      //       onTap: () {
      //         Get.back();
      //       },
      //       child: Icon(
      //         Icons.arrow_back_ios,
      //         color: Kwhite,
      //         size: 23.sp,
      //       ),
      //     ),
      //     title: Text(
      //       "Astro Card",
      //       style: GoogleFonts.poppins(
      //           color: Kwhite, fontSize: kTwentyFont, fontWeight: kFW600),
      //     )),
      /// backgroundColor: kAstroBgblue,
      body: Stack(
        children: [
          Image.asset(
            "assets/images/test_night.png",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Obx(
            () => SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(16),
                child: Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                authcontroller.selectedPlan.value = "card";
                                dashController.selectedPlanAmount.value =
                                    dashController.allPlans[2]["offerPrice"]
                                        .toString();
                                dashController.selectedPlanType.value =
                                    dashController.allPlans[2]["planType"];

                                dashController.selectedPlanId.value =
                                    dashController.allPlans[2]["planTypeId"]
                                        .toString();
//                                   selectedPlan = "".obs;
// selectedPlanId = "".obs;
                              });
                              print("object");
                            },
                            child: GlassmorphicContainer(
                                width: MediaQuery.of(context).size.width / 1.3,
                                height: MediaQuery.of(context).size.height / 6,
                                // height: MediaQuery.of(context).size.height / 1.5,
                                borderRadius: 10,
                                blur: 20,
                                alignment: Alignment.bottomCenter,
                                border: 0.8,
                                linearGradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      // Kwhite,
                                      Kwhite.withOpacity(0.5),
                                      // Kwhite.withOpacity(0.7),
                                      // KGradientLightgrey.withOpacity(0.5),
                                      KGradientLightgrey.withOpacity(0.5),
                                      // Color(0xFFffffff).withOpacity(0.1),
                                      // Color(0xFFFFFFFF).withOpacity(0.05),
                                    ],
                                    stops: [
                                      0.1,
                                      1,
                                    ]),
                                borderGradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Kbg_theme_two.withOpacity(0.5),
                                    KGradientLightgrey.withOpacity(0.5),
                                  ],
                                ),
                                child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 1.3,
                                    height:
                                        MediaQuery.of(context).size.height / 6,
                                    //  color: Kwhite,
                                    //  margin: EdgeInsets.all(10),
                                    //  authcontroller.selectedPlan == "cardandmobile"
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          10,
                                        ),
                                        border: Border.all(
                                            color:
                                                authcontroller.selectedPlan ==
                                                        "card"
                                                    ? KGold
                                                    : Colors.transparent,
                                            width: 0.8)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Image.asset(
                                          "assets/images/earthOne.png",
                                          height: 100.h,
                                          // height: double.infinity,
                                          // width: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                        Stack(
                                          children: [
                                            Container(
                                              margin:
                                                  EdgeInsets.only(top: 14.h),
                                              // margin: EdgeInsets.only(top: 17.h),
                                              child: ThreeDText(
                                                text: " CARD     ",
                                                textStyle: TextStyle(
                                                    fontSize: 40,
                                                    color:
                                                        Kwhite.withOpacity(0.5)
                                                    // color: KpinkGradtwo.withOpacity(0.5)
                                                    ),
                                                depth: 40,
                                                style: ThreeDStyle
                                                    .perspectiveInset,
                                                angle: pi / 6,
                                                perspectiveDepth: 15,
                                                // perspectiveDepth: 20,
                                              ),
                                            ),
                                            Positioned(
                                              // bottom: 40.h,
                                              left: 25.w,
                                              child: Text(
                                                "CARD      ",
                                                // "CARD          ",
                                                //  "CARD                            ",

                                                style:
                                                    GoogleFonts.dmSerifDisplay(
                                                        fontSize: 28.sp,
                                                        // color: Kwhite,
                                                        color:
                                                            KGradientLightgrey,
                                                        fontWeight: kFW400),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ))),
                          ),

                          SizedBox(
                            width: 10.w,
                          ),

                          InkWell(
                            onTap: () {
                              setState(() {
                                authcontroller.selectedPlan.value = "mobile";
                                dashController.selectedPlanAmount.value =
                                    dashController.allPlans[0]["offerPrice"]
                                        .toString();
                                dashController.selectedPlanType.value =
                                    dashController.allPlans[0]["planType"];
                                dashController.selectedPlanId.value =
                                    dashController.allPlans[0]["planTypeId"]
                                        .toString();
                              });
                              print("object");
                            },
                            child: GlassmorphicContainer(
                                width: MediaQuery.of(context).size.width / 1.3,
                                height: MediaQuery.of(context).size.height / 6,
                                // height: MediaQuery.of(context).size.height / 1.5,
                                borderRadius: 10,
                                blur: 20,
                                alignment: Alignment.bottomCenter,
                                border: 0.8,
                                linearGradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      // Kwhite,
                                      // KBlack_twg.withOpacity(0.1),
                                      KBoxShadow,
                                      // Kwhite.withOpacity(0.7),
                                      // KGradientLightgrey.withOpacity(0.5),
                                      KGradientLightgrey.withOpacity(0.5),
                                      // Color(0xFFffffff).withOpacity(0.1),
                                      // Color(0xFFFFFFFF).withOpacity(0.05),
                                    ],
                                    stops: [
                                      0.1,
                                      1,
                                    ]),
                                borderGradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Kbg_theme_two.withOpacity(0.5),
                                    KGradientLightgrey.withOpacity(0.5),
                                  ],
                                ),
                                child: Container(
                                    //  color: Kwhite,
                                    //  margin: EdgeInsets.all(10),
                                    width:
                                        MediaQuery.of(context).size.width / 1.3,
                                    height:
                                        MediaQuery.of(context).size.height / 6,
                                    //  color: Kwhite,
                                    //  margin: EdgeInsets.all(10),
                                    //  authcontroller.selectedPlan == "cardandmobile"
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          10,
                                        ),
                                        border: Border.all(
                                            color:
                                                authcontroller.selectedPlan ==
                                                        "mobile"
                                                    ? KGold
                                                    : Colors.transparent,
                                            width: 0.8)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Image.asset(
                                          "assets/images/earth_two.png",
                                          //  "assets/images/earthOne.png",
                                          height: 100.h,
                                          // height: double.infinity,
                                          width: 90.w,
                                          fit: BoxFit.cover,
                                        ),
                                        // RotatedBox(
                                        //   quarterTurns: 5,
                                        //   // quarterTurns: 5,
                                        //   child: Image.asset(
                                        //     "assets/images/earth_two.png",
                                        //     //  "assets/images/earthOne.png",
                                        //     height: 100.h,
                                        //     // height: double.infinity,
                                        //     // width: double.infinity,
                                        //     fit: BoxFit.cover,
                                        //   ),
                                        // ),
                                        Stack(
                                          children: [
                                            Container(
                                              margin:
                                                  EdgeInsets.only(top: 14.h),
                                              // margin: EdgeInsets.only(top: 17.h),
                                              child: ThreeDText(
                                                text: "MOBILE ",
                                                textStyle: TextStyle(
                                                    fontSize: 40,
                                                    color:
                                                        Kwhite.withOpacity(0.5)
                                                    // color: KpinkGradtwo.withOpacity(0.5)
                                                    ),
                                                depth: 40,
                                                style: ThreeDStyle
                                                    .perspectiveInset,
                                                angle: pi / 6,
                                                perspectiveDepth: 15,
                                                // perspectiveDepth: 20,
                                              ),
                                            ),
                                            Positioned(
                                              // bottom: 40.h,
                                              left: 25.w,
                                              child: Text(
                                                "MOBILE",
                                                // "CARD          ",
                                                //  "CARD                            ",

                                                style:
                                                    GoogleFonts.dmSerifDisplay(
                                                        fontSize: 28.sp,
                                                        // color: Kwhite,
                                                        color:
                                                            KGradientLightgrey,
                                                        fontWeight: kFW400),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ))),
                          ),

                          SizedBox(
                            width: 10.h,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                authcontroller.selectedPlan.value =
                                    "cardandmobile";
                                dashController.selectedPlanAmount.value =
                                    dashController.allPlans[1]["offerPrice"]
                                        .toString();
                                dashController.selectedPlanType.value =
                                    dashController.allPlans[1]["planType"];
                                dashController.selectedPlanId.value =
                                    dashController.allPlans[1]["planTypeId"]
                                        .toString();
                              });
                              print("object");
                            },
                            child: GlassmorphicContainer(
                                width: MediaQuery.of(context).size.width / 1.3,
                                height: MediaQuery.of(context).size.height / 6,
                                // height: MediaQuery.of(context).size.height / 1.5,
                                borderRadius: 10,
                                blur: 20,
                                alignment: Alignment.bottomCenter,
                                border: 0.8,
                                linearGradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      // Kwhite,
                                      // KBlack_twg.withOpacity(0.1),
                                      KBoxShadow,
                                      // Kwhite.withOpacity(0.7),
                                      // KGradientLightgrey.withOpacity(0.5),
                                      KGradientLightgrey.withOpacity(0.5),
                                      // Color(0xFFffffff).withOpacity(0.1),
                                      // Color(0xFFFFFFFF).withOpacity(0.05),
                                    ],
                                    stops: [
                                      0.1,
                                      1,
                                    ]),
                                borderGradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Kbg_theme_two.withOpacity(0.5),
                                    KGradientLightgrey.withOpacity(0.5),
                                  ],
                                ),
                                child: Container(
                                    //  color: Kwhite,
                                    //  margin: EdgeInsets.all(10),
                                    width:
                                        MediaQuery.of(context).size.width / 1.3,
                                    height:
                                        MediaQuery.of(context).size.height / 6,
                                    //  color: Kwhite,
                                    //  margin: EdgeInsets.all(10),
                                    //  authcontroller.selectedPlan == "cardandmobile"
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          10,
                                        ),
                                        border: Border.all(
                                            color:
                                                authcontroller.selectedPlan ==
                                                        "cardandmobile"
                                                    ? KGold
                                                    : Colors.transparent,
                                            width: 0.8)),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      // crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          "assets/images/earth_three.png",
                                          //  "assets/images/earthOne.png",
                                          height: 100.h,
                                          // height: double.infinity,
                                          width: 90.w,
                                          fit: BoxFit.cover,
                                        ),
                                        // RotatedBox(
                                        //   quarterTurns: 5,
                                        //   // quarterTurns: 5,
                                        //   child: Image.asset(
                                        //     "assets/images/earth_two.png",
                                        //     //  "assets/images/earthOne.png",
                                        //     height: 100.h,
                                        //     // height: double.infinity,
                                        //     // width: double.infinity,
                                        //     fit: BoxFit.cover,
                                        //   ),
                                        // ),
                                        Column(
                                          children: [
                                            Stack(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: 14.h),
                                                  // margin: EdgeInsets.only(top: 17.h),
                                                  child: ThreeDText(
                                                    text: "CARD &",
                                                    textStyle: TextStyle(
                                                        fontSize: 35,
                                                        color:
                                                            Kwhite.withOpacity(
                                                                0.5)
                                                        // color: KpinkGradtwo.withOpacity(0.5)
                                                        ),
                                                    depth: 40,
                                                    style: ThreeDStyle
                                                        .perspectiveInset,
                                                    angle: pi / 6,
                                                    perspectiveDepth: 15,
                                                    // perspectiveDepth: 20,
                                                  ),
                                                ),
                                                Positioned(
                                                  // bottom: 40.h,
                                                  left: 13.w,
                                                  child: Text(
                                                    "CARD &",
                                                    // "CARD          ",
                                                    //  "CARD                            ",

                                                    style: GoogleFonts
                                                        .dmSerifDisplay(
                                                            fontSize: 28.sp,
                                                            // color: Kwhite,
                                                            color:
                                                                KGradientLightgrey,
                                                            fontWeight: kFW400),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Stack(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: 12.h),
                                                  // margin: EdgeInsets.only(top: 17.h),
                                                  child: ThreeDText(
                                                    text: "MOBILE   ",
                                                    textStyle: TextStyle(
                                                        fontSize: 35.sp,
                                                        color:
                                                            Kwhite.withOpacity(
                                                                0.5)
                                                        // color: KpinkGradtwo.withOpacity(0.5)
                                                        ),
                                                    depth: 40,
                                                    style: ThreeDStyle
                                                        .perspectiveInset,
                                                    angle: pi / 6,
                                                    perspectiveDepth: 15,
                                                    // perspectiveDepth: 20,
                                                  ),
                                                ),
                                                Positioned(
                                                  // bottom: 40.h,
                                                  left: 15.w,
                                                  child: Text(
                                                    "MOBILE",
                                                    // "CARD          ",
                                                    //  "CARD                            ",

                                                    style: GoogleFonts
                                                        .dmSerifDisplay(
                                                            fontSize: 28.sp,
                                                            // color: Kwhite,
                                                            color:
                                                                KGradientLightgrey,
                                                            fontWeight: kFW400),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ))),
                          ),

                          // Image.asset('assets/image1.jpg',
                          //     width: 200, height: 200),
                          // SizedBox(width: 10),
                          // Image.asset('assets/image2.jpg',
                          //     width: 200, height: 200),
                          // SizedBox(width: 10),
                          // Image.asset('assets/image3.jpg',
                          //     width: 200, height: 200),
                        ],
                      ),
                    ),
                    // for card
                    authcontroller.selectedPlan == "card"
                        ? Column(
                            children: [
                              GlassmorphicContainer(
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height / 3.5,
                                // height: MediaQuery.of(context).size.height / 1.5,
                                margin: EdgeInsets.only(top: 25.h),
                                borderRadius: 10,
                                blur: 20,
                                alignment: Alignment.bottomCenter,
                                border: 0.8,
                                linearGradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Color(0xFFffffff).withOpacity(0.1),
                                      Color(0xFFFFFFFF).withOpacity(0.05),
                                    ],
                                    stops: [
                                      0.1,
                                      1,
                                    ]),
                                borderGradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xFFffffff).withOpacity(0.5),
                                    Color((0xFFFFFFFF)).withOpacity(0.5),
                                  ],
                                ),
                                child: Container(
                                  //  color: Kwhite,
                                  margin: EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      //Explore the cosmos with our daily astrology card. Your guide to the stars awaits! Discover what the universe holds for you today.

                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                              authcontroller.selectedPlan ==
                                                      "cardandmobile"
                                                  ? "Card and Mobile"
                                                  : authcontroller.selectedPlan
                                                      .value.capitalize!,
                                              style: GoogleFonts.poppins(
                                                  fontSize: kEighteenFont,
                                                  fontWeight: kFW500,
                                                  color:
                                                      Kwhite.withOpacity(0.7))),
                                        ],
                                      ),
                                      Divider(),
                                      SizedBox(
                                        height: 3.h,
                                      ),
                                      Row(
                                        children: [
                                          Image.asset(
                                            "assets/images/done_image.png",
                                            height: 18.h,
                                            fit: BoxFit.cover,
                                          ),
                                          SizedBox(
                                            width: 7.w,
                                          ),
                                          Text("Planet Report",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 13.sp,
                                                  fontWeight: kFW400,
                                                  color: Kwhite)),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 3.h,
                                      ),
                                      Row(
                                        children: [
                                          Image.asset(
                                            "assets/images/done_image.png",
                                            height: 18.h,
                                            fit: BoxFit.cover,
                                          ),
                                          SizedBox(
                                            width: 7.w,
                                          ),
                                          Text("Personal Characteristics",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 13.sp,
                                                  fontWeight: kFW400,
                                                  color: Kwhite)),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 3.h,
                                      ),
                                      Row(
                                        children: [
                                          Image.asset(
                                            "assets/images/done_image.png",
                                            height: 18.h,
                                            fit: BoxFit.cover,
                                          ),
                                          SizedBox(
                                            width: 7.w,
                                          ),
                                          Text("Daily Sun",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 13.sp,
                                                  fontWeight: kFW400,
                                                  color: Kwhite)),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 3.h,
                                      ),
                                      Row(
                                        children: [
                                          Image.asset(
                                            "assets/images/done_image.png",
                                            height: 18.h,
                                            fit: BoxFit.cover,
                                          ),
                                          SizedBox(
                                            width: 7.w,
                                          ),
                                          Text("Weekly Sun",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 13.sp,
                                                  fontWeight: kFW400,
                                                  color: Kwhite)),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 3.h,
                                      ),
                                      Row(
                                        children: [
                                          Image.asset(
                                            "assets/images/done_image.png",
                                            height: 18.h,
                                            fit: BoxFit.cover,
                                          ),
                                          SizedBox(
                                            width: 7.w,
                                          ),
                                          Text("Yearly",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 13.sp,
                                                  fontWeight: kFW400,
                                                  color: Kwhite)),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 3.h,
                                      ),
                                      Row(
                                        children: [
                                          Image.asset(
                                            "assets/images/done_image.png",
                                            height: 18.h,
                                            fit: BoxFit.cover,
                                          ),
                                          SizedBox(
                                            width: 7.w,
                                          ),
                                          Text(" Planet Details",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 13.sp,
                                                  fontWeight: kFW400,
                                                  color: Kwhite)),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 3.h,
                                      ),
                                      Row(
                                        children: [
                                          Image.asset(
                                            "assets/images/done_image.png",
                                            height: 18.h,
                                            fit: BoxFit.cover,
                                          ),
                                          SizedBox(
                                            width: 7.w,
                                          ),
                                          Text("Day Number",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 13.sp,
                                                  fontWeight: kFW400,
                                                  color: Kwhite)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              GlassmorphicContainer(
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height / 4.7,
                                // height: MediaQuery.of(context).size.height / 1.5,
                                margin: EdgeInsets.only(top: 25.h),
                                borderRadius: 10,
                                blur: 20,
                                alignment: Alignment.bottomCenter,
                                border: 0.8,
                                linearGradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Color(0xFFffffff).withOpacity(0.1),
                                      Color(0xFFFFFFFF).withOpacity(0.05),
                                    ],
                                    stops: [
                                      0.1,
                                      1,
                                    ]),
                                borderGradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xFFffffff).withOpacity(0.5),
                                    Color((0xFFFFFFFF)).withOpacity(0.5),
                                  ],
                                ),
                                child: Container(
                                  //  color: Kwhite,
                                  margin: EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      //Explore the cosmos with our daily astrology card. Your guide to the stars awaits! Discover what the universe holds for you today.

                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                              dashController.allPlans[2]
                                                          ["actualPrice"]
                                                      .toString() +
                                                  "/" +
                                                  dashController.allPlans[2]
                                                      ["validity"],
                                              //"₹499/lifetime",
                                              textAlign: TextAlign.left,
                                              style: GoogleFonts.poppins(
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  fontSize: kTwelveFont,
                                                  fontWeight: kFW500,
                                                  color: KRed)),
                                        ],
                                      ),
                                      SizedBox(height: 10.h),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                              dashController.allPlans[2]
                                                          ["offerPrice"]
                                                      .toString() +
                                                  "/" +
                                                  dashController.allPlans[2]
                                                      ["validity"],
                                              //"₹474/lifetime",
                                              style: GoogleFonts.dmSerifDisplay(
                                                fontSize: kTwentyFont,
                                                fontWeight: kFW500,
                                                color: Kwhite,
                                              )),
                                        ],
                                      ),
                                      SizedBox(height: 10.h),
                                      Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text("Best option for personal",
                                                style:
                                                    GoogleFonts.dmSerifDisplay(
                                                  fontSize: kTwelveFont,
                                                  fontWeight: kFW500,
                                                  color: Kwhite,
                                                )),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10.h),
                                      Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                color: KRed,
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Image.asset(
                                                  "assets/images/tag_image.png",
                                                  height: 18.h,
                                                  fit: BoxFit.cover,
                                                ),
                                                SizedBox(width: 8.w),
                                                Text(
                                                    "${dashController.allPlans[2]["discountPercentage"]}% off on card",
                                                    style: GoogleFonts
                                                        .dmSerifDisplay(
                                                      fontSize: kFourteenFont,
                                                      fontWeight: kFW400,
                                                      color: Kwhite,
                                                    )),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        // for mobile
                        : authcontroller.selectedPlan == "mobile"
                            ? Column(
                                children: [
                                  GlassmorphicContainer(
                                    width: double.infinity,
                                    height: MediaQuery.of(context).size.height /
                                        3.5,
                                    // height: MediaQuery.of(context).size.height / 1.5,
                                    margin: EdgeInsets.only(top: 25.h),
                                    borderRadius: 10,
                                    blur: 20,
                                    alignment: Alignment.bottomCenter,
                                    border: 0.8,
                                    linearGradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Color(0xFFffffff).withOpacity(0.1),
                                          Color(0xFFFFFFFF).withOpacity(0.05),
                                        ],
                                        stops: [
                                          0.1,
                                          1,
                                        ]),
                                    borderGradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xFFffffff).withOpacity(0.5),
                                        Color((0xFFFFFFFF)).withOpacity(0.5),
                                      ],
                                    ),
                                    child: Container(
                                      //  color: Kwhite,
                                      margin: EdgeInsets.all(10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          //Explore the cosmos with our daily astrology card. Your guide to the stars awaits! Discover what the universe holds for you today.

                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                  authcontroller.selectedPlan ==
                                                          "cardandmobile"
                                                      ? "Card and Mobile"
                                                      : authcontroller
                                                          .selectedPlan
                                                          .value
                                                          .capitalize!,
                                                  style: GoogleFonts.poppins(
                                                      fontSize: kEighteenFont,
                                                      fontWeight: kFW500,
                                                      color: Kwhite.withOpacity(
                                                          0.7))),
                                            ],
                                          ),
                                          Divider(),
                                          SizedBox(
                                            height: 3.h,
                                          ),
                                          Row(
                                            children: [
                                              Image.asset(
                                                "assets/images/done_image.png",
                                                height: 18.h,
                                                fit: BoxFit.cover,
                                              ),
                                              SizedBox(
                                                width: 7.w,
                                              ),
                                              Text("Prediction",
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 13.sp,
                                                      fontWeight: kFW400,
                                                      color: Kwhite)),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 3.h,
                                          ),
                                          Row(
                                            children: [
                                              Image.asset(
                                                "assets/images/done_image.png",
                                                height: 18.h,
                                                fit: BoxFit.cover,
                                              ),
                                              SizedBox(
                                                width: 7.w,
                                              ),
                                              Text("Horoscope",
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 13.sp,
                                                      fontWeight: kFW400,
                                                      color: Kwhite)),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 3.h,
                                          ),
                                          Row(
                                            children: [
                                              Image.asset(
                                                "assets/images/done_image.png",
                                                height: 18.h,
                                                fit: BoxFit.cover,
                                              ),
                                              SizedBox(
                                                width: 7.w,
                                              ),
                                              Text("Matching",
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 13.sp,
                                                      fontWeight: kFW400,
                                                      color: Kwhite)),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 3.h,
                                          ),
                                          Row(
                                            children: [
                                              Image.asset(
                                                "assets/images/done_image.png",
                                                height: 18.h,
                                                fit: BoxFit.cover,
                                              ),
                                              SizedBox(
                                                width: 7.w,
                                              ),
                                              Text("Dashas",
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 13.sp,
                                                      fontWeight: kFW400,
                                                      color: Kwhite)),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 3.h,
                                          ),
                                          Row(
                                            children: [
                                              Image.asset(
                                                "assets/images/done_image.png",
                                                height: 18.h,
                                                fit: BoxFit.cover,
                                              ),
                                              SizedBox(
                                                width: 7.w,
                                              ),
                                              Text("Dosh",
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 13.sp,
                                                      fontWeight: kFW400,
                                                      color: Kwhite)),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 3.h,
                                          ),
                                          Row(
                                            children: [
                                              Image.asset(
                                                "assets/images/done_image.png",
                                                height: 18.h,
                                                fit: BoxFit.cover,
                                              ),
                                              SizedBox(
                                                width: 7.w,
                                              ),
                                              Text("Utility",
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 13.sp,
                                                      fontWeight: kFW400,
                                                      color: Kwhite)),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 3.h,
                                          ),
                                          Row(
                                            children: [
                                              Image.asset(
                                                "assets/images/done_image.png",
                                                height: 18.h,
                                                fit: BoxFit.cover,
                                              ),
                                              SizedBox(
                                                width: 7.w,
                                              ),
                                              Text("Day Number",
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 13.sp,
                                                      fontWeight: kFW400,
                                                      color: Kwhite)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  GlassmorphicContainer(
                                    width: double.infinity,
                                    height: MediaQuery.of(context).size.height /
                                        4.7,
                                    // height: MediaQuery.of(context).size.height / 1.5,
                                    margin: EdgeInsets.only(top: 25.h),
                                    borderRadius: 10,
                                    blur: 20,
                                    alignment: Alignment.bottomCenter,
                                    border: 0.8,
                                    linearGradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Color(0xFFffffff).withOpacity(0.1),
                                          Color(0xFFFFFFFF).withOpacity(0.05),
                                        ],
                                        stops: [
                                          0.1,
                                          1,
                                        ]),
                                    borderGradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xFFffffff).withOpacity(0.5),
                                        Color((0xFFFFFFFF)).withOpacity(0.5),
                                      ],
                                    ),
                                    child: Container(
                                      //  color: Kwhite,
                                      margin: EdgeInsets.all(10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          //Explore the cosmos with our daily astrology card. Your guide to the stars awaits! Discover what the universe holds for you today.

                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                  dashController.allPlans[0]
                                                              ["actualPrice"]
                                                          .toString() +
                                                      "/" +
                                                      dashController.allPlans[0]
                                                          ["validity"],

                                                  //"₹569/lifetime",
                                                  textAlign: TextAlign.left,
                                                  style: GoogleFonts.poppins(
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                      fontSize: kTwelveFont,
                                                      fontWeight: kFW500,
                                                      color: KRed)),
                                            ],
                                          ),
                                          SizedBox(height: 10.h),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                  dashController.allPlans[0]
                                                              ["offerPrice"]
                                                          .toString() +
                                                      "/" +
                                                      dashController.allPlans[0]
                                                          ["validity"],

                                                  //"₹569/lifetime",
                                                  style: GoogleFonts
                                                      .dmSerifDisplay(
                                                    fontSize: kTwentyFont,
                                                    fontWeight: kFW500,
                                                    color: Kwhite,
                                                  )),
                                            ],
                                          ),
                                          SizedBox(height: 10.h),
                                          Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text("Get in mobile",
                                                    style: GoogleFonts
                                                        .dmSerifDisplay(
                                                      fontSize: kTwelveFont,
                                                      fontWeight: kFW500,
                                                      color: Kwhite,
                                                    )),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 10.h),
                                          Row(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                    color: KRed,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30)),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Image.asset(
                                                      "assets/images/tag_image.png",
                                                      height: 18.h,
                                                      fit: BoxFit.cover,
                                                    ),
                                                    SizedBox(width: 8.w),
                                                    Text(
                                                        "${dashController.allPlans[0]["discountPercentage"]}% off on card",
                                                        //"10% off on card",
                                                        style: GoogleFonts
                                                            .dmSerifDisplay(
                                                          fontSize:
                                                              kFourteenFont,
                                                          fontWeight: kFW400,
                                                          color: Kwhite,
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            :
                            // for card and mobile
                            authcontroller.selectedPlan == "cardandmobile"
                                ? Column(
                                    children: [
                                      GlassmorphicContainer(
                                        width: double.infinity,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                2,
                                        // height: MediaQuery.of(context).size.height / 1.5,
                                        margin: EdgeInsets.only(top: 25.h),
                                        borderRadius: 10,
                                        blur: 20,
                                        alignment: Alignment.bottomCenter,
                                        border: 0.8,
                                        linearGradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              Color(0xFFffffff)
                                                  .withOpacity(0.1),
                                              Color(0xFFFFFFFF)
                                                  .withOpacity(0.05),
                                            ],
                                            stops: [
                                              0.1,
                                              1,
                                            ]),
                                        borderGradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            Color(0xFFffffff).withOpacity(0.5),
                                            Color((0xFFFFFFFF))
                                                .withOpacity(0.5),
                                          ],
                                        ),
                                        child: Container(
                                          //  color: Kwhite,
                                          margin: EdgeInsets.all(10),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              //Explore the cosmos with our daily astrology card. Your guide to the stars awaits! Discover what the universe holds for you today.

                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      authcontroller
                                                                  .selectedPlan ==
                                                              "cardandmobile"
                                                          ? "Card and Mobile"
                                                          : authcontroller
                                                              .selectedPlan
                                                              .value
                                                              .capitalize!,
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize:
                                                                  kEighteenFont,
                                                              fontWeight:
                                                                  kFW500,
                                                              color: Kwhite
                                                                  .withOpacity(
                                                                      0.7))),
                                                ],
                                              ),
                                              Divider(),
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/images/done_image.png",
                                                    height: 18.h,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  SizedBox(
                                                    width: 7.w,
                                                  ),
                                                  Text("Planet Report",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 13.sp,
                                                              fontWeight:
                                                                  kFW400,
                                                              color: Kwhite)),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 3.h,
                                              ),
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/images/done_image.png",
                                                    height: 18.h,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  SizedBox(
                                                    width: 7.w,
                                                  ),
                                                  Text(
                                                      "Personal Characteristics",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 13.sp,
                                                              fontWeight:
                                                                  kFW400,
                                                              color: Kwhite)),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 3.h,
                                              ),
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/images/done_image.png",
                                                    height: 18.h,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  SizedBox(
                                                    width: 7.w,
                                                  ),
                                                  Text("Daily Sun",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 13.sp,
                                                              fontWeight:
                                                                  kFW400,
                                                              color: Kwhite)),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 3.h,
                                              ),
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/images/done_image.png",
                                                    height: 18.h,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  SizedBox(
                                                    width: 7.w,
                                                  ),
                                                  Text("Weekly Sun",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 13.sp,
                                                              fontWeight:
                                                                  kFW400,
                                                              color: Kwhite)),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 3.h,
                                              ),
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/images/done_image.png",
                                                    height: 18.h,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  SizedBox(
                                                    width: 7.w,
                                                  ),
                                                  Text("Yearly",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 13.sp,
                                                              fontWeight:
                                                                  kFW400,
                                                              color: Kwhite)),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 3.h,
                                              ),
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/images/done_image.png",
                                                    height: 18.h,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  SizedBox(
                                                    width: 7.w,
                                                  ),
                                                  Text(" Planet Details",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 13.sp,
                                                              fontWeight:
                                                                  kFW400,
                                                              color: Kwhite)),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 3.h,
                                              ),
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/images/done_image.png",
                                                    height: 18.h,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  SizedBox(
                                                    width: 7.w,
                                                  ),
                                                  Text("Day Number",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 13.sp,
                                                              fontWeight:
                                                                  kFW400,
                                                              color: Kwhite)),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 3.h,
                                              ),
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/images/done_image.png",
                                                    height: 18.h,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  SizedBox(
                                                    width: 7.w,
                                                  ),
                                                  Text("Prediction",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 13.sp,
                                                              fontWeight:
                                                                  kFW400,
                                                              color: Kwhite)),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 3.h,
                                              ),
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/images/done_image.png",
                                                    height: 18.h,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  SizedBox(
                                                    width: 7.w,
                                                  ),
                                                  Text("Horoscope",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 13.sp,
                                                              fontWeight:
                                                                  kFW400,
                                                              color: Kwhite)),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 3.h,
                                              ),
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/images/done_image.png",
                                                    height: 18.h,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  SizedBox(
                                                    width: 7.w,
                                                  ),
                                                  Text("Matching",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 13.sp,
                                                              fontWeight:
                                                                  kFW400,
                                                              color: Kwhite)),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 3.h,
                                              ),
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/images/done_image.png",
                                                    height: 18.h,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  SizedBox(
                                                    width: 7.w,
                                                  ),
                                                  Text("Dashas",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 13.sp,
                                                              fontWeight:
                                                                  kFW400,
                                                              color: Kwhite)),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 3.h,
                                              ),
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/images/done_image.png",
                                                    height: 18.h,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  SizedBox(
                                                    width: 7.w,
                                                  ),
                                                  Text("Dosh",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 13.sp,
                                                              fontWeight:
                                                                  kFW400,
                                                              color: Kwhite)),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 3.h,
                                              ),
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/images/done_image.png",
                                                    height: 18.h,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  SizedBox(
                                                    width: 7.w,
                                                  ),
                                                  Text("Utility",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 13.sp,
                                                              fontWeight:
                                                                  kFW400,
                                                              color: Kwhite)),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 3.h,
                                              ),
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/images/done_image.png",
                                                    height: 18.h,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  SizedBox(
                                                    width: 7.w,
                                                  ),
                                                  Text("Day Number",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 13.sp,
                                                              fontWeight:
                                                                  kFW400,
                                                              color: Kwhite)),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      GlassmorphicContainer(
                                        width: double.infinity,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                4.7,
                                        // height: MediaQuery.of(context).size.height / 1.5,
                                        margin: EdgeInsets.only(top: 25.h),
                                        borderRadius: 10,
                                        blur: 20,
                                        alignment: Alignment.bottomCenter,
                                        border: 0.8,
                                        linearGradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              Color(0xFFffffff)
                                                  .withOpacity(0.1),
                                              Color(0xFFFFFFFF)
                                                  .withOpacity(0.05),
                                            ],
                                            stops: [
                                              0.1,
                                              1,
                                            ]),
                                        borderGradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            Color(0xFFffffff).withOpacity(0.5),
                                            Color((0xFFFFFFFF))
                                                .withOpacity(0.5),
                                          ],
                                        ),
                                        child: Container(
                                          //  color: Kwhite,
                                          margin: EdgeInsets.all(10),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              //Explore the cosmos with our daily astrology card. Your guide to the stars awaits! Discover what the universe holds for you today.

                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      dashController
                                                              .allPlans[1]
                                                                  [
                                                                  "actualPrice"]
                                                              .toString() +
                                                          "/" +
                                                          dashController
                                                                  .allPlans[1]
                                                              ["validity"],

                                                      //"₹1199/lifetime",
                                                      textAlign: TextAlign.left,
                                                      style: GoogleFonts.poppins(
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough,
                                                          fontSize: kTwelveFont,
                                                          fontWeight: kFW500,
                                                          color: KRed)),
                                                ],
                                              ),
                                              SizedBox(height: 10.h),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      dashController.allPlans[1]
                                                                  ["offerPrice"]
                                                              .toString() +
                                                          "/" +
                                                          dashController
                                                                  .allPlans[1]
                                                              ["validity"],

                                                      // "₹1079/lifetime",
                                                      style: GoogleFonts
                                                          .dmSerifDisplay(
                                                        fontSize: kTwentyFont,
                                                        fontWeight: kFW500,
                                                        color: Kwhite,
                                                      )),
                                                ],
                                              ),
                                              SizedBox(height: 10.h),
                                              Container(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                        "Get the premium accesses",
                                                        style: GoogleFonts
                                                            .dmSerifDisplay(
                                                          fontSize: kTwelveFont,
                                                          fontWeight: kFW500,
                                                          color: Kwhite,
                                                        )),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 10.h),
                                              Row(
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.all(10),
                                                    decoration: BoxDecoration(
                                                        color: KRed,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30)),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Image.asset(
                                                          "assets/images/tag_image.png",
                                                          height: 18.h,
                                                          fit: BoxFit.cover,
                                                        ),
                                                        SizedBox(width: 8.w),
                                                        Text(
                                                            "${dashController.allPlans[1]["discountPercentage"]}% off on card",
                                                            //"10% off on card",
                                                            style: GoogleFonts
                                                                .dmSerifDisplay(
                                                              fontSize:
                                                                  kFourteenFont,
                                                              fontWeight:
                                                                  kFW400,
                                                              color: Kwhite,
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : SizedBox(),
                    CustomButton(
                        margin: EdgeInsets.only(top: 36.h),
                        borderRadius: BorderRadius.circular(8.r),
                        Color: Kform_border_twg,
                        textColor: Kwhite,
                        height: 40,
                        width: double.infinity,
                        label: "Buy Now",
                        fontSize: kSixteenFont,
                        fontWeight: kFW700,
                        isLoading: false,
                        onTap: () {
                          Get.toNamed(kShippingAddress);
                        })
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}


// import 'package:flutter/services.dart';
// import 'package:bharatastro/untils/export_file.dart';

// class Pricing extends StatefulWidget {
//   const Pricing({super.key});

//   @override
//   State<Pricing> createState() => _PricingState();
// }

// class _PricingState extends State<Pricing> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           backgroundColor: kAstroBgblue,
//           automaticallyImplyLeading: false,
//           titleSpacing: 0,
//           leading: InkWell(
//             onTap: () {
//               Get.back();
//             },
//             child: Icon(
//               Icons.arrow_back_ios,
//               color: Kwhite,
//               size: 23.sp,
//             ),
//           ),
//           title: Text(
//             "Astro Card",
//             style: GoogleFonts.poppins(
//                 color: Kwhite, fontSize: kTwentyFont, fontWeight: kFW600),
//           )),
//       backgroundColor: kAstroBgblue,
//       body: Container(
//         margin:
//             EdgeInsets.only(top: 16.h, left: 16.w, right: 16.w, bottom: 16.h),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Container(
//                 width: double.infinity,
//                 height: 200.h,
//                 child: Image.asset(
//                   "assets/images/Card Image.png",
//                   fit: BoxFit.cover,
//                 )),
//             SizedBox(
//               height: 20.h,
//             ),
//             SizedBox(
//               width: 200.w,
//               child: Text("GET YOUR DAILY HOROSCOPES WITH JUST A TAP",
//                   maxLines: 3,
//                   overflow: TextOverflow.ellipsis,
//                   textAlign: TextAlign.start,
//                   style: GoogleFonts.dmSerifDisplay(
//                       height: 1.8,
//                       fontSize: kEighteenFont,
//                       fontWeight: kFW400,
//                       color: Kwhite)),
//             ),
//             SizedBox(
//               height: 20.h,
//             ),
//             Container(
//               padding: EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                   border: Border.all(color: kAstro_yellow, width: 1),
//                   borderRadius: BorderRadius.circular(5)),
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       CircleAvatar(
//                           radius: 12,
//                           backgroundColor: kAstro_yellow,
//                           child: Icon(
//                             Icons.done,
//                             color: Kwhite,
//                             size: 18.sp,
//                           )),
//                       SizedBox(
//                         width: 8.w,
//                       ),
//                       Text("Premium Card",
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                           textAlign: TextAlign.start,
//                           style: GoogleFonts.dmSerifDisplay(
//                               fontSize: kEighteenFont,
//                               fontWeight: kFW400,
//                               color: Kwhite)),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 10.h,
//                   ),
//                   Row(
//                     children: [
//                       CircleAvatar(
//                           radius: 12,
//                           backgroundColor: kAstro_yellow,
//                           child: Icon(
//                             Icons.done,
//                             color: Kwhite,
//                             size: 18.sp,
//                           )),
//                       SizedBox(
//                         width: 8.w,
//                       ),
//                       Text("NFC",
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                           textAlign: TextAlign.start,
//                           style: GoogleFonts.dmSerifDisplay(
//                               fontSize: kEighteenFont,
//                               fontWeight: kFW400,
//                               color: Kwhite)),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 10.h,
//                   ),
//                   Row(
//                     children: [
//                       CircleAvatar(
//                           radius: 12,
//                           backgroundColor: kAstro_yellow,
//                           child: Icon(
//                             Icons.done,
//                             color: Kwhite,
//                             size: 18.sp,
//                           )),
//                       SizedBox(
//                         width: 8.w,
//                       ),
//                       Text("Great Design",
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                           textAlign: TextAlign.start,
//                           style: GoogleFonts.dmSerifDisplay(
//                               fontSize: kEighteenFont,
//                               fontWeight: kFW400,
//                               color: Kwhite)),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 10.h,
//                   ),
//                   Row(
//                     children: [
//                       CircleAvatar(
//                           radius: 12,
//                           backgroundColor: kAstro_yellow,
//                           child: Icon(
//                             Icons.done,
//                             color: Kwhite,
//                             size: 18.sp,
//                           )),
//                       SizedBox(
//                         width: 8.w,
//                       ),
//                       Text("Lifetime validity",
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                           textAlign: TextAlign.start,
//                           style: GoogleFonts.dmSerifDisplay(
//                               fontSize: kEighteenFont,
//                               fontWeight: kFW400,
//                               color: Kwhite)),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       CustomButton(
//                           margin: EdgeInsets.only(top: 20.h),
//                           borderRadius: BorderRadius.circular(8.r),
//                           Color: kAstro_yellow,
//                           textColor: KdarkText,
//                           height: 32,
//                           width: 150.w,
//                           label: "Purchase",
//                           fontSize: kFourteenFont,
//                           fontWeight: kFW500,
//                           isLoading: false,
//                           onTap: () {
//                             // Get.toNamed(kPricing);
//                           }),
//                       CustomButtonOutlined(
//                           margin: EdgeInsets.only(top: 20.h),
//                           borderRadius: BorderRadius.circular(8.r),
//                           borderColor: Kwhite,
//                           textColor: Kwhite,
//                           height: 32,
//                           width: 150.w,
//                           label: "Back",
//                           fontSize: kFourteenFont,
//                           fontWeight: kFW500,
//                           isLoading: false,
//                           onTap: () {
//                             Get.back();
//                           })
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 30.h,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
