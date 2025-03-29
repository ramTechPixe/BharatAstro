import 'dart:math';

import 'package:flutter/services.dart';
import 'package:bharatastro/untils/export_file.dart';
import 'package:text_3d/text_3d.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expandable_section/expandable_section.dart';

class Pricing extends StatefulWidget {
  const Pricing({super.key});

  @override
  State<Pricing> createState() => _PricingState();
}

class _PricingState extends State<Pricing> {
  AuthController authcontroller = Get.put(AuthController());
  DashboardController dashController = Get.put(DashboardController());
  ExpansionController expcontroller = Get.put(ExpansionController());
  //final   = Get.put(());

  // final ExpansionController controller = Get.put(ExpansionController());
  @override
  void initState() {
    setState(() {
      authcontroller.selectedPlan.value = "card";
      for (int i = 0; i < dashController.allPlans.length; i++) {
        if (dashController.allPlans[i]["planType"] == "Card") {
          setState(() {
            authcontroller.selectedPlanIndex.value = i;
            dashController.selectedPlanAmount.value =
                dashController.allPlans[i]["offerPrice"].toString();
            dashController.selectedPlanType.value =
                dashController.allPlans[i]["planType"];

            dashController.selectedPlanId.value =
                dashController.allPlans[i]["planTypeId"].toString();
          });
          print("object");
        }
      }
      // dashController.selectedPlanAmount.value =
      //     dashController.allPlans[2]["offerPrice"].toString();
      // dashController.selectedPlanType.value =
      //     dashController.allPlans[2]["planType"];

      // dashController.selectedPlanId.value =
      //     dashController.allPlans[2]["planTypeId"].toString();
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kbg_theme_two,
      // backgroundColor:
      //     const Color.fromARGB(255, 118, 143, 143).withOpacity(0.9),
      appBar: AppBar(
          backgroundColor: KbluethemeThick,
          automaticallyImplyLeading: false,
          titleSpacing: 15,
          // leading: InkWell(
          //   onTap: () {
          //     Get.back();
          //   },
          //   child: Icon(
          //     Icons.arrow_back_ios,
          //     color: Kwhite,
          //     size: 22.sp,
          //   ),
          // ),
          title: Text(
            "Pricing",
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
          // Image.asset(
          //   "assets/images/test_night.png",
          //   height: double.infinity,
          //   width: double.infinity,
          //   fit: BoxFit.cover,
          // ),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(16),
              child: Column(
                children: [
                  Obx(
                    () => Container(
                      width: double.infinity,
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.zero,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                expcontroller.isExpanded.value =
                                    !expcontroller.isExpanded.value;

                                expcontroller.isExpandeddash.value = false;
                                expcontroller.isExpandedboth.value = false;
                              });

                              setState(() {
                                authcontroller.selectedPlan.value = "card";
                                // dashController.selectedPlanAmount.value =
                                //     dashController.allPlans[2]["offerPrice"]
                                //         .toString();
                                // dashController.selectedPlanType.value =
                                //     dashController.allPlans[2]["planType"];

                                // dashController.selectedPlanId.value =
                                //     dashController.allPlans[2]["planTypeId"]
                                //         .toString();
                                for (int i = 0;
                                    i < dashController.allPlans.length;
                                    i++) {
                                  if (dashController.allPlans[i]["planType"] ==
                                      "Card") {
                                    setState(() {
                                      authcontroller.selectedPlanIndex.value =
                                          i;
                                      dashController.selectedPlanAmount.value =
                                          dashController.allPlans[i]
                                                  ["offerPrice"]
                                              .toString();
                                      dashController.selectedPlanType.value =
                                          dashController.allPlans[i]
                                              ["planType"];

                                      dashController.selectedPlanId.value =
                                          dashController.allPlans[i]
                                                  ["planTypeId"]
                                              .toString();
                                    });
                                    print("object");
                                  }
                                }
                              });
                              print("object");
                            },
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              width: double.infinity,
                              height: expcontroller.isExpanded.value
                                  ? MediaQuery.of(context).size.height / 1.3
                                  //547.h
                                  // 200
                                  : MediaQuery.of(context).size.height / 8,
                              //120.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.transparent,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Stack(
                                  children: [
                                    Positioned.fill(
                                      child: Image.asset(
                                        expcontroller.isExpanded.value
                                            ? 'assets/images/card_1.png'
                                            : 'assets/images/mincard_1.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned(
                                      // left: 0,
                                      // right: 0,
                                      //  top: 10.h,
                                      // bottom: 0,
                                      child: expcontroller.isExpanded.value
                                          ? Center(
                                              child: Container(
                                                margin: EdgeInsets.only(top: 5),
                                                padding: EdgeInsets.all(20),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        dashController.userDetails[
                                                                    "planType"] ==
                                                                "Card"
                                                            ? Row(
                                                                children: [
                                                                  ClipOval(
                                                                    child: Image
                                                                        .asset(
                                                                      "assets/images/active.png",
                                                                      height:
                                                                          25.h,
                                                                      width:
                                                                          25.w,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 5.w,
                                                                  )
                                                                ],
                                                              )
                                                            : SizedBox(),
                                                        Text("Card",
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            //    textAlign: TextAlign.start,
                                                            maxLines: 2,
                                                            style: GoogleFonts
                                                                .podkova(
                                                                    fontSize:
                                                                        34.sp,
                                                                    fontWeight:
                                                                        kFW600,
                                                                    color:
                                                                        Kwhite)),
                                                        SizedBox(
                                                          width: 7.w,
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .keyboard_arrow_up,
                                                          color: Kwhite,
                                                          size: 30.sp,
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 40.h,
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
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    fontSize:
                                                                        13.sp,
                                                                    fontWeight:
                                                                        kFW400,
                                                                    color:
                                                                        Kwhite)),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 13.h,
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
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    fontSize:
                                                                        13.sp,
                                                                    fontWeight:
                                                                        kFW400,
                                                                    color:
                                                                        Kwhite)),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 13.h,
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
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    fontSize:
                                                                        13.sp,
                                                                    fontWeight:
                                                                        kFW400,
                                                                    color:
                                                                        Kwhite)),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 13.h,
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
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    fontSize:
                                                                        13.sp,
                                                                    fontWeight:
                                                                        kFW400,
                                                                    color:
                                                                        Kwhite)),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 13.h,
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
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    fontSize:
                                                                        13.sp,
                                                                    fontWeight:
                                                                        kFW400,
                                                                    color:
                                                                        Kwhite)),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 13.h,
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
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    fontSize:
                                                                        13.sp,
                                                                    fontWeight:
                                                                        kFW400,
                                                                    color:
                                                                        Kwhite)),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 13.h,
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
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    fontSize:
                                                                        13.sp,
                                                                    fontWeight:
                                                                        kFW400,
                                                                    color:
                                                                        Kwhite)),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 20.h,
                                                    ),

                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                            dashController
                                                                    .allPlans[
                                                                        authcontroller
                                                                            .selectedPlanIndex
                                                                            .value][
                                                                        "actualPrice"]
                                                                    .toString() +
                                                                "/" +
                                                                dashController
                                                                        .allPlans[authcontroller.selectedPlanIndex.value]
                                                                    [
                                                                    "validity"],
                                                            //"₹499/lifetime",
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: GoogleFonts.poppins(
                                                                decoration:
                                                                    TextDecoration
                                                                        .lineThrough,
                                                                fontSize:
                                                                    kTwelveFont,
                                                                fontWeight: kFW500,
                                                                color: KRed)),
                                                      ],
                                                    ),
                                                    SizedBox(height: 10.h),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                            dashController
                                                                    .allPlans[
                                                                        authcontroller
                                                                            .selectedPlanIndex
                                                                            .value]
                                                                        [
                                                                        "offerPrice"]
                                                                    .toString() +
                                                                "/" +
                                                                dashController
                                                                            .allPlans[
                                                                        authcontroller
                                                                            .selectedPlanIndex
                                                                            .value]
                                                                    [
                                                                    "validity"],
                                                            //"₹474/lifetime",
                                                            style: GoogleFonts
                                                                .dmSerifDisplay(
                                                              fontSize:
                                                                  kTwentyFont,
                                                              fontWeight:
                                                                  kFW500,
                                                              color: Kwhite,
                                                            )),
                                                      ],
                                                    ),
                                                    SizedBox(height: 10.h),
                                                    Container(
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                              "Best option for personal",
                                                              style: GoogleFonts
                                                                  .dmSerifDisplay(
                                                                fontSize:
                                                                    kTwelveFont,
                                                                fontWeight:
                                                                    kFW500,
                                                                color: Kwhite,
                                                              )),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(height: 10.h),
                                                    Row(
                                                      children: [
                                                        Container(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10),
                                                          decoration: BoxDecoration(
                                                              color: KRed,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30)),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Image.asset(
                                                                "assets/images/tag_image.png",
                                                                height: 18.h,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                              SizedBox(
                                                                  width: 8.w),
                                                              Text(
                                                                  "${dashController.allPlans[authcontroller.selectedPlanIndex.value]["discountPercentage"]}% off on card",
                                                                  style: GoogleFonts
                                                                      .dmSerifDisplay(
                                                                    fontSize:
                                                                        kFourteenFont,
                                                                    fontWeight:
                                                                        kFW400,
                                                                    color:
                                                                        Kwhite,
                                                                  )),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),

//                                                     Card
// Web
// Card and Web
                                                    dashController.userDetails[
                                                                "planType"] ==
                                                            "Card and Web"
                                                        ? CustomButton(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    top: 36.h),
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    8.r),
                                                            Color:
                                                                Kform_border_twg
                                                                    .withOpacity(
                                                                        0.5),
                                                            textColor: Kwhite,
                                                            height: 40,
                                                            width:
                                                                double.infinity,
                                                            label: "Buy",
                                                            fontSize:
                                                                kSixteenFont,
                                                            fontWeight: kFW700,
                                                            isLoading: false,
                                                            onTap: () {
                                                              Fluttertoast
                                                                  .showToast(
                                                                msg:
                                                                    "Plan Disabled",
                                                                toastLength: Toast
                                                                    .LENGTH_SHORT,
                                                                gravity:
                                                                    ToastGravity
                                                                        .BOTTOM,
                                                                timeInSecForIosWeb:
                                                                    1,
                                                                backgroundColor:
                                                                    KDarkPink_twg,
                                                                textColor:
                                                                    Kwhite,
                                                                fontSize: 16.0,
                                                              );
                                                            })
                                                        : dashController.userDetails[
                                                                    "planType"] ==
                                                                "Card"
                                                            ? CustomButton(
                                                                margin: EdgeInsets.only(
                                                                    top: 36.h),
                                                                borderRadius:
                                                                    BorderRadius.circular(8.r),
                                                                Color: Kform_border_twg.withOpacity(0.5),
                                                                textColor: Kwhite,
                                                                height: 40,
                                                                width: double.infinity,
                                                                label: "Buy",
                                                                fontSize: kSixteenFont,
                                                                fontWeight: kFW700,
                                                                isLoading: false,
                                                                onTap: () {
                                                                  Fluttertoast
                                                                      .showToast(
                                                                    msg:
                                                                        "Plan Disabled",
                                                                    toastLength:
                                                                        Toast
                                                                            .LENGTH_SHORT,
                                                                    gravity:
                                                                        ToastGravity
                                                                            .BOTTOM,
                                                                    timeInSecForIosWeb:
                                                                        1,
                                                                    backgroundColor:
                                                                        KDarkPink_twg,
                                                                    textColor:
                                                                        Kwhite,
                                                                    fontSize:
                                                                        16.0,
                                                                  );
                                                                })
                                                            : CustomButton(
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
                                                                  if (authcontroller
                                                                          .selectedPlan ==
                                                                      "mobile") {
                                                                    var payload =
                                                                        {
                                                                      'paymentAmount': dashController
                                                                          .selectedPlanAmount
                                                                          .value,
                                                                      'planTypeId': dashController
                                                                          .selectedPlanId
                                                                          .value,
                                                                      'planType': dashController
                                                                          .selectedPlanType
                                                                          .value,
                                                                      'validity':
                                                                          "lifetime"
                                                                    };
                                                                    // var payloads = {};
                                                                    // dashController.useCreateOrders(payloads);
                                                                    // ('https://api.bharatastrosage.com/api/payments/savePayment/24?paymentAmount=34&planTypeId=34&planType=cdc&validity=3e'));
                                                                    dashController
                                                                        .savepaymentMobile(
                                                                            payload);
                                                                  } else {
                                                                    Get.toNamed(
                                                                        kShippingAddress);
                                                                  }
                                                                })

                                                    //
                                                  ],
                                                ),
                                              ),
                                            )
                                          : Center(
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  dashController.userDetails[
                                                              "planType"] ==
                                                          "Card"
                                                      ? Row(
                                                          children: [
                                                            ClipOval(
                                                              child:
                                                                  Image.asset(
                                                                "assets/images/active.png",
                                                                height: 25.h,
                                                                width: 25.w,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 5.w,
                                                            )
                                                          ],
                                                        )
                                                      : SizedBox(),
                                                  Text("Card",
                                                      overflow: TextOverflow
                                                          .ellipsis,
                                                      //    textAlign: TextAlign.start,
                                                      maxLines: 2,
                                                      style:
                                                          GoogleFonts.podkova(
                                                              fontSize: 34.sp,
                                                              fontWeight:
                                                                  kFW600,
                                                              color: Kwhite)),
                                                  SizedBox(
                                                    width: 7.w,
                                                  ),
                                                  Icon(
                                                    Icons.keyboard_arrow_down,
                                                    color: Kwhite,
                                                    size: 30.sp,
                                                  )
                                                ],
                                              ),
                                            ),

                                      // Text(
                                      //   "Card",
                                      //   style: TextStyle(
                                      //     fontSize: 20,
                                      //     color: Colors.white,
                                      //     fontWeight: FontWeight.bold,
                                      //   ),
                                      // ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // AnimatedContainer(
                          //   duration: Duration(milliseconds: 300),
                          //   width: double.infinity,
                          //   height: expcontroller.isExpanded.value ? 150 : 0,
                          //   // height: expcontroller.isExpanded.value ? 150 : 0,
                          //   color: Colors.transparent,
                          //   child: expcontroller.isExpanded.value
                          //       ? Center(child: Text("Expanded Content Here"))
                          //       : SizedBox.shrink(),
                          // ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Obx(
                    () => Container(
                      width: double.infinity,
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.zero,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                expcontroller.isExpandeddash.value =
                                    !expcontroller.isExpandeddash.value;
                                expcontroller.isExpanded.value = false;
                                expcontroller.isExpandedboth.value = false;
                              });

                              setState(() {
                                authcontroller.selectedPlan.value = "mobile";
                                for (int i = 0;
                                    i < dashController.allPlans.length;
                                    i++) {
                                  if (dashController.allPlans[i]["planType"] ==
                                      "Web") {
                                    setState(() {
                                      authcontroller.selectedPlanIndex.value =
                                          i;
                                      dashController.selectedPlanAmount.value =
                                          dashController.allPlans[i]
                                                  ["offerPrice"]
                                              .toString();
                                      dashController.selectedPlanType.value =
                                          dashController.allPlans[i]
                                              ["planType"];

                                      dashController.selectedPlanId.value =
                                          dashController.allPlans[i]
                                                  ["planTypeId"]
                                              .toString();
                                    });
                                    print("object");
                                  }
                                }
                                // dashController.selectedPlanAmount.value =
                                //     dashController.allPlans[0]["offerPrice"]
                                //         .toString();
                                // dashController.selectedPlanType.value =
                                //     dashController.allPlans[0]["planType"];
                                // dashController.selectedPlanId.value =
                                //     dashController.allPlans[0]["planTypeId"]
                                //         .toString();
                              });
                              print("object");
                            },
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              width: double.infinity,
                              height: expcontroller.isExpandeddash.value
                                  ? MediaQuery.of(context).size.height / 1.3
                                  //547.h
                                  // 200
                                  : MediaQuery.of(context).size.height / 8,
                              //120.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.transparent,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Stack(
                                  children: [
                                    Positioned.fill(
                                      child: Image.asset(
                                        expcontroller.isExpandeddash.value
                                            ? 'assets/images/card_2.png'
                                            : 'assets/images/mincard_2.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned(
                                      // left: 0,
                                      // right: 0,
                                      //  top: 10.h,
                                      // bottom: 0,
                                      child: expcontroller.isExpandeddash.value
                                          ? Center(
                                              child: Container(
                                                margin: EdgeInsets.only(top: 5),
                                                padding: EdgeInsets.all(20),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        dashController.userDetails[
                                                                    "planType"] ==
                                                                "Web"
                                                            ? Row(
                                                                children: [
                                                                  ClipOval(
                                                                    child: Image
                                                                        .asset(
                                                                      "assets/images/active.png",
                                                                      height:
                                                                          25.h,
                                                                      width:
                                                                          25.w,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 5.w,
                                                                  )
                                                                ],
                                                              )
                                                            : SizedBox(),
                                                        Text("Web",
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            //    textAlign: TextAlign.start,
                                                            maxLines: 2,
                                                            style: GoogleFonts
                                                                .podkova(
                                                                    fontSize:
                                                                        34.sp,
                                                                    fontWeight:
                                                                        kFW600,
                                                                    color:
                                                                        Kwhite)),
                                                        SizedBox(
                                                          width: 7.w,
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .keyboard_arrow_up,
                                                          color: Kwhite,
                                                          size: 30.sp,
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 40.h,
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
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    fontSize:
                                                                        13.sp,
                                                                    fontWeight:
                                                                        kFW400,
                                                                    color:
                                                                        Kwhite)),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 13.h,
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
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    fontSize:
                                                                        13.sp,
                                                                    fontWeight:
                                                                        kFW400,
                                                                    color:
                                                                        Kwhite)),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 13.h,
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
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    fontSize:
                                                                        13.sp,
                                                                    fontWeight:
                                                                        kFW400,
                                                                    color:
                                                                        Kwhite)),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 13.h,
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
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    fontSize:
                                                                        13.sp,
                                                                    fontWeight:
                                                                        kFW400,
                                                                    color:
                                                                        Kwhite)),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 13.h,
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
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    fontSize:
                                                                        13.sp,
                                                                    fontWeight:
                                                                        kFW400,
                                                                    color:
                                                                        Kwhite)),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 13.h,
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
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    fontSize:
                                                                        13.sp,
                                                                    fontWeight:
                                                                        kFW400,
                                                                    color:
                                                                        Kwhite)),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 13.h,
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
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    fontSize:
                                                                        13.sp,
                                                                    fontWeight:
                                                                        kFW400,
                                                                    color:
                                                                        Kwhite)),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 20.h,
                                                    ),

                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                            dashController
                                                                    .allPlans[
                                                                        authcontroller
                                                                            .selectedPlanIndex
                                                                            .value][
                                                                        "actualPrice"]
                                                                    .toString() +
                                                                "/" +
                                                                dashController
                                                                        .allPlans[authcontroller.selectedPlanIndex.value]
                                                                    [
                                                                    "validity"],
                                                            //"₹499/lifetime",
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: GoogleFonts.poppins(
                                                                decoration:
                                                                    TextDecoration
                                                                        .lineThrough,
                                                                fontSize:
                                                                    kTwelveFont,
                                                                fontWeight: kFW500,
                                                                color: KRed)),
                                                      ],
                                                    ),
                                                    SizedBox(height: 10.h),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                            dashController
                                                                    .allPlans[
                                                                        authcontroller
                                                                            .selectedPlanIndex
                                                                            .value]
                                                                        [
                                                                        "offerPrice"]
                                                                    .toString() +
                                                                "/" +
                                                                dashController
                                                                            .allPlans[
                                                                        authcontroller
                                                                            .selectedPlanIndex
                                                                            .value]
                                                                    [
                                                                    "validity"],
                                                            //"₹474/lifetime",
                                                            style: GoogleFonts
                                                                .dmSerifDisplay(
                                                              fontSize:
                                                                  kTwentyFont,
                                                              fontWeight:
                                                                  kFW500,
                                                              color: Kwhite,
                                                            )),
                                                      ],
                                                    ),
                                                    SizedBox(height: 10.h),
                                                    Container(
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text("Get in mobile",
                                                              style: GoogleFonts
                                                                  .dmSerifDisplay(
                                                                fontSize:
                                                                    kTwelveFont,
                                                                fontWeight:
                                                                    kFW500,
                                                                color: Kwhite,
                                                              )),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(height: 10.h),
                                                    Row(
                                                      children: [
                                                        Container(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10),
                                                          decoration: BoxDecoration(
                                                              color: KRed,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30)),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Image.asset(
                                                                "assets/images/tag_image.png",
                                                                height: 18.h,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                              SizedBox(
                                                                  width: 8.w),
                                                              Text(
                                                                  "${dashController.allPlans[authcontroller.selectedPlanIndex.value]["discountPercentage"]}% off on card",
                                                                  style: GoogleFonts
                                                                      .dmSerifDisplay(
                                                                    fontSize:
                                                                        kFourteenFont,
                                                                    fontWeight:
                                                                        kFW400,
                                                                    color:
                                                                        Kwhite,
                                                                  )),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    dashController.userDetails[
                                                                "planType"] ==
                                                            "Card and Web"
                                                        ? CustomButton(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    top: 36.h),
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    8.r),
                                                            Color:
                                                                Kform_border_twg
                                                                    .withOpacity(
                                                                        0.5),
                                                            textColor: Kwhite,
                                                            height: 40,
                                                            width:
                                                                double.infinity,
                                                            label: "Buy",
                                                            fontSize:
                                                                kSixteenFont,
                                                            fontWeight: kFW700,
                                                            isLoading: false,
                                                            onTap: () {
                                                              Fluttertoast
                                                                  .showToast(
                                                                msg:
                                                                    "Plan Disabled",
                                                                toastLength: Toast
                                                                    .LENGTH_SHORT,
                                                                gravity:
                                                                    ToastGravity
                                                                        .BOTTOM,
                                                                timeInSecForIosWeb:
                                                                    1,
                                                                backgroundColor:
                                                                    KDarkPink_twg,
                                                                textColor:
                                                                    Kwhite,
                                                                fontSize: 16.0,
                                                              );
                                                            })
                                                        : dashController.userDetails[
                                                                    "planType"] ==
                                                                "Web"
                                                            ? CustomButton(
                                                                margin: EdgeInsets.only(
                                                                    top: 36.h),
                                                                borderRadius:
                                                                    BorderRadius.circular(8.r),
                                                                Color: Kform_border_twg.withOpacity(0.5),
                                                                textColor: Kwhite,
                                                                height: 40,
                                                                width: double.infinity,
                                                                label: "Buy",
                                                                fontSize: kSixteenFont,
                                                                fontWeight: kFW700,
                                                                isLoading: false,
                                                                onTap: () {
                                                                  Fluttertoast
                                                                      .showToast(
                                                                    msg:
                                                                        "Plan Disabled",
                                                                    toastLength:
                                                                        Toast
                                                                            .LENGTH_SHORT,
                                                                    gravity:
                                                                        ToastGravity
                                                                            .BOTTOM,
                                                                    timeInSecForIosWeb:
                                                                        1,
                                                                    backgroundColor:
                                                                        KDarkPink_twg,
                                                                    textColor:
                                                                        Kwhite,
                                                                    fontSize:
                                                                        16.0,
                                                                  );
                                                                })
                                                            : CustomButton(
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
                                                                  if (authcontroller
                                                                          .selectedPlan ==
                                                                      "mobile") {
                                                                    var payload =
                                                                        {
                                                                      'paymentAmount': dashController
                                                                          .selectedPlanAmount
                                                                          .value,
                                                                      'planTypeId': dashController
                                                                          .selectedPlanId
                                                                          .value,
                                                                      'planType': dashController
                                                                          .selectedPlanType
                                                                          .value,
                                                                      'validity':
                                                                          "lifetime"
                                                                    };
                                                                    // var payloads = {};
                                                                    // dashController.useCreateOrders(payloads);
                                                                    // ('https://api.bharatastrosage.com/api/payments/savePayment/24?paymentAmount=34&planTypeId=34&planType=cdc&validity=3e'));
                                                                    dashController
                                                                        .savepaymentMobile(
                                                                            payload);
                                                                  } else {
                                                                    Get.toNamed(
                                                                        kShippingAddress);
                                                                  }
                                                                })

                                                    //
                                                  ],
                                                ),
                                              ),
                                            )
                                          : Center(
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  dashController.userDetails[
                                                              "planType"] ==
                                                          "Web"
                                                      ? Row(
                                                          children: [
                                                            ClipOval(
                                                              child:
                                                                  Image.asset(
                                                                "assets/images/active.png",
                                                                height: 25.h,
                                                                width: 25.w,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 5.w,
                                                            )
                                                          ],
                                                        )
                                                      : SizedBox(),
                                                  Text("Web",
                                                      overflow: TextOverflow
                                                          .ellipsis,
                                                      //    textAlign: TextAlign.start,
                                                      maxLines: 2,
                                                      style:
                                                          GoogleFonts.podkova(
                                                              fontSize: 34.sp,
                                                              fontWeight:
                                                                  kFW600,
                                                              color: Kwhite)),
                                                  SizedBox(
                                                    width: 7.w,
                                                  ),
                                                  Icon(
                                                    Icons.keyboard_arrow_down,
                                                    color: Kwhite,
                                                    size: 30.sp,
                                                  )
                                                ],
                                              ),
                                            ),

                                      // Text(
                                      //   "Card",
                                      //   style: TextStyle(
                                      //     fontSize: 20,
                                      //     color: Colors.white,
                                      //     fontWeight: FontWeight.bold,
                                      //   ),
                                      // ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // AnimatedContainer(
                          //   duration: Duration(milliseconds: 300),
                          //   width: double.infinity,
                          //   height: expcontroller.isExpanded.value ? 150 : 0,
                          //   // height: expcontroller.isExpanded.value ? 150 : 0,
                          //   color: Colors.transparent,
                          //   child: expcontroller.isExpanded.value
                          //       ? Center(child: Text("Expanded Content Here"))
                          //       : SizedBox.shrink(),
                          // ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Obx(
                    () => Container(
                      width: double.infinity,
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.zero,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                expcontroller.isExpandedboth.value =
                                    !expcontroller.isExpandedboth.value;
                                expcontroller.isExpanded.value = false;
                                expcontroller.isExpandeddash.value = false;
                              });

                              setState(() {
                                authcontroller.selectedPlan.value =
                                    "cardandmobile";
                                for (int i = 0;
                                    i < dashController.allPlans.length;
                                    i++) {
                                  if (dashController.allPlans[i]["planType"] ==
                                      "Card and Web") {
                                    setState(() {
                                      authcontroller.selectedPlanIndex.value =
                                          i;
                                      dashController.selectedPlanAmount.value =
                                          dashController.allPlans[i]
                                                  ["offerPrice"]
                                              .toString();
                                      dashController.selectedPlanType.value =
                                          dashController.allPlans[i]
                                              ["planType"];

                                      dashController.selectedPlanId.value =
                                          dashController.allPlans[i]
                                                  ["planTypeId"]
                                              .toString();
                                    });
                                    print("object");
                                  }
                                }
                                // dashController.selectedPlanAmount.value =
                                //     dashController.allPlans[1]["offerPrice"]
                                //         .toString();
                                // dashController.selectedPlanType.value =
                                //     dashController.allPlans[1]["planType"];
                                // dashController.selectedPlanId.value =
                                //     dashController.allPlans[1]["planTypeId"]
                                //         .toString();
                              });
                              print("object");
                            },
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              width: double.infinity,
                              height: expcontroller.isExpandedboth.value
                                  ? MediaQuery.of(context).size.height
                                  // ? MediaQuery.of(context).size.height / 1.3
                                  //547.h
                                  // 200
                                  : MediaQuery.of(context).size.height / 8,
                              //120.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.transparent,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Stack(
                                  children: [
                                    Positioned.fill(
                                      child: Image.asset(
                                        expcontroller.isExpandedboth.value
                                            ? 'assets/images/card_3.png'
                                            : 'assets/images/minicard_3.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned(
                                      // left: 0,
                                      // right: 0,
                                      //  top: 10.h,
                                      // bottom: 0,
                                      child: expcontroller.isExpandedboth.value
                                          ? Center(
                                              child: Container(
                                                margin: EdgeInsets.only(top: 5),
                                                padding: EdgeInsets.all(20),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        dashController.userDetails[
                                                                    "planType"] ==
                                                                "Card and Web"
                                                            ? Row(
                                                                children: [
                                                                  ClipOval(
                                                                    child: Image
                                                                        .asset(
                                                                      "assets/images/active.png",
                                                                      height:
                                                                          25.h,
                                                                      width:
                                                                          25.w,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 5.w,
                                                                  )
                                                                ],
                                                              )
                                                            : SizedBox(),
                                                        Container(
                                                          width: 200.w,
                                                          child: Text(
                                                              "Card & Web",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              //    textAlign: TextAlign.start,
                                                              maxLines: 2,
                                                              style: GoogleFonts
                                                                  .podkova(
                                                                      fontSize:
                                                                          33.sp,
                                                                      fontWeight:
                                                                          kFW600,
                                                                      color:
                                                                          Kwhite)),
                                                        ),
                                                        SizedBox(
                                                          width: 7.w,
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .keyboard_arrow_up,
                                                          color: Kwhite,
                                                          size: 30.sp,
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 20.h,
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
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    fontSize:
                                                                        13.sp,
                                                                    fontWeight:
                                                                        kFW400,
                                                                    color:
                                                                        Kwhite)),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10.h,
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
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    fontSize:
                                                                        13.sp,
                                                                    fontWeight:
                                                                        kFW400,
                                                                    color:
                                                                        Kwhite)),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10.h,
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
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    fontSize:
                                                                        13.sp,
                                                                    fontWeight:
                                                                        kFW400,
                                                                    color:
                                                                        Kwhite)),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10.h,
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
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    fontSize:
                                                                        13.sp,
                                                                    fontWeight:
                                                                        kFW400,
                                                                    color:
                                                                        Kwhite)),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10.h,
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
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    fontSize:
                                                                        13.sp,
                                                                    fontWeight:
                                                                        kFW400,
                                                                    color:
                                                                        Kwhite)),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10.h,
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
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    fontSize:
                                                                        13.sp,
                                                                    fontWeight:
                                                                        kFW400,
                                                                    color:
                                                                        Kwhite)),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10.h,
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
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    fontSize:
                                                                        13.sp,
                                                                    fontWeight:
                                                                        kFW400,
                                                                    color:
                                                                        Kwhite)),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10.h,
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
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    fontSize:
                                                                        13.sp,
                                                                    fontWeight:
                                                                        kFW400,
                                                                    color:
                                                                        Kwhite)),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10.h,
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
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    fontSize:
                                                                        13.sp,
                                                                    fontWeight:
                                                                        kFW400,
                                                                    color:
                                                                        Kwhite)),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10.h,
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
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    fontSize:
                                                                        13.sp,
                                                                    fontWeight:
                                                                        kFW400,
                                                                    color:
                                                                        Kwhite)),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10.h,
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
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    fontSize:
                                                                        13.sp,
                                                                    fontWeight:
                                                                        kFW400,
                                                                    color:
                                                                        Kwhite)),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10.h,
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
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    fontSize:
                                                                        13.sp,
                                                                    fontWeight:
                                                                        kFW400,
                                                                    color:
                                                                        Kwhite)),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10.h,
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
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    fontSize:
                                                                        13.sp,
                                                                    fontWeight:
                                                                        kFW400,
                                                                    color:
                                                                        Kwhite)),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10.h,
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
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    fontSize:
                                                                        13.sp,
                                                                    fontWeight:
                                                                        kFW400,
                                                                    color:
                                                                        Kwhite)),
                                                      ],
                                                    ),

                                                    SizedBox(
                                                      height: 15.h,
                                                    ),

                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                            dashController
                                                                    .allPlans[
                                                                        authcontroller
                                                                            .selectedPlanIndex
                                                                            .value][
                                                                        "actualPrice"]
                                                                    .toString() +
                                                                "/" +
                                                                dashController
                                                                        .allPlans[authcontroller.selectedPlanIndex.value]
                                                                    [
                                                                    "validity"],
                                                            //"₹499/lifetime",
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: GoogleFonts.poppins(
                                                                decoration:
                                                                    TextDecoration
                                                                        .lineThrough,
                                                                fontSize:
                                                                    kTwelveFont,
                                                                fontWeight: kFW500,
                                                                color: KRed)),
                                                      ],
                                                    ),
                                                    SizedBox(height: 10.h),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                            dashController
                                                                    .allPlans[
                                                                        authcontroller
                                                                            .selectedPlanIndex
                                                                            .value]
                                                                        [
                                                                        "offerPrice"]
                                                                    .toString() +
                                                                "/" +
                                                                dashController
                                                                            .allPlans[
                                                                        authcontroller
                                                                            .selectedPlanIndex
                                                                            .value]
                                                                    [
                                                                    "validity"],
                                                            //"₹474/lifetime",
                                                            style: GoogleFonts
                                                                .dmSerifDisplay(
                                                              fontSize:
                                                                  kTwentyFont,
                                                              fontWeight:
                                                                  kFW500,
                                                              color: Kwhite,
                                                            )),
                                                      ],
                                                    ),
                                                    SizedBox(height: 10.h),
                                                    Container(
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                              "Get premium accesses",
                                                              style: GoogleFonts
                                                                  .dmSerifDisplay(
                                                                fontSize:
                                                                    kTwelveFont,
                                                                fontWeight:
                                                                    kFW500,
                                                                color: Kwhite,
                                                              )),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(height: 10.h),
                                                    Row(
                                                      children: [
                                                        Container(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10),
                                                          decoration: BoxDecoration(
                                                              color: KRed,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30)),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Image.asset(
                                                                "assets/images/tag_image.png",
                                                                height: 18.h,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                              SizedBox(
                                                                  width: 8.w),
                                                              Text(
                                                                  "${dashController.allPlans[authcontroller.selectedPlanIndex.value]["discountPercentage"]}% off on card",
                                                                  style: GoogleFonts
                                                                      .dmSerifDisplay(
                                                                    fontSize:
                                                                        kFourteenFont,
                                                                    fontWeight:
                                                                        kFW400,
                                                                    color:
                                                                        Kwhite,
                                                                  )),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    dashController.userDetails[
                                                                "planType"] ==
                                                            "Card and Web"
                                                        ? CustomButton(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    top: 36.h),
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    8.r),
                                                            Color:
                                                                Kform_border_twg
                                                                    .withOpacity(
                                                                        0.5),
                                                            textColor: Kwhite,
                                                            height: 40,
                                                            width:
                                                                double.infinity,
                                                            label: "Buy",
                                                            fontSize:
                                                                kSixteenFont,
                                                            fontWeight: kFW700,
                                                            isLoading: false,
                                                            onTap: () {
                                                              Fluttertoast
                                                                  .showToast(
                                                                msg:
                                                                    "Plan Disabled",
                                                                toastLength: Toast
                                                                    .LENGTH_SHORT,
                                                                gravity:
                                                                    ToastGravity
                                                                        .BOTTOM,
                                                                timeInSecForIosWeb:
                                                                    1,
                                                                backgroundColor:
                                                                    KDarkPink_twg,
                                                                textColor:
                                                                    Kwhite,
                                                                fontSize: 16.0,
                                                              );
                                                            })
                                                        : CustomButton(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    top: 30.h),
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    8.r),
                                                            Color:
                                                                Kform_border_twg,
                                                            textColor: Kwhite,
                                                            height: 40,
                                                            width:
                                                                double.infinity,
                                                            label: "Buy Now",
                                                            fontSize:
                                                                kSixteenFont,
                                                            fontWeight: kFW700,
                                                            isLoading: false,
                                                            onTap: () {
                                                              if (authcontroller
                                                                      .selectedPlan ==
                                                                  "mobile") {
                                                                var payload = {
                                                                  'paymentAmount':
                                                                      dashController
                                                                          .selectedPlanAmount
                                                                          .value,
                                                                  'planTypeId':
                                                                      dashController
                                                                          .selectedPlanId
                                                                          .value,
                                                                  'planType':
                                                                      dashController
                                                                          .selectedPlanType
                                                                          .value,
                                                                  'validity':
                                                                      "lifetime"
                                                                };
                                                                // var payloads = {};
                                                                // dashController.useCreateOrders(payloads);
                                                                // ('https://api.bharatastrosage.com/api/payments/savePayment/24?paymentAmount=34&planTypeId=34&planType=cdc&validity=3e'));
                                                                dashController
                                                                    .savepaymentMobile(
                                                                        payload);
                                                              } else {
                                                                Get.toNamed(
                                                                    kShippingAddress);
                                                              }
                                                            })

                                                    //
                                                  ],
                                                ),
                                              ),
                                            )
                                          : Center(
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  dashController.userDetails[
                                                              "planType"] ==
                                                          "Card and Web"
                                                      ? Row(
                                                          children: [
                                                            ClipOval(
                                                              child:
                                                                  Image.asset(
                                                                "assets/images/active.png",
                                                                height: 25.h,
                                                                width: 25.w,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 5.w,
                                                            )
                                                          ],
                                                        )
                                                      : SizedBox(),
                                                  Text("Card &Web",
                                                      overflow: TextOverflow
                                                          .ellipsis,
                                                      //    textAlign: TextAlign.start,
                                                      maxLines: 2,
                                                      style:
                                                          GoogleFonts.podkova(
                                                              fontSize: 33.sp,
                                                              fontWeight:
                                                                  kFW600,
                                                              color: Kwhite)),
                                                  SizedBox(
                                                    width: 7.w,
                                                  ),
                                                  Icon(
                                                    Icons.keyboard_arrow_down,
                                                    color: Kwhite,
                                                    size: 30.sp,
                                                  )
                                                ],
                                              ),
                                            ),

                                      // Text(
                                      //   "Card",
                                      //   style: TextStyle(
                                      //     fontSize: 20,
                                      //     color: Colors.white,
                                      //     fontWeight: FontWeight.bold,
                                      //   ),
                                      // ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // AnimatedContainer(
                          //   duration: Duration(milliseconds: 300),
                          //   width: double.infinity,
                          //   height: expcontroller.isExpanded.value ? 150 : 0,
                          //   // height: expcontroller.isExpanded.value ? 150 : 0,
                          //   color: Colors.transparent,
                          //   child: expcontroller.isExpanded.value
                          //       ? Center(child: Text("Expanded Content Here"))
                          //       : SizedBox.shrink(),
                          // ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  // Obx(
                  //   () => Container(
                  //     width: double.infinity, // Ensure full width
                  //     padding: EdgeInsets.zero, // Remove extra padding
                  //     margin: EdgeInsets.zero, // Remove extra margin
                  //     child: ExpansionTileCard(
                  //       finalPadding: EdgeInsets.zero, // Ensure no padding
                  //       contentPadding:
                  //           EdgeInsets.zero, // Remove default content padding
                  //       baseColor: Colors.transparent,
                  //       expandedColor: Colors.transparent,
                  //       elevation: 0,
                  //       key: expcontroller.cardKey,
                  //       initiallyExpanded: false,

                  //       /// **Remove Default Expansion Icon & Its Padding**
                  //       trailing: SizedBox.shrink(),
                  //       expandedTextColor:
                  //           Colors.transparent, // Hide extra expansion text
                  //       shadowColor:
                  //           Colors.transparent, // Remove shadow if any
                  //       borderRadius: BorderRadius.zero, // Remove rounding

                  //       /// **Title with Changing Image**
                  //       title: SizedBox(
                  //         width: double.infinity, // Ensure full width
                  //         height: expcontroller.isExpanded.value
                  //             ? 200
                  //             : 50, // Set height to prevent overflow issues
                  //         child: Stack(
                  //           children: [
                  //             Positioned.fill(
                  //               child: Image.asset(
                  //                 expcontroller.isExpanded.value
                  //                     ? 'assets/images/card_1.png' // Expanded image
                  //                     : 'assets/images/mincard_1.png', // Collapsed image
                  //                 fit: BoxFit.cover,
                  //                 height: expcontroller.isExpanded.value
                  //                     ? 200
                  //                     : 50,
                  //               ),
                  //             ),
                  //             Positioned(
                  //               left: 16,
                  //               top: 16,
                  //               child: Text(
                  //                 "Card",
                  //                 style: TextStyle(
                  //                   fontSize: 20,
                  //                   color: Colors.white,
                  //                   fontWeight: FontWeight.bold,
                  //                 ),
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),

                  //       /// **Track Expansion State**
                  //       onExpansionChanged: (expanded) {
                  //         expcontroller.isExpanded.value = expanded;
                  //       },
                  //     ),
                  //   ),
                  // ),

                  // Obx(
                  //   () => Container(
                  //     width: double.infinity, // Ensure full width
                  //     padding: EdgeInsets.zero, // Remove extra padding
                  //     margin: EdgeInsets.zero, // Remove extra margin
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius
                  //           .zero, // Remove border rounding if any
                  //     ),
                  //     child: ExpansionTileCard(
                  //       finalPadding: EdgeInsets.zero, // Ensure no padding
                  //       contentPadding:
                  //           EdgeInsets.zero, // Remove default content padding
                  //       baseColor: Colors.transparent,
                  //       expandedColor: Colors.transparent,
                  //       elevation: 0,
                  //       key: expcontroller.cardKey,
                  //       initiallyExpanded: false,

                  //       /// **Remove Default Expansion Icon**
                  //       trailing: SizedBox.shrink(),

                  //       /// **Title with Changing Image**
                  //       title: SizedBox(
                  //         width: double
                  //             .infinity, // Ensure the image stretches full width
                  //         height:
                  //             200, // Set height to prevent overflow issues
                  //         child: Stack(
                  //           children: [
                  //             Positioned.fill(
                  //               child: Image.asset(
                  //                 expcontroller.isExpanded.value
                  //                     ? 'assets/images/card_1.png' // Expanded image
                  //                     : 'assets/images/mincard_1.png', // Collapsed image
                  //                 fit: BoxFit.cover, // Cover full width
                  //               ),
                  //             ),
                  //             Positioned(
                  //               left: 16,
                  //               top: 16,
                  //               child: Text(
                  //                 "Card",
                  //                 style: TextStyle(
                  //                   fontSize: 20,
                  //                   color: Colors.white,
                  //                   fontWeight: FontWeight.bold,
                  //                 ),
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),

                  //       /// **Track Expansion State**
                  //       onExpansionChanged: (expanded) {
                  //         expcontroller.isExpanded.value = expanded;
                  //       },
                  //     ),
                  //   ),
                  // ),

                  // Obx(
                  //   () => ExpansionTileCard(
                  //     finalPadding: EdgeInsets.zero,
                  //     key: expcontroller.cardKey,
                  //     baseColor: Colors.transparent,
                  //     expandedColor: Colors.transparent,
                  //     elevation: 0,
                  //     initiallyExpanded: false,

                  //     /// **Remove Default Expansion Icon**
                  //     trailing: SizedBox.shrink(),

                  //     /// **Title with Changing Image**
                  //     title: Stack(
                  //       children: [
                  //         Image.asset(
                  //           expcontroller.isExpanded.value
                  //               ? 'assets/images/card_1.png' // Expanded image
                  //               : 'assets/images/mincard_1.png', // Collapsed image
                  //           fit: BoxFit.cover,
                  //           width: double.infinity,
                  //         ),
                  //         Positioned(
                  //           left: 16,
                  //           top: 16,
                  //           child: Text(
                  //             "Card",
                  //             style: TextStyle(
                  //               fontSize: 20,
                  //               color: Colors.white,
                  //               fontWeight: FontWeight.bold,
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     ),

                  //     /// **Children (Expanded Content)**
                  //     // children: <Widget>[
                  //     //   const Divider(thickness: 1.0, height: 1.0),
                  //     //   Padding(
                  //     //     padding: const EdgeInsets.all(16.0),
                  //     //     child: Text(
                  //     //       expcontroller.isExpanded.value
                  //     //           ? "This is expanded data" // Expanded text
                  //     //           : "This is collapsed data", // Collapsed text
                  //     //       style:
                  //     //           TextStyle(fontSize: 16, color: Colors.white),
                  //     //     ),
                  //     //   ),
                  //     // ],

                  //     /// **Track Expansion State**
                  //     onExpansionChanged: (expanded) {
                  //       expcontroller.isExpanded.value = expanded;
                  //     },
                  //   ),
                  // ),
                  // Obx(
                  //   () => ExpansionTileCard(
                  //     finalPadding: EdgeInsets.zero,
                  //     key: expcontroller.cardKey,
                  //     baseColor: Colors.transparent,
                  //     expandedColor: Colors.transparent,
                  //     elevation: 0,
                  //     initiallyExpanded: false,

                  //     /// **Remove Default Expansion Icon**
                  //     trailing: SizedBox.shrink(),

                  //     /// **Title with Changing Image**
                  //     title: Stack(
                  //       children: [
                  //         Image.asset(
                  //           expcontroller.isExpanded.value
                  //               ? 'assets/images/card_1.png' // Expanded image
                  //               : 'assets/images/mincard_1.png', // Collapsed image
                  //           fit: BoxFit.cover,
                  //           width: double.infinity,
                  //         ),
                  //         Positioned(
                  //           left: 16,
                  //           top: 16,
                  //           child: Text(
                  //             "Card",
                  //             style: TextStyle(
                  //               fontSize: 20,
                  //               color: Colors.white,
                  //               fontWeight: FontWeight.bold,
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     ),

                  //     /// **Children (Expanded Content)**
                  //     // children: <Widget>[
                  //     //   const Divider(thickness: 1.0, height: 1.0),
                  //     //   Padding(
                  //     //     padding: const EdgeInsets.all(16.0),
                  //     //     child: Text(
                  //     //       expcontroller.isExpanded.value
                  //     //           ? "This is expanded data" // Expanded text
                  //     //           : "This is collapsed data", // Collapsed text
                  //     //       style:
                  //     //           TextStyle(fontSize: 16, color: Colors.white),
                  //     //     ),
                  //     //   ),
                  //     // ],

                  //     /// **Track Expansion State**
                  //     onExpansionChanged: (expanded) {
                  //       expcontroller.isExpanded.value = expanded;
                  //     },
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(12.0),
                  //   child: Obx(
                  //     () => ExpansionTileCard(
                  //       finalPadding: EdgeInsets.all(0),
                  //       key: expcontroller.cardKey,
                  //       title: Container(
                  //         child: Stack(
                  //           children: [
                  //             Image.asset('assets/images/mincard_1.png'),
                  //             Text(
                  //               "Card",
                  //               style: TextStyle(
                  //                   fontSize: 20,
                  //                   color: Kwhite,
                  //                   fontWeight: FontWeight.bold),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //       children: <Widget>[
                  //         Image.asset(expcontroller.isExpanded.value
                  //             ? "assets/images/card_1.png"
                  //             //'assets/image1.png' // Show when expanded
                  //             : 'assets/images/mincard_1.png'), // Show when collapsed
                  //         const Divider(thickness: 1.0, height: 1.0),
                  //         Padding(
                  //           padding: const EdgeInsets.all(16.0),
                  //           child: Text(
                  //             expcontroller.isExpanded.value
                  //                 ? "This is expanded data" // Expanded text
                  //                 : "This is collapsed data", // Collapsed text
                  //             style: TextStyle(fontSize: 16, color: kblack),
                  //           ),
                  //         ),
                  //       ],
                  //       onExpansionChanged: (expanded) {
                  //         expcontroller.isExpanded.value = expanded;
                  //       },
                  //     ),
                  //   ),
                  // ),

                  // Padding(
                  //   padding: const EdgeInsets.all(12.0),
                  //   child: ExpansionTileCard(
                  //     key: expcontroller.cardKey,
                  //     // leading: const CircleAvatar(child: Text('A')),
                  //     title: Text("Card",
                  //         style: GoogleFonts.podkova(
                  //             fontSize: 36.sp,
                  //             fontWeight: kFW700,
                  //             color: Kwhite)),

                  //     // subtitle: const Text('More details here'),
                  //     children: <Widget>[
                  //       const Divider(thickness: 1.0, height: 1.0),
                  //       const Padding(
                  //         padding: EdgeInsets.all(16.0),
                  //         child: Text(
                  //             "This is a simple expandable card using GetX!"),
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  // SingleChildScrollView(
                  //   scrollDirection: Axis.horizontal,
                  //   child: Row(
                  //     children: [
                  //       InkWell(
                  //         onTap: () {
                  //           setState(() {
                  //             authcontroller.selectedPlan.value = "card";
                  //             // dashController.selectedPlanAmount.value =
                  //             //     dashController.allPlans[2]["offerPrice"]
                  //             //         .toString();
                  //             // dashController.selectedPlanType.value =
                  //             //     dashController.allPlans[2]["planType"];

                  //             // dashController.selectedPlanId.value =
                  //             //     dashController.allPlans[2]["planTypeId"]
                  //             //         .toString();
                  //             for (int i = 0;
                  //                 i < dashController.allPlans.length;
                  //                 i++) {
                  //               if (dashController.allPlans[i]["planType"] ==
                  //                   "Card") {
                  //                 setState(() {
                  //                   authcontroller.selectedPlanIndex.value =
                  //                       i;
                  //                   dashController.selectedPlanAmount.value =
                  //                       dashController.allPlans[i]
                  //                               ["offerPrice"]
                  //                           .toString();
                  //                   dashController.selectedPlanType.value =
                  //                       dashController.allPlans[i]
                  //                           ["planType"];

                  //                   dashController.selectedPlanId.value =
                  //                       dashController.allPlans[i]
                  //                               ["planTypeId"]
                  //                           .toString();
                  //                 });
                  //                 print("object");
                  //               }
                  //             }
                  //           });
                  //           print("object");
                  //         },
                  //         child: GlassmorphicContainer(
                  //             width: MediaQuery.of(context).size.width / 1.3,
                  //             height: MediaQuery.of(context).size.height / 6,
                  //             // height: MediaQuery.of(context).size.height / 1.5,
                  //             borderRadius: 10,
                  //             blur: 20,
                  //             alignment: Alignment.bottomCenter,
                  //             border: 0.8,
                  //             linearGradient: LinearGradient(
                  //                 begin: Alignment.centerLeft,
                  //                 end: Alignment.centerRight,
                  //                 colors: [
                  //                   // Kwhite,
                  //                   Kwhite.withOpacity(0.5),
                  //                   // Kwhite.withOpacity(0.7),
                  //                   // KGradientLightgrey.withOpacity(0.5),
                  //                   KGradientLightgrey.withOpacity(0.5),
                  //                   // Color(0xFFffffff).withOpacity(0.1),
                  //                   // Color(0xFFFFFFFF).withOpacity(0.05),
                  //                 ],
                  //                 stops: [
                  //                   0.1,
                  //                   1,
                  //                 ]),
                  //             borderGradient: LinearGradient(
                  //               begin: Alignment.topLeft,
                  //               end: Alignment.bottomRight,
                  //               colors: [
                  //                 Kbg_theme_two.withOpacity(0.5),
                  //                 KGradientLightgrey.withOpacity(0.5),
                  //               ],
                  //             ),
                  //             child: Container(
                  //                 width:
                  //                     MediaQuery.of(context).size.width / 1.3,
                  //                 height:
                  //                     MediaQuery.of(context).size.height / 6,
                  //                 //  color: Kwhite,
                  //                 //  margin: EdgeInsets.all(10),
                  //                 //  authcontroller.selectedPlan == "cardandmobile"
                  //                 decoration: BoxDecoration(
                  //                     borderRadius: BorderRadius.circular(
                  //                       10,
                  //                     ),
                  //                     border: Border.all(
                  //                         color:
                  //                             authcontroller.selectedPlan ==
                  //                                     "card"
                  //                                 ? KGold
                  //                                 : Colors.transparent,
                  //                         width: 0.8)),
                  //                 child: Row(
                  //                   mainAxisAlignment:
                  //                       MainAxisAlignment.spaceBetween,
                  //                   crossAxisAlignment:
                  //                       CrossAxisAlignment.end,
                  //                   children: [
                  //                     Image.asset(
                  //                       "assets/images/earthOne.png",
                  //                       height: 100.h,
                  //                       // height: double.infinity,
                  //                       // width: double.infinity,
                  //                       fit: BoxFit.cover,
                  //                     ),
                  //                     Stack(
                  //                       children: [
                  //                         Container(
                  //                           margin:
                  //                               EdgeInsets.only(top: 14.h),
                  //                           // margin: EdgeInsets.only(top: 17.h),
                  //                           child: ThreeDText(
                  //                             text: " CARD     ",
                  //                             textStyle: TextStyle(
                  //                                 fontSize: 40,
                  //                                 color:
                  //                                     Kwhite.withOpacity(0.5)
                  //                                 // color: KpinkGradtwo.withOpacity(0.5)
                  //                                 ),
                  //                             depth: 40,
                  //                             style: ThreeDStyle
                  //                                 .perspectiveInset,
                  //                             angle: pi / 6,
                  //                             perspectiveDepth: 15,
                  //                             // perspectiveDepth: 20,
                  //                           ),
                  //                         ),
                  //                         Positioned(
                  //                           // bottom: 40.h,
                  //                           left: 25.w,
                  //                           child: Text(
                  //                             "CARD      ",
                  //                             // "CARD          ",
                  //                             //  "CARD                            ",

                  //                             style:
                  //                                 GoogleFonts.dmSerifDisplay(
                  //                                     fontSize: 28.sp,
                  //                                     // color: Kwhite,
                  //                                     color:
                  //                                         KGradientLightgrey,
                  //                                     fontWeight: kFW400),
                  //                           ),
                  //                         ),
                  //                       ],
                  //                     )
                  //                   ],
                  //                 ))),
                  //       ),

                  //       SizedBox(
                  //         width: 10.w,
                  //       ),

                  //       InkWell(
                  //         onTap: () {
                  //           setState(() {
                  //             authcontroller.selectedPlan.value = "mobile";
                  //             for (int i = 0;
                  //                 i < dashController.allPlans.length;
                  //                 i++) {
                  //               if (dashController.allPlans[i]["planType"] ==
                  //                   "Web") {
                  //                 setState(() {
                  //                   authcontroller.selectedPlanIndex.value =
                  //                       i;
                  //                   dashController.selectedPlanAmount.value =
                  //                       dashController.allPlans[i]
                  //                               ["offerPrice"]
                  //                           .toString();
                  //                   dashController.selectedPlanType.value =
                  //                       dashController.allPlans[i]
                  //                           ["planType"];

                  //                   dashController.selectedPlanId.value =
                  //                       dashController.allPlans[i]
                  //                               ["planTypeId"]
                  //                           .toString();
                  //                 });
                  //                 print("object");
                  //               }
                  //             }
                  //             // dashController.selectedPlanAmount.value =
                  //             //     dashController.allPlans[0]["offerPrice"]
                  //             //         .toString();
                  //             // dashController.selectedPlanType.value =
                  //             //     dashController.allPlans[0]["planType"];
                  //             // dashController.selectedPlanId.value =
                  //             //     dashController.allPlans[0]["planTypeId"]
                  //             //         .toString();
                  //           });
                  //           print("object");
                  //         },
                  //         child: GlassmorphicContainer(
                  //             width: MediaQuery.of(context).size.width / 1.3,
                  //             height: MediaQuery.of(context).size.height / 6,
                  //             // height: MediaQuery.of(context).size.height / 1.5,
                  //             borderRadius: 10,
                  //             blur: 20,
                  //             alignment: Alignment.bottomCenter,
                  //             border: 0.8,
                  //             linearGradient: LinearGradient(
                  //                 begin: Alignment.centerLeft,
                  //                 end: Alignment.centerRight,
                  //                 colors: [
                  //                   // Kwhite,
                  //                   // KBlack_twg.withOpacity(0.1),
                  //                   KBoxShadow,
                  //                   // Kwhite.withOpacity(0.7),
                  //                   // KGradientLightgrey.withOpacity(0.5),
                  //                   KGradientLightgrey.withOpacity(0.5),
                  //                   // Color(0xFFffffff).withOpacity(0.1),
                  //                   // Color(0xFFFFFFFF).withOpacity(0.05),
                  //                 ],
                  //                 stops: [
                  //                   0.1,
                  //                   1,
                  //                 ]),
                  //             borderGradient: LinearGradient(
                  //               begin: Alignment.topLeft,
                  //               end: Alignment.bottomRight,
                  //               colors: [
                  //                 Kbg_theme_two.withOpacity(0.5),
                  //                 KGradientLightgrey.withOpacity(0.5),
                  //               ],
                  //             ),
                  //             child: Container(
                  //                 //  color: Kwhite,
                  //                 //  margin: EdgeInsets.all(10),
                  //                 width:
                  //                     MediaQuery.of(context).size.width / 1.3,
                  //                 height:
                  //                     MediaQuery.of(context).size.height / 6,
                  //                 //  color: Kwhite,
                  //                 //  margin: EdgeInsets.all(10),
                  //                 //  authcontroller.selectedPlan == "cardandmobile"
                  //                 decoration: BoxDecoration(
                  //                     borderRadius: BorderRadius.circular(
                  //                       10,
                  //                     ),
                  //                     border: Border.all(
                  //                         color:
                  //                             authcontroller.selectedPlan ==
                  //                                     "mobile"
                  //                                 ? KGold
                  //                                 : Colors.transparent,
                  //                         width: 0.8)),
                  //                 child: Row(
                  //                   mainAxisAlignment:
                  //                       MainAxisAlignment.spaceBetween,
                  //                   crossAxisAlignment:
                  //                       CrossAxisAlignment.end,
                  //                   children: [
                  //                     Image.asset(
                  //                       "assets/images/earth_two.png",
                  //                       //  "assets/images/earthOne.png",
                  //                       height: 100.h,
                  //                       // height: double.infinity,
                  //                       width: 90.w,
                  //                       fit: BoxFit.cover,
                  //                     ),
                  //                     // RotatedBox(
                  //                     //   quarterTurns: 5,
                  //                     //   // quarterTurns: 5,
                  //                     //   child: Image.asset(
                  //                     //     "assets/images/earth_two.png",
                  //                     //     //  "assets/images/earthOne.png",
                  //                     //     height: 100.h,
                  //                     //     // height: double.infinity,
                  //                     //     // width: double.infinity,
                  //                     //     fit: BoxFit.cover,
                  //                     //   ),
                  //                     // ),
                  //                     Stack(
                  //                       children: [
                  //                         Container(
                  //                           margin:
                  //                               EdgeInsets.only(top: 14.h),
                  //                           // margin: EdgeInsets.only(top: 17.h),
                  //                           child: ThreeDText(
                  //                             text: "MOBILE ",
                  //                             textStyle: TextStyle(
                  //                                 fontSize: 40,
                  //                                 color:
                  //                                     Kwhite.withOpacity(0.5)
                  //                                 // color: KpinkGradtwo.withOpacity(0.5)
                  //                                 ),
                  //                             depth: 40,
                  //                             style: ThreeDStyle
                  //                                 .perspectiveInset,
                  //                             angle: pi / 6,
                  //                             perspectiveDepth: 15,
                  //                             // perspectiveDepth: 20,
                  //                           ),
                  //                         ),
                  //                         Positioned(
                  //                           // bottom: 40.h,
                  //                           left: 25.w,
                  //                           child: Text(
                  //                             "MOBILE",
                  //                             // "CARD          ",
                  //                             //  "CARD                            ",

                  //                             style:
                  //                                 GoogleFonts.dmSerifDisplay(
                  //                                     fontSize: 28.sp,
                  //                                     // color: Kwhite,
                  //                                     color:
                  //                                         KGradientLightgrey,
                  //                                     fontWeight: kFW400),
                  //                           ),
                  //                         ),
                  //                       ],
                  //                     )
                  //                   ],
                  //                 ))),
                  //       ),

                  //       SizedBox(
                  //         width: 10.h,
                  //       ),
                  //       InkWell(
                  //         onTap: () {
                  //           setState(() {
                  //             authcontroller.selectedPlan.value =
                  //                 "cardandmobile";
                  //             for (int i = 0;
                  //                 i < dashController.allPlans.length;
                  //                 i++) {
                  //               if (dashController.allPlans[i]["planType"] ==
                  //                   "Card and Web") {
                  //                 setState(() {
                  //                   authcontroller.selectedPlanIndex.value =
                  //                       i;
                  //                   dashController.selectedPlanAmount.value =
                  //                       dashController.allPlans[i]
                  //                               ["offerPrice"]
                  //                           .toString();
                  //                   dashController.selectedPlanType.value =
                  //                       dashController.allPlans[i]
                  //                           ["planType"];

                  //                   dashController.selectedPlanId.value =
                  //                       dashController.allPlans[i]
                  //                               ["planTypeId"]
                  //                           .toString();
                  //                 });
                  //                 print("object");
                  //               }
                  //             }
                  //             // dashController.selectedPlanAmount.value =
                  //             //     dashController.allPlans[1]["offerPrice"]
                  //             //         .toString();
                  //             // dashController.selectedPlanType.value =
                  //             //     dashController.allPlans[1]["planType"];
                  //             // dashController.selectedPlanId.value =
                  //             //     dashController.allPlans[1]["planTypeId"]
                  //             //         .toString();
                  //           });
                  //           print("object");
                  //         },
                  //         child: GlassmorphicContainer(
                  //             width: MediaQuery.of(context).size.width / 1.3,
                  //             height: MediaQuery.of(context).size.height / 6,
                  //             // height: MediaQuery.of(context).size.height / 1.5,
                  //             borderRadius: 10,
                  //             blur: 20,
                  //             alignment: Alignment.bottomCenter,
                  //             border: 0.8,
                  //             linearGradient: LinearGradient(
                  //                 begin: Alignment.centerLeft,
                  //                 end: Alignment.centerRight,
                  //                 colors: [
                  //                   // Kwhite,
                  //                   // KBlack_twg.withOpacity(0.1),
                  //                   KBoxShadow,
                  //                   // Kwhite.withOpacity(0.7),
                  //                   // KGradientLightgrey.withOpacity(0.5),
                  //                   KGradientLightgrey.withOpacity(0.5),
                  //                   // Color(0xFFffffff).withOpacity(0.1),
                  //                   // Color(0xFFFFFFFF).withOpacity(0.05),
                  //                 ],
                  //                 stops: [
                  //                   0.1,
                  //                   1,
                  //                 ]),
                  //             borderGradient: LinearGradient(
                  //               begin: Alignment.topLeft,
                  //               end: Alignment.bottomRight,
                  //               colors: [
                  //                 Kbg_theme_two.withOpacity(0.5),
                  //                 KGradientLightgrey.withOpacity(0.5),
                  //               ],
                  //             ),
                  //             child: Container(
                  //                 //  color: Kwhite,
                  //                 //  margin: EdgeInsets.all(10),
                  //                 width:
                  //                     MediaQuery.of(context).size.width / 1.3,
                  //                 height:
                  //                     MediaQuery.of(context).size.height / 6,
                  //                 //  color: Kwhite,
                  //                 //  margin: EdgeInsets.all(10),
                  //                 //  authcontroller.selectedPlan == "cardandmobile"
                  //                 decoration: BoxDecoration(
                  //                     borderRadius: BorderRadius.circular(
                  //                       10,
                  //                     ),
                  //                     border: Border.all(
                  //                         color:
                  //                             authcontroller.selectedPlan ==
                  //                                     "cardandmobile"
                  //                                 ? KGold
                  //                                 : Colors.transparent,
                  //                         width: 0.8)),
                  //                 child: Row(
                  //                   crossAxisAlignment:
                  //                       CrossAxisAlignment.end,
                  //                   mainAxisAlignment:
                  //                       MainAxisAlignment.spaceBetween,
                  //                   // crossAxisAlignment: CrossAxisAlignment.start,
                  //                   children: [
                  //                     Image.asset(
                  //                       "assets/images/earth_three.png",
                  //                       //  "assets/images/earthOne.png",
                  //                       height: 100.h,
                  //                       // height: double.infinity,
                  //                       width: 90.w,
                  //                       fit: BoxFit.cover,
                  //                     ),
                  //                     // RotatedBox(
                  //                     //   quarterTurns: 5,
                  //                     //   // quarterTurns: 5,
                  //                     //   child: Image.asset(
                  //                     //     "assets/images/earth_two.png",
                  //                     //     //  "assets/images/earthOne.png",
                  //                     //     height: 100.h,
                  //                     //     // height: double.infinity,
                  //                     //     // width: double.infinity,
                  //                     //     fit: BoxFit.cover,
                  //                     //   ),
                  //                     // ),
                  //                     Column(
                  //                       children: [
                  //                         Stack(
                  //                           children: [
                  //                             Container(
                  //                               margin: EdgeInsets.only(
                  //                                   top: 14.h),
                  //                               // margin: EdgeInsets.only(top: 17.h),
                  //                               child: ThreeDText(
                  //                                 text: "CARD &",
                  //                                 textStyle: TextStyle(
                  //                                     fontSize: 35,
                  //                                     color:
                  //                                         Kwhite.withOpacity(
                  //                                             0.5)
                  //                                     // color: KpinkGradtwo.withOpacity(0.5)
                  //                                     ),
                  //                                 depth: 40,
                  //                                 style: ThreeDStyle
                  //                                     .perspectiveInset,
                  //                                 angle: pi / 6,
                  //                                 perspectiveDepth: 15,
                  //                                 // perspectiveDepth: 20,
                  //                               ),
                  //                             ),
                  //                             Positioned(
                  //                               // bottom: 40.h,
                  //                               left: 13.w,
                  //                               child: Text(
                  //                                 "CARD &",
                  //                                 // "CARD          ",
                  //                                 //  "CARD                            ",

                  //                                 style: GoogleFonts
                  //                                     .dmSerifDisplay(
                  //                                         fontSize: 28.sp,
                  //                                         // color: Kwhite,
                  //                                         color:
                  //                                             KGradientLightgrey,
                  //                                         fontWeight: kFW400),
                  //                               ),
                  //                             ),
                  //                           ],
                  //                         ),
                  //                         Stack(
                  //                           children: [
                  //                             Container(
                  //                               margin: EdgeInsets.only(
                  //                                   top: 12.h),
                  //                               // margin: EdgeInsets.only(top: 17.h),
                  //                               child: ThreeDText(
                  //                                 text: "MOBILE   ",
                  //                                 textStyle: TextStyle(
                  //                                     fontSize: 35.sp,
                  //                                     color:
                  //                                         Kwhite.withOpacity(
                  //                                             0.5)
                  //                                     // color: KpinkGradtwo.withOpacity(0.5)
                  //                                     ),
                  //                                 depth: 40,
                  //                                 style: ThreeDStyle
                  //                                     .perspectiveInset,
                  //                                 angle: pi / 6,
                  //                                 perspectiveDepth: 15,
                  //                                 // perspectiveDepth: 20,
                  //                               ),
                  //                             ),
                  //                             Positioned(
                  //                               // bottom: 40.h,
                  //                               left: 15.w,
                  //                               child: Text(
                  //                                 "MOBILE",
                  //                                 // "CARD          ",
                  //                                 //  "CARD                            ",

                  //                                 style: GoogleFonts
                  //                                     .dmSerifDisplay(
                  //                                         fontSize: 28.sp,
                  //                                         // color: Kwhite,
                  //                                         color:
                  //                                             KGradientLightgrey,
                  //                                         fontWeight: kFW400),
                  //                               ),
                  //                             ),
                  //                           ],
                  //                         ),
                  //                       ],
                  //                     )
                  //                   ],
                  //                 ))),
                  //       ),

                  //       // Image.asset('assets/image1.jpg',
                  //       //     width: 200, height: 200),
                  //       // SizedBox(width: 10),
                  //       // Image.asset('assets/image2.jpg',
                  //       //     width: 200, height: 200),
                  //       // SizedBox(width: 10),
                  //       // Image.asset('assets/image3.jpg',
                  //       //     width: 200, height: 200),
                  //     ],
                  //   ),
                  // ),
                  // // for card
                  // authcontroller.selectedPlan == "card"
                  //     ? Column(
                  //         children: [
                  //           GlassmorphicContainer(
                  //             width: double.infinity,
                  //             height:
                  //                 MediaQuery.of(context).size.height / 3.5,
                  //             // height: MediaQuery.of(context).size.height / 1.5,
                  //             margin: EdgeInsets.only(top: 25.h),
                  //             borderRadius: 10,
                  //             blur: 20,
                  //             alignment: Alignment.bottomCenter,
                  //             border: 0.8,
                  //             linearGradient: LinearGradient(
                  //                 begin: Alignment.topLeft,
                  //                 end: Alignment.bottomRight,
                  //                 colors: [
                  //                   Color(0xFFffffff).withOpacity(0.1),
                  //                   Color(0xFFFFFFFF).withOpacity(0.05),
                  //                 ],
                  //                 stops: [
                  //                   0.1,
                  //                   1,
                  //                 ]),
                  //             borderGradient: LinearGradient(
                  //               begin: Alignment.topLeft,
                  //               end: Alignment.bottomRight,
                  //               colors: [
                  //                 Color(0xFFffffff).withOpacity(0.5),
                  //                 Color((0xFFFFFFFF)).withOpacity(0.5),
                  //               ],
                  //             ),
                  //             child: Container(
                  //               //  color: Kwhite,
                  //               margin: EdgeInsets.all(10),
                  //               child: Column(
                  //                 mainAxisAlignment: MainAxisAlignment.start,
                  //                 crossAxisAlignment:
                  //                     CrossAxisAlignment.start,
                  //                 children: [
                  //                   //Explore the cosmos with our daily astrology card. Your guide to the stars awaits! Discover what the universe holds for you today.

                  //                   Row(
                  //                     mainAxisAlignment:
                  //                         MainAxisAlignment.start,
                  //                     children: [
                  //                       Text(
                  //                           authcontroller.selectedPlan ==
                  //                                   "cardandmobile"
                  //                               ? "Card and Mobile"
                  //                               : authcontroller.selectedPlan
                  //                                   .value.capitalize!,
                  //                           style: GoogleFonts.poppins(
                  //                               fontSize: kEighteenFont,
                  //                               fontWeight: kFW500,
                  //                               color:
                  //                                   Kwhite.withOpacity(0.7))),
                  //                     ],
                  //                   ),
                  //                   Divider(),
                  //                   SizedBox(
                  //                     height: 3.h,
                  //                   ),
                  //                   Row(
                  //                     children: [
                  //                       Image.asset(
                  //                         "assets/images/done_image.png",
                  //                         height: 18.h,
                  //                         fit: BoxFit.cover,
                  //                       ),
                  //                       SizedBox(
                  //                         width: 7.w,
                  //                       ),
                  //                       Text("Planet Report",
                  //                           style: GoogleFonts.poppins(
                  //                               fontSize: 13.sp,
                  //                               fontWeight: kFW400,
                  //                               color: Kwhite)),
                  //                     ],
                  //                   ),
                  //                   SizedBox(
                  //                     height: 3.h,
                  //                   ),
                  //                   Row(
                  //                     children: [
                  //                       Image.asset(
                  //                         "assets/images/done_image.png",
                  //                         height: 18.h,
                  //                         fit: BoxFit.cover,
                  //                       ),
                  //                       SizedBox(
                  //                         width: 7.w,
                  //                       ),
                  //                       Text("Personal Characteristics",
                  //                           style: GoogleFonts.poppins(
                  //                               fontSize: 13.sp,
                  //                               fontWeight: kFW400,
                  //                               color: Kwhite)),
                  //                     ],
                  //                   ),
                  //                   SizedBox(
                  //                     height: 3.h,
                  //                   ),
                  //                   Row(
                  //                     children: [
                  //                       Image.asset(
                  //                         "assets/images/done_image.png",
                  //                         height: 18.h,
                  //                         fit: BoxFit.cover,
                  //                       ),
                  //                       SizedBox(
                  //                         width: 7.w,
                  //                       ),
                  //                       Text("Daily Sun",
                  //                           style: GoogleFonts.poppins(
                  //                               fontSize: 13.sp,
                  //                               fontWeight: kFW400,
                  //                               color: Kwhite)),
                  //                     ],
                  //                   ),
                  //                   SizedBox(
                  //                     height: 3.h,
                  //                   ),
                  //                   Row(
                  //                     children: [
                  //                       Image.asset(
                  //                         "assets/images/done_image.png",
                  //                         height: 18.h,
                  //                         fit: BoxFit.cover,
                  //                       ),
                  //                       SizedBox(
                  //                         width: 7.w,
                  //                       ),
                  //                       Text("Weekly Sun",
                  //                           style: GoogleFonts.poppins(
                  //                               fontSize: 13.sp,
                  //                               fontWeight: kFW400,
                  //                               color: Kwhite)),
                  //                     ],
                  //                   ),
                  //                   SizedBox(
                  //                     height: 3.h,
                  //                   ),
                  //                   Row(
                  //                     children: [
                  //                       Image.asset(
                  //                         "assets/images/done_image.png",
                  //                         height: 18.h,
                  //                         fit: BoxFit.cover,
                  //                       ),
                  //                       SizedBox(
                  //                         width: 7.w,
                  //                       ),
                  //                       Text("Yearly",
                  //                           style: GoogleFonts.poppins(
                  //                               fontSize: 13.sp,
                  //                               fontWeight: kFW400,
                  //                               color: Kwhite)),
                  //                     ],
                  //                   ),
                  //                   SizedBox(
                  //                     height: 3.h,
                  //                   ),
                  //                   Row(
                  //                     children: [
                  //                       Image.asset(
                  //                         "assets/images/done_image.png",
                  //                         height: 18.h,
                  //                         fit: BoxFit.cover,
                  //                       ),
                  //                       SizedBox(
                  //                         width: 7.w,
                  //                       ),
                  //                       Text(" Planet Details",
                  //                           style: GoogleFonts.poppins(
                  //                               fontSize: 13.sp,
                  //                               fontWeight: kFW400,
                  //                               color: Kwhite)),
                  //                     ],
                  //                   ),
                  //                   SizedBox(
                  //                     height: 3.h,
                  //                   ),
                  //                   Row(
                  //                     children: [
                  //                       Image.asset(
                  //                         "assets/images/done_image.png",
                  //                         height: 18.h,
                  //                         fit: BoxFit.cover,
                  //                       ),
                  //                       SizedBox(
                  //                         width: 7.w,
                  //                       ),
                  //                       Text("Day Number",
                  //                           style: GoogleFonts.poppins(
                  //                               fontSize: 13.sp,
                  //                               fontWeight: kFW400,
                  //                               color: Kwhite)),
                  //                     ],
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //           ),
                  //           GlassmorphicContainer(
                  //             width: double.infinity,
                  //             height:
                  //                 MediaQuery.of(context).size.height / 4.7,
                  //             // height: MediaQuery.of(context).size.height / 1.5,
                  //             margin: EdgeInsets.only(top: 25.h),
                  //             borderRadius: 10,
                  //             blur: 20,
                  //             alignment: Alignment.bottomCenter,
                  //             border: 0.8,
                  //             linearGradient: LinearGradient(
                  //                 begin: Alignment.topLeft,
                  //                 end: Alignment.bottomRight,
                  //                 colors: [
                  //                   Color(0xFFffffff).withOpacity(0.1),
                  //                   Color(0xFFFFFFFF).withOpacity(0.05),
                  //                 ],
                  //                 stops: [
                  //                   0.1,
                  //                   1,
                  //                 ]),
                  //             borderGradient: LinearGradient(
                  //               begin: Alignment.topLeft,
                  //               end: Alignment.bottomRight,
                  //               colors: [
                  //                 Color(0xFFffffff).withOpacity(0.5),
                  //                 Color((0xFFFFFFFF)).withOpacity(0.5),
                  //               ],
                  //             ),
                  //             child: Container(
                  //               //  color: Kwhite,
                  //               margin: EdgeInsets.all(10),
                  //               child: Column(
                  //                 mainAxisAlignment: MainAxisAlignment.start,
                  //                 crossAxisAlignment:
                  //                     CrossAxisAlignment.start,
                  //                 children: [
                  //                   //Explore the cosmos with our daily astrology card. Your guide to the stars awaits! Discover what the universe holds for you today.

                  //                   Row(
                  //                     mainAxisAlignment:
                  //                         MainAxisAlignment.start,
                  //                     children: [
                  //                       Text(
                  //                           dashController
                  //                                   .allPlans[authcontroller
                  //                                       .selectedPlanIndex
                  //                                       .value]["actualPrice"]
                  //                                   .toString() +
                  //                               "/" +
                  //                               dashController.allPlans[
                  //                                   authcontroller
                  //                                       .selectedPlanIndex
                  //                                       .value]["validity"],
                  //                           //"₹499/lifetime",
                  //                           textAlign: TextAlign.left,
                  //                           style: GoogleFonts.poppins(
                  //                               decoration: TextDecoration
                  //                                   .lineThrough,
                  //                               fontSize: kTwelveFont,
                  //                               fontWeight: kFW500,
                  //                               color: KRed)),
                  //                     ],
                  //                   ),
                  //                   SizedBox(height: 10.h),
                  //                   Row(
                  //                     mainAxisAlignment:
                  //                         MainAxisAlignment.start,
                  //                     children: [
                  //                       Text(
                  //                           dashController
                  //                                   .allPlans[authcontroller
                  //                                       .selectedPlanIndex
                  //                                       .value]["offerPrice"]
                  //                                   .toString() +
                  //                               "/" +
                  //                               dashController.allPlans[
                  //                                   authcontroller
                  //                                       .selectedPlanIndex
                  //                                       .value]["validity"],
                  //                           //"₹474/lifetime",
                  //                           style: GoogleFonts.dmSerifDisplay(
                  //                             fontSize: kTwentyFont,
                  //                             fontWeight: kFW500,
                  //                             color: Kwhite,
                  //                           )),
                  //                     ],
                  //                   ),
                  //                   SizedBox(height: 10.h),
                  //                   Container(
                  //                     child: Row(
                  //                       mainAxisAlignment:
                  //                           MainAxisAlignment.start,
                  //                       children: [
                  //                         Text("Best option for personal",
                  //                             style:
                  //                                 GoogleFonts.dmSerifDisplay(
                  //                               fontSize: kTwelveFont,
                  //                               fontWeight: kFW500,
                  //                               color: Kwhite,
                  //                             )),
                  //                       ],
                  //                     ),
                  //                   ),
                  //                   SizedBox(height: 10.h),
                  //                   Row(
                  //                     children: [
                  //                       Container(
                  //                         padding: EdgeInsets.all(10),
                  //                         decoration: BoxDecoration(
                  //                             color: KRed,
                  //                             borderRadius:
                  //                                 BorderRadius.circular(30)),
                  //                         child: Row(
                  //                           mainAxisAlignment:
                  //                               MainAxisAlignment.start,
                  //                           children: [
                  //                             Image.asset(
                  //                               "assets/images/tag_image.png",
                  //                               height: 18.h,
                  //                               fit: BoxFit.cover,
                  //                             ),
                  //                             SizedBox(width: 8.w),
                  //                             Text(
                  //                                 "${dashController.allPlans[authcontroller.selectedPlanIndex.value]["discountPercentage"]}% off on card",
                  //                                 style: GoogleFonts
                  //                                     .dmSerifDisplay(
                  //                                   fontSize: kFourteenFont,
                  //                                   fontWeight: kFW400,
                  //                                   color: Kwhite,
                  //                                 )),
                  //                           ],
                  //                         ),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //           ),
                  //         ],
                  //       )
                  //     // for mobile
                  //     : authcontroller.selectedPlan == "mobile"
                  //         ? Column(
                  //             //ramhere
                  //             children: [
                  //               GlassmorphicContainer(
                  //                 width: double.infinity,
                  //                 height: MediaQuery.of(context).size.height /
                  //                     3.5,
                  //                 // height: MediaQuery.of(context).size.height / 1.5,
                  //                 margin: EdgeInsets.only(top: 25.h),
                  //                 borderRadius: 10,
                  //                 blur: 20,
                  //                 alignment: Alignment.bottomCenter,
                  //                 border: 0.8,
                  //                 linearGradient: LinearGradient(
                  //                     begin: Alignment.topLeft,
                  //                     end: Alignment.bottomRight,
                  //                     colors: [
                  //                       Color(0xFFffffff).withOpacity(0.1),
                  //                       Color(0xFFFFFFFF).withOpacity(0.05),
                  //                     ],
                  //                     stops: [
                  //                       0.1,
                  //                       1,
                  //                     ]),
                  //                 borderGradient: LinearGradient(
                  //                   begin: Alignment.topLeft,
                  //                   end: Alignment.bottomRight,
                  //                   colors: [
                  //                     Color(0xFFffffff).withOpacity(0.5),
                  //                     Color((0xFFFFFFFF)).withOpacity(0.5),
                  //                   ],
                  //                 ),
                  //                 child: Container(
                  //                   //  color: Kwhite,
                  //                   margin: EdgeInsets.all(10),
                  //                   child: Column(
                  //                     mainAxisAlignment:
                  //                         MainAxisAlignment.start,
                  //                     crossAxisAlignment:
                  //                         CrossAxisAlignment.start,
                  //                     children: [
                  //                       //Explore the cosmos with our daily astrology card. Your guide to the stars awaits! Discover what the universe holds for you today.

                  //                       Row(
                  //                         mainAxisAlignment:
                  //                             MainAxisAlignment.start,
                  //                         children: [
                  //                           Text(
                  //                               authcontroller.selectedPlan ==
                  //                                       "cardandmobile"
                  //                                   ? "Card and Mobile"
                  //                                   : authcontroller
                  //                                       .selectedPlan
                  //                                       .value
                  //                                       .capitalize!,
                  //                               style: GoogleFonts.poppins(
                  //                                   fontSize: kEighteenFont,
                  //                                   fontWeight: kFW500,
                  //                                   color: Kwhite.withOpacity(
                  //                                       0.7))),
                  //                         ],
                  //                       ),
                  //                       Divider(),
                  //                       SizedBox(
                  //                         height: 3.h,
                  //                       ),
                  //                       Row(
                  //                         children: [
                  //                           Image.asset(
                  //                             "assets/images/done_image.png",
                  //                             height: 18.h,
                  //                             fit: BoxFit.cover,
                  //                           ),
                  //                           SizedBox(
                  //                             width: 7.w,
                  //                           ),
                  //                           Text("Prediction",
                  //                               style: GoogleFonts.poppins(
                  //                                   fontSize: 13.sp,
                  //                                   fontWeight: kFW400,
                  //                                   color: Kwhite)),
                  //                         ],
                  //                       ),
                  //                       SizedBox(
                  //                         height: 3.h,
                  //                       ),
                  //                       Row(
                  //                         children: [
                  //                           Image.asset(
                  //                             "assets/images/done_image.png",
                  //                             height: 18.h,
                  //                             fit: BoxFit.cover,
                  //                           ),
                  //                           SizedBox(
                  //                             width: 7.w,
                  //                           ),
                  //                           Text("Horoscope",
                  //                               style: GoogleFonts.poppins(
                  //                                   fontSize: 13.sp,
                  //                                   fontWeight: kFW400,
                  //                                   color: Kwhite)),
                  //                         ],
                  //                       ),
                  //                       SizedBox(
                  //                         height: 3.h,
                  //                       ),
                  //                       Row(
                  //                         children: [
                  //                           Image.asset(
                  //                             "assets/images/done_image.png",
                  //                             height: 18.h,
                  //                             fit: BoxFit.cover,
                  //                           ),
                  //                           SizedBox(
                  //                             width: 7.w,
                  //                           ),
                  //                           Text("Matching",
                  //                               style: GoogleFonts.poppins(
                  //                                   fontSize: 13.sp,
                  //                                   fontWeight: kFW400,
                  //                                   color: Kwhite)),
                  //                         ],
                  //                       ),
                  //                       SizedBox(
                  //                         height: 3.h,
                  //                       ),
                  //                       Row(
                  //                         children: [
                  //                           Image.asset(
                  //                             "assets/images/done_image.png",
                  //                             height: 18.h,
                  //                             fit: BoxFit.cover,
                  //                           ),
                  //                           SizedBox(
                  //                             width: 7.w,
                  //                           ),
                  //                           Text("Dashas",
                  //                               style: GoogleFonts.poppins(
                  //                                   fontSize: 13.sp,
                  //                                   fontWeight: kFW400,
                  //                                   color: Kwhite)),
                  //                         ],
                  //                       ),
                  //                       SizedBox(
                  //                         height: 3.h,
                  //                       ),
                  //                       Row(
                  //                         children: [
                  //                           Image.asset(
                  //                             "assets/images/done_image.png",
                  //                             height: 18.h,
                  //                             fit: BoxFit.cover,
                  //                           ),
                  //                           SizedBox(
                  //                             width: 7.w,
                  //                           ),
                  //                           Text("Dosh",
                  //                               style: GoogleFonts.poppins(
                  //                                   fontSize: 13.sp,
                  //                                   fontWeight: kFW400,
                  //                                   color: Kwhite)),
                  //                         ],
                  //                       ),
                  //                       SizedBox(
                  //                         height: 3.h,
                  //                       ),
                  //                       Row(
                  //                         children: [
                  //                           Image.asset(
                  //                             "assets/images/done_image.png",
                  //                             height: 18.h,
                  //                             fit: BoxFit.cover,
                  //                           ),
                  //                           SizedBox(
                  //                             width: 7.w,
                  //                           ),
                  //                           Text("Utility",
                  //                               style: GoogleFonts.poppins(
                  //                                   fontSize: 13.sp,
                  //                                   fontWeight: kFW400,
                  //                                   color: Kwhite)),
                  //                         ],
                  //                       ),
                  //                       SizedBox(
                  //                         height: 3.h,
                  //                       ),
                  //                       Row(
                  //                         children: [
                  //                           Image.asset(
                  //                             "assets/images/done_image.png",
                  //                             height: 18.h,
                  //                             fit: BoxFit.cover,
                  //                           ),
                  //                           SizedBox(
                  //                             width: 7.w,
                  //                           ),
                  //                           Text("Day Number",
                  //                               style: GoogleFonts.poppins(
                  //                                   fontSize: 13.sp,
                  //                                   fontWeight: kFW400,
                  //                                   color: Kwhite)),
                  //                         ],
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 ),
                  //               ),
                  //               GlassmorphicContainer(
                  //                 width: double.infinity,
                  //                 height: MediaQuery.of(context).size.height /
                  //                     4.7,
                  //                 // height: MediaQuery.of(context).size.height / 1.5,
                  //                 margin: EdgeInsets.only(top: 25.h),
                  //                 borderRadius: 10,
                  //                 blur: 20,
                  //                 alignment: Alignment.bottomCenter,
                  //                 border: 0.8,
                  //                 linearGradient: LinearGradient(
                  //                     begin: Alignment.topLeft,
                  //                     end: Alignment.bottomRight,
                  //                     colors: [
                  //                       Color(0xFFffffff).withOpacity(0.1),
                  //                       Color(0xFFFFFFFF).withOpacity(0.05),
                  //                     ],
                  //                     stops: [
                  //                       0.1,
                  //                       1,
                  //                     ]),
                  //                 borderGradient: LinearGradient(
                  //                   begin: Alignment.topLeft,
                  //                   end: Alignment.bottomRight,
                  //                   colors: [
                  //                     Color(0xFFffffff).withOpacity(0.5),
                  //                     Color((0xFFFFFFFF)).withOpacity(0.5),
                  //                   ],
                  //                 ),
                  //                 child: Container(
                  //                   //  color: Kwhite,
                  //                   margin: EdgeInsets.all(10),
                  //                   child: Column(
                  //                     mainAxisAlignment:
                  //                         MainAxisAlignment.start,
                  //                     crossAxisAlignment:
                  //                         CrossAxisAlignment.start,
                  //                     children: [
                  //                       //Explore the cosmos with our daily astrology card. Your guide to the stars awaits! Discover what the universe holds for you today.

                  //                       Row(
                  //                         mainAxisAlignment:
                  //                             MainAxisAlignment.start,
                  //                         children: [
                  //                           Text(
                  //                               dashController.allPlans[
                  //                                           authcontroller
                  //                                               .selectedPlanIndex
                  //                                               .value]
                  //                                           ["actualPrice"]
                  //                                       .toString() +
                  //                                   "/" +
                  //                                   dashController.allPlans[
                  //                                           authcontroller
                  //                                               .selectedPlanIndex
                  //                                               .value]
                  //                                       ["validity"],

                  //                               //"₹569/lifetime",
                  //                               textAlign: TextAlign.left,
                  //                               style: GoogleFonts.poppins(
                  //                                   decoration: TextDecoration
                  //                                       .lineThrough,
                  //                                   fontSize: kTwelveFont,
                  //                                   fontWeight: kFW500,
                  //                                   color: KRed)),
                  //                         ],
                  //                       ),
                  //                       SizedBox(height: 10.h),
                  //                       Row(
                  //                         mainAxisAlignment:
                  //                             MainAxisAlignment.start,
                  //                         children: [
                  //                           Text(
                  //                               dashController.allPlans[
                  //                                           authcontroller
                  //                                               .selectedPlanIndex
                  //                                               .value]
                  //                                           ["offerPrice"]
                  //                                       .toString() +
                  //                                   "/" +
                  //                                   dashController.allPlans[
                  //                                           authcontroller
                  //                                               .selectedPlanIndex
                  //                                               .value]
                  //                                       ["validity"],

                  //                               //"₹569/lifetime",
                  //                               style: GoogleFonts
                  //                                   .dmSerifDisplay(
                  //                                 fontSize: kTwentyFont,
                  //                                 fontWeight: kFW500,
                  //                                 color: Kwhite,
                  //                               )),
                  //                         ],
                  //                       ),
                  //                       SizedBox(height: 10.h),
                  //                       Container(
                  //                         child: Row(
                  //                           mainAxisAlignment:
                  //                               MainAxisAlignment.start,
                  //                           children: [
                  //                             Text("Get in mobile",
                  //                                 style: GoogleFonts
                  //                                     .dmSerifDisplay(
                  //                                   fontSize: kTwelveFont,
                  //                                   fontWeight: kFW500,
                  //                                   color: Kwhite,
                  //                                 )),
                  //                           ],
                  //                         ),
                  //                       ),
                  //                       SizedBox(height: 10.h),
                  //                       Row(
                  //                         children: [
                  //                           Container(
                  //                             padding: EdgeInsets.all(10),
                  //                             decoration: BoxDecoration(
                  //                                 color: KRed,
                  //                                 borderRadius:
                  //                                     BorderRadius.circular(
                  //                                         30)),
                  //                             child: Row(
                  //                               mainAxisAlignment:
                  //                                   MainAxisAlignment.start,
                  //                               children: [
                  //                                 Image.asset(
                  //                                   "assets/images/tag_image.png",
                  //                                   height: 18.h,
                  //                                   fit: BoxFit.cover,
                  //                                 ),
                  //                                 SizedBox(width: 8.w),
                  //                                 Text(
                  //                                     "${dashController.allPlans[authcontroller.selectedPlanIndex.value]["discountPercentage"]}% off on card",
                  //                                     //"10% off on card",
                  //                                     style: GoogleFonts
                  //                                         .dmSerifDisplay(
                  //                                       fontSize:
                  //                                           kFourteenFont,
                  //                                       fontWeight: kFW400,
                  //                                       color: Kwhite,
                  //                                     )),
                  //                               ],
                  //                             ),
                  //                           ),
                  //                         ],
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 ),
                  //               ),
                  //             ],
                  //           )
                  //         :
                  //         // for card and mobile
                  //         authcontroller.selectedPlan == "cardandmobile"
                  //             ? Column(
                  //                 children: [
                  //                   GlassmorphicContainer(
                  //                     width: double.infinity,
                  //                     height:
                  //                         MediaQuery.of(context).size.height /
                  //                             2,
                  //                     // height: MediaQuery.of(context).size.height / 1.5,
                  //                     margin: EdgeInsets.only(top: 25.h),
                  //                     borderRadius: 10,
                  //                     blur: 20,
                  //                     alignment: Alignment.bottomCenter,
                  //                     border: 0.8,
                  //                     linearGradient: LinearGradient(
                  //                         begin: Alignment.topLeft,
                  //                         end: Alignment.bottomRight,
                  //                         colors: [
                  //                           Color(0xFFffffff)
                  //                               .withOpacity(0.1),
                  //                           Color(0xFFFFFFFF)
                  //                               .withOpacity(0.05),
                  //                         ],
                  //                         stops: [
                  //                           0.1,
                  //                           1,
                  //                         ]),
                  //                     borderGradient: LinearGradient(
                  //                       begin: Alignment.topLeft,
                  //                       end: Alignment.bottomRight,
                  //                       colors: [
                  //                         Color(0xFFffffff).withOpacity(0.5),
                  //                         Color((0xFFFFFFFF))
                  //                             .withOpacity(0.5),
                  //                       ],
                  //                     ),
                  //                     child: Container(
                  //                       //  color: Kwhite,
                  //                       margin: EdgeInsets.all(10),
                  //                       child: Column(
                  //                         mainAxisAlignment:
                  //                             MainAxisAlignment.start,
                  //                         crossAxisAlignment:
                  //                             CrossAxisAlignment.start,
                  //                         children: [
                  //                           //Explore the cosmos with our daily astrology card. Your guide to the stars awaits! Discover what the universe holds for you today.

                  //                           Row(
                  //                             mainAxisAlignment:
                  //                                 MainAxisAlignment.start,
                  //                             children: [
                  //                               Text(
                  //                                   authcontroller
                  //                                               .selectedPlan ==
                  //                                           "cardandmobile"
                  //                                       ? "Card and Mobile"
                  //                                       : authcontroller
                  //                                           .selectedPlan
                  //                                           .value
                  //                                           .capitalize!,
                  //                                   style:
                  //                                       GoogleFonts.poppins(
                  //                                           fontSize:
                  //                                               kEighteenFont,
                  //                                           fontWeight:
                  //                                               kFW500,
                  //                                           color: Kwhite
                  //                                               .withOpacity(
                  //                                                   0.7))),
                  //                             ],
                  //                           ),
                  //                           Divider(),
                  //                           Row(
                  //                             children: [
                  //                               Image.asset(
                  //                                 "assets/images/done_image.png",
                  //                                 height: 18.h,
                  //                                 fit: BoxFit.cover,
                  //                               ),
                  //                               SizedBox(
                  //                                 width: 7.w,
                  //                               ),
                  //                               Text("Planet Report",
                  //                                   style:
                  //                                       GoogleFonts.poppins(
                  //                                           fontSize: 13.sp,
                  //                                           fontWeight:
                  //                                               kFW400,
                  //                                           color: Kwhite)),
                  //                             ],
                  //                           ),
                  //                           SizedBox(
                  //                             height: 3.h,
                  //                           ),
                  //                           Row(
                  //                             children: [
                  //                               Image.asset(
                  //                                 "assets/images/done_image.png",
                  //                                 height: 18.h,
                  //                                 fit: BoxFit.cover,
                  //                               ),
                  //                               SizedBox(
                  //                                 width: 7.w,
                  //                               ),
                  //                               Text(
                  //                                   "Personal Characteristics",
                  //                                   style:
                  //                                       GoogleFonts.poppins(
                  //                                           fontSize: 13.sp,
                  //                                           fontWeight:
                  //                                               kFW400,
                  //                                           color: Kwhite)),
                  //                             ],
                  //                           ),
                  //                           SizedBox(
                  //                             height: 3.h,
                  //                           ),
                  //                           Row(
                  //                             children: [
                  //                               Image.asset(
                  //                                 "assets/images/done_image.png",
                  //                                 height: 18.h,
                  //                                 fit: BoxFit.cover,
                  //                               ),
                  //                               SizedBox(
                  //                                 width: 7.w,
                  //                               ),
                  //                               Text("Daily Sun",
                  //                                   style:
                  //                                       GoogleFonts.poppins(
                  //                                           fontSize: 13.sp,
                  //                                           fontWeight:
                  //                                               kFW400,
                  //                                           color: Kwhite)),
                  //                             ],
                  //                           ),
                  //                           SizedBox(
                  //                             height: 3.h,
                  //                           ),
                  //                           Row(
                  //                             children: [
                  //                               Image.asset(
                  //                                 "assets/images/done_image.png",
                  //                                 height: 18.h,
                  //                                 fit: BoxFit.cover,
                  //                               ),
                  //                               SizedBox(
                  //                                 width: 7.w,
                  //                               ),
                  //                               Text("Weekly Sun",
                  //                                   style:
                  //                                       GoogleFonts.poppins(
                  //                                           fontSize: 13.sp,
                  //                                           fontWeight:
                  //                                               kFW400,
                  //                                           color: Kwhite)),
                  //                             ],
                  //                           ),
                  //                           SizedBox(
                  //                             height: 3.h,
                  //                           ),
                  //                           Row(
                  //                             children: [
                  //                               Image.asset(
                  //                                 "assets/images/done_image.png",
                  //                                 height: 18.h,
                  //                                 fit: BoxFit.cover,
                  //                               ),
                  //                               SizedBox(
                  //                                 width: 7.w,
                  //                               ),
                  //                               Text("Yearly",
                  //                                   style:
                  //                                       GoogleFonts.poppins(
                  //                                           fontSize: 13.sp,
                  //                                           fontWeight:
                  //                                               kFW400,
                  //                                           color: Kwhite)),
                  //                             ],
                  //                           ),
                  //                           SizedBox(
                  //                             height: 3.h,
                  //                           ),
                  //                           Row(
                  //                             children: [
                  //                               Image.asset(
                  //                                 "assets/images/done_image.png",
                  //                                 height: 18.h,
                  //                                 fit: BoxFit.cover,
                  //                               ),
                  //                               SizedBox(
                  //                                 width: 7.w,
                  //                               ),
                  //                               Text(" Planet Details",
                  //                                   style:
                  //                                       GoogleFonts.poppins(
                  //                                           fontSize: 13.sp,
                  //                                           fontWeight:
                  //                                               kFW400,
                  //                                           color: Kwhite)),
                  //                             ],
                  //                           ),
                  //                           SizedBox(
                  //                             height: 3.h,
                  //                           ),
                  //                           Row(
                  //                             children: [
                  //                               Image.asset(
                  //                                 "assets/images/done_image.png",
                  //                                 height: 18.h,
                  //                                 fit: BoxFit.cover,
                  //                               ),
                  //                               SizedBox(
                  //                                 width: 7.w,
                  //                               ),
                  //                               Text("Day Number",
                  //                                   style:
                  //                                       GoogleFonts.poppins(
                  //                                           fontSize: 13.sp,
                  //                                           fontWeight:
                  //                                               kFW400,
                  //                                           color: Kwhite)),
                  //                             ],
                  //                           ),
                  //                           SizedBox(
                  //                             height: 3.h,
                  //                           ),
                  //                           Row(
                  //                             children: [
                  //                               Image.asset(
                  //                                 "assets/images/done_image.png",
                  //                                 height: 18.h,
                  //                                 fit: BoxFit.cover,
                  //                               ),
                  //                               SizedBox(
                  //                                 width: 7.w,
                  //                               ),
                  //                               Text("Prediction",
                  //                                   style:
                  //                                       GoogleFonts.poppins(
                  //                                           fontSize: 13.sp,
                  //                                           fontWeight:
                  //                                               kFW400,
                  //                                           color: Kwhite)),
                  //                             ],
                  //                           ),
                  //                           SizedBox(
                  //                             height: 3.h,
                  //                           ),
                  //                           Row(
                  //                             children: [
                  //                               Image.asset(
                  //                                 "assets/images/done_image.png",
                  //                                 height: 18.h,
                  //                                 fit: BoxFit.cover,
                  //                               ),
                  //                               SizedBox(
                  //                                 width: 7.w,
                  //                               ),
                  //                               Text("Horoscope",
                  //                                   style:
                  //                                       GoogleFonts.poppins(
                  //                                           fontSize: 13.sp,
                  //                                           fontWeight:
                  //                                               kFW400,
                  //                                           color: Kwhite)),
                  //                             ],
                  //                           ),
                  //                           SizedBox(
                  //                             height: 3.h,
                  //                           ),
                  //                           Row(
                  //                             children: [
                  //                               Image.asset(
                  //                                 "assets/images/done_image.png",
                  //                                 height: 18.h,
                  //                                 fit: BoxFit.cover,
                  //                               ),
                  //                               SizedBox(
                  //                                 width: 7.w,
                  //                               ),
                  //                               Text("Matching",
                  //                                   style:
                  //                                       GoogleFonts.poppins(
                  //                                           fontSize: 13.sp,
                  //                                           fontWeight:
                  //                                               kFW400,
                  //                                           color: Kwhite)),
                  //                             ],
                  //                           ),
                  //                           SizedBox(
                  //                             height: 3.h,
                  //                           ),
                  //                           Row(
                  //                             children: [
                  //                               Image.asset(
                  //                                 "assets/images/done_image.png",
                  //                                 height: 18.h,
                  //                                 fit: BoxFit.cover,
                  //                               ),
                  //                               SizedBox(
                  //                                 width: 7.w,
                  //                               ),
                  //                               Text("Dashas",
                  //                                   style:
                  //                                       GoogleFonts.poppins(
                  //                                           fontSize: 13.sp,
                  //                                           fontWeight:
                  //                                               kFW400,
                  //                                           color: Kwhite)),
                  //                             ],
                  //                           ),
                  //                           SizedBox(
                  //                             height: 3.h,
                  //                           ),
                  //                           Row(
                  //                             children: [
                  //                               Image.asset(
                  //                                 "assets/images/done_image.png",
                  //                                 height: 18.h,
                  //                                 fit: BoxFit.cover,
                  //                               ),
                  //                               SizedBox(
                  //                                 width: 7.w,
                  //                               ),
                  //                               Text("Dosh",
                  //                                   style:
                  //                                       GoogleFonts.poppins(
                  //                                           fontSize: 13.sp,
                  //                                           fontWeight:
                  //                                               kFW400,
                  //                                           color: Kwhite)),
                  //                             ],
                  //                           ),
                  //                           SizedBox(
                  //                             height: 3.h,
                  //                           ),
                  //                           Row(
                  //                             children: [
                  //                               Image.asset(
                  //                                 "assets/images/done_image.png",
                  //                                 height: 18.h,
                  //                                 fit: BoxFit.cover,
                  //                               ),
                  //                               SizedBox(
                  //                                 width: 7.w,
                  //                               ),
                  //                               Text("Utility",
                  //                                   style:
                  //                                       GoogleFonts.poppins(
                  //                                           fontSize: 13.sp,
                  //                                           fontWeight:
                  //                                               kFW400,
                  //                                           color: Kwhite)),
                  //                             ],
                  //                           ),
                  //                           SizedBox(
                  //                             height: 3.h,
                  //                           ),
                  //                           Row(
                  //                             children: [
                  //                               Image.asset(
                  //                                 "assets/images/done_image.png",
                  //                                 height: 18.h,
                  //                                 fit: BoxFit.cover,
                  //                               ),
                  //                               SizedBox(
                  //                                 width: 7.w,
                  //                               ),
                  //                               Text("Day Number",
                  //                                   style:
                  //                                       GoogleFonts.poppins(
                  //                                           fontSize: 13.sp,
                  //                                           fontWeight:
                  //                                               kFW400,
                  //                                           color: Kwhite)),
                  //                             ],
                  //                           ),
                  //                         ],
                  //                       ),
                  //                     ),
                  //                   ),
                  //                   GlassmorphicContainer(
                  //                     width: double.infinity,
                  //                     height:
                  //                         MediaQuery.of(context).size.height /
                  //                             4.7,
                  //                     // height: MediaQuery.of(context).size.height / 1.5,
                  //                     margin: EdgeInsets.only(top: 25.h),
                  //                     borderRadius: 10,
                  //                     blur: 20,
                  //                     alignment: Alignment.bottomCenter,
                  //                     border: 0.8,
                  //                     linearGradient: LinearGradient(
                  //                         begin: Alignment.topLeft,
                  //                         end: Alignment.bottomRight,
                  //                         colors: [
                  //                           Color(0xFFffffff)
                  //                               .withOpacity(0.1),
                  //                           Color(0xFFFFFFFF)
                  //                               .withOpacity(0.05),
                  //                         ],
                  //                         stops: [
                  //                           0.1,
                  //                           1,
                  //                         ]),
                  //                     borderGradient: LinearGradient(
                  //                       begin: Alignment.topLeft,
                  //                       end: Alignment.bottomRight,
                  //                       colors: [
                  //                         Color(0xFFffffff).withOpacity(0.5),
                  //                         Color((0xFFFFFFFF))
                  //                             .withOpacity(0.5),
                  //                       ],
                  //                     ),
                  //                     child: Container(
                  //                       //  color: Kwhite,
                  //                       margin: EdgeInsets.all(10),
                  //                       child: Column(
                  //                         mainAxisAlignment:
                  //                             MainAxisAlignment.start,
                  //                         crossAxisAlignment:
                  //                             CrossAxisAlignment.start,
                  //                         children: [
                  //                           //Explore the cosmos with our daily astrology card. Your guide to the stars awaits! Discover what the universe holds for you today.

                  //                           Row(
                  //                             mainAxisAlignment:
                  //                                 MainAxisAlignment.start,
                  //                             children: [
                  //                               Text(
                  //                                   dashController.allPlans[
                  //                                               authcontroller
                  //                                                   .selectedPlanIndex
                  //                                                   .value][
                  //                                               "actualPrice"]
                  //                                           .toString() +
                  //                                       "/" +
                  //                                       dashController.allPlans[
                  //                                               authcontroller
                  //                                                   .selectedPlanIndex
                  //                                                   .value]
                  //                                           ["validity"],

                  //                                   //"₹1199/lifetime",
                  //                                   textAlign: TextAlign.left,
                  //                                   style: GoogleFonts.poppins(
                  //                                       decoration:
                  //                                           TextDecoration
                  //                                               .lineThrough,
                  //                                       fontSize: kTwelveFont,
                  //                                       fontWeight: kFW500,
                  //                                       color: KRed)),
                  //                             ],
                  //                           ),
                  //                           SizedBox(height: 10.h),
                  //                           Row(
                  //                             mainAxisAlignment:
                  //                                 MainAxisAlignment.start,
                  //                             children: [
                  //                               Text(
                  //                                   dashController.allPlans[
                  //                                               authcontroller
                  //                                                   .selectedPlanIndex
                  //                                                   .value]
                  //                                               ["offerPrice"]
                  //                                           .toString() +
                  //                                       "/" +
                  //                                       dashController
                  //                                                   .allPlans[
                  //                                               authcontroller
                  //                                                   .selectedPlanIndex
                  //                                                   .value]
                  //                                           ["validity"],

                  //                                   // "₹1079/lifetime",
                  //                                   style: GoogleFonts
                  //                                       .dmSerifDisplay(
                  //                                     fontSize: kTwentyFont,
                  //                                     fontWeight: kFW500,
                  //                                     color: Kwhite,
                  //                                   )),
                  //                             ],
                  //                           ),
                  //                           SizedBox(height: 10.h),
                  //                           Container(
                  //                             child: Row(
                  //                               mainAxisAlignment:
                  //                                   MainAxisAlignment.start,
                  //                               children: [
                  //                                 Text(
                  //                                     "Get the premium accesses",
                  //                                     style: GoogleFonts
                  //                                         .dmSerifDisplay(
                  //                                       fontSize: kTwelveFont,
                  //                                       fontWeight: kFW500,
                  //                                       color: Kwhite,
                  //                                     )),
                  //                               ],
                  //                             ),
                  //                           ),
                  //                           SizedBox(height: 10.h),
                  //                           Row(
                  //                             children: [
                  //                               Container(
                  //                                 padding: EdgeInsets.all(10),
                  //                                 decoration: BoxDecoration(
                  //                                     color: KRed,
                  //                                     borderRadius:
                  //                                         BorderRadius
                  //                                             .circular(30)),
                  //                                 child: Row(
                  //                                   mainAxisAlignment:
                  //                                       MainAxisAlignment
                  //                                           .start,
                  //                                   children: [
                  //                                     Image.asset(
                  //                                       "assets/images/tag_image.png",
                  //                                       height: 18.h,
                  //                                       fit: BoxFit.cover,
                  //                                     ),
                  //                                     SizedBox(width: 8.w),
                  //                                     Text(
                  //                                         "${dashController.allPlans[authcontroller.selectedPlanIndex.value]["discountPercentage"]}% off on card",
                  //                                         //"10% off on card",
                  //                                         style: GoogleFonts
                  //                                             .dmSerifDisplay(
                  //                                           fontSize:
                  //                                               kFourteenFont,
                  //                                           fontWeight:
                  //                                               kFW400,
                  //                                           color: Kwhite,
                  //                                         )),
                  //                                   ],
                  //                                 ),
                  //                               ),
                  //                             ],
                  //                           ),
                  //                         ],
                  //                       ),
                  //                     ),
                  //                   ),
                  //                 ],
                  //               )
                  //             : SizedBox(),
                  // CustomButton(
                  //     margin: EdgeInsets.only(top: 36.h),
                  //     borderRadius: BorderRadius.circular(8.r),
                  //     Color: Kform_border_twg,
                  //     textColor: Kwhite,
                  //     height: 40,
                  //     width: double.infinity,
                  //     label: "Buy Now",
                  //     fontSize: kSixteenFont,
                  //     fontWeight: kFW700,
                  //     isLoading: false,
                  //     onTap: () {
                  //       if (authcontroller.selectedPlan == "mobile") {
                  //         var payload = {
                  //           'paymentAmount':
                  //               dashController.selectedPlanAmount.value,
                  //           'planTypeId': dashController.selectedPlanId.value,
                  //           'planType': dashController.selectedPlanType.value,
                  //           'validity': "lifetime"
                  //         };
                  //         // var payloads = {};
                  //         // dashController.useCreateOrders(payloads);
                  //         // ('https://api.bharatastrosage.com/api/payments/savePayment/24?paymentAmount=34&planTypeId=34&planType=cdc&validity=3e'));
                  //         dashController.savepaymentMobile(payload);
                  //       } else {
                  //         Get.toNamed(kShippingAddress);
                  //       }
                  //     })
                ],
              ),
            ),
          ),
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

class ExpansionController extends GetxController {
  final GlobalKey<ExpansionTileCardState> cardKey = GlobalKey();
  var isExpanded = false.obs;
  var isExpandeddash = false.obs;
  var isExpandedboth = false.obs;

  void toggleExpansion() {
    if (isExpanded.value) {
      cardKey.currentState?.collapse();
    } else {
      cardKey.currentState?.expand();
    }
    isExpanded.toggle();
  }

  //
  final GlobalKey<ExpansionTileCardState> dashKey = GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardAndDashKey = GlobalKey();
}
