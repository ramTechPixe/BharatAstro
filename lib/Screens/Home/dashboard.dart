import 'package:flutter/services.dart';
import 'package:bharatastro/untils/export_file.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  DashboardController dashController = Get.put(DashboardController());
  AuthController authcontroller = Get.put(AuthController());
  final con = FlipCardController();
  final con1 = FlipCardController();
  final cong = GestureFlipCardController();
  final cong1 = GestureFlipCardController();
  Map userDetails = {};
  @override
  void initState() {
    setState(() {
      userDetails = UserSimplePreferences.getUserDetails()!;
      dashController.userDetails.value = userDetails ?? {};
    });
    print("object");
    dashController.userfetchAllPlans();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/test_night.png",
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
              margin: EdgeInsets.only(
                  top: 60.h, left: 16.w, right: 16.w, bottom: 16.h),
              child: Obx(
                () => dashController.fetchPlansLoading == true
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Kform_border_twg,
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              dashController.userfetchAllPlans();
                            },
                            child: SizedBox(
                              width: 200.w,
                              child: Text("Hello, Shema",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.dmSerifDisplay(
                                      fontSize: 20.sp,
                                      fontWeight: kFW400,
                                      color: Kwhite)),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text("What would you like to know ?",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.poppins(
                                  fontSize: kFourteenFont,
                                  fontWeight: kFW400,
                                  color: Kwhite)),
                          SizedBox(
                            height: 30.h,
                          ),
                          // Text("Your Astro Card",
                          //     maxLines: 1,
                          //     overflow: TextOverflow.ellipsis,
                          //     textAlign: TextAlign.start,
                          //     style: GoogleFonts.dmSerifDisplay(
                          //         fontSize: kEighteenFont,
                          //         fontWeight: kFW400,
                          //         color: Kwhite)),
                          // SizedBox(
                          //   height: 20.h,
                          // ),
                          GlassmorphicContainer(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height / 1.95,
                            // height: MediaQuery.of(context).size.height / 1.5,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FlipCard(
                                    rotateSide: RotateSide.right,
                                    disableSplashEffect: false,
                                    splashColor: kblack,
                                    onTapFlipping: true,
                                    axis: FlipAxis.vertical,
                                    controller: con,
                                    frontWidget: Center(
                                      child: Container(
                                        // width: 300,
                                        height: 200.h,
                                        child: Image.asset(
                                          "assets/images/Card Image.png",
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    backWidget: Center(
                                      child: Container(
                                          //  width: 300,
                                          height: 200.h,
                                          child: Image.asset(
                                            "assets/images/Card Image.png",
                                            fit: BoxFit.contain,
                                          )),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text("BHARAT ASTROCARD",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.dmSerifDisplay(
                                          fontSize: kEighteenFont,
                                          fontWeight: kFW400,
                                          color: kAstro_yellow)),

                                  //Explore the cosmos with our daily astrology card. Your guide to the stars awaits! Discover what the universe holds for you today.
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                      "Explore the cosmos with our daily astrology card. Your guide to the stars awaits! Discover what the universe holds for you today.",
                                      maxLines: 4,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.poppins(
                                          fontSize: kFourteenFont,
                                          fontWeight: kFW400,
                                          color: Kwhite.withOpacity(0.7))),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomButton(
                                          margin: EdgeInsets.only(top: 20.h),
                                          borderRadius:
                                              BorderRadius.circular(8.r),
                                          Color: kAstro_yellow,
                                          textColor: KdarkText,
                                          height: 32,
                                          width: 150.w,
                                          label: "Buy Now",
                                          fontSize: kFourteenFont,
                                          fontWeight: kFW500,
                                          isLoading: false,
                                          onTap: () {
                                            Get.toNamed(kPurchaseCard);
                                          }),
                                      CustomButtonOutlined(
                                          margin: EdgeInsets.only(top: 20.h),
                                          borderRadius:
                                              BorderRadius.circular(8.r),
                                          borderColor: Kwhite,
                                          textColor: Kwhite,
                                          height: 32,
                                          width: 150.w,
                                          label: "How to use?",
                                          fontSize: kFourteenFont,
                                          fontWeight: kFW500,
                                          isLoading: false,
                                          onTap: () {
                                            authcontroller
                                                .shipmenyetverifyPaymnet(
                                                    authcontroller
                                                        .succesrespons.value);

                                            // Get.back();
                                          })
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
              )),
        ],
      ),
    );
  }
}
