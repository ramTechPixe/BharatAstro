import 'package:flutter/services.dart';
import 'package:bharatastro/untils/export_file.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  DashboardController dashController = Get.put(DashboardController());
  MahaDashaController mahadashaController = Get.put(MahaDashaController());
  PredictionController prdictionController = Get.put(PredictionController());
  HoroscopeController horosController = Get.put(HoroscopeController());
  UtiltyController utilityController = Get.put(UtiltyController());
  MatchingController matchingController = Get.put(MatchingController());

  DoshController doshController = Get.put(DoshController());
  AuthController authcontroller = Get.put(AuthController());
  List utility = [
    {
      "tile": "Gem Details",
      "image": "assets/images/diamond.png",
      // "count": "20",
      // "price": "200",
      // "buttonName": "price",
      // "route": kDigitalInfluencerScreen
    }, //
    {
      "tile": "Geo Search",
      "image": "assets/images/geo_serch.png",
      // "count": "20",
      // "price": "200",
      // "buttonName": "price",
      // "route": kDigitalInfluencerScreen
    },
    {
      "tile": "Radical Number Details",
      "image": "assets/images/Numbers.png",
      // "count": "20",
      // "price": "200",
      // "buttonName": "price",
      // "route": kDigitalInfluencerScreen
    },
    {
      "tile": "Nakshatra Vastu Details",
      "image": "assets/images/stars.png",
      // "count": "20",
      // "price": "200",
      // "buttonName": "price",
      // "route": kDigitalInfluencerScreen
    },
  ];
  List dosh = [
    {
      "tile": "Mangal Dosh",
      "image": "assets/images/mangal_dosh.png",
      // "count": "20",
      // "price": "200",
      // "buttonName": "price",
      // "route": kDigitalInfluencerScreen
    },
    {
      "tile": "Kaalsarap Dosh",
      "image": "assets/images/kaal_sarp.png",
      // "count": "20",
      // "price": "200",
      // "buttonName": "price",
      // "route": kDigitalInfluencerScreen
    },
    {
      "tile": "mangalik dosh",
      "image": "assets/images/mangal_dosh.png",
      // "count": "20",
      // "price": "200",
      // "buttonName": "price",
      // "route": kDigitalInfluencerScreen
    },
    {
      "tile": "Pitra Dosh",
      "image": "assets/images/char-dahs-main.png",
      // "count": "20",
      // "price": "200",
      // "buttonName": "price",
      // "route": kDigitalInfluencerScreen
    },
    {
      "tile": "papasamay",
      "image": "assets/images/current-mah-full.png",
      // "count": "20",
      // "price": "200",
      // "buttonName": "price",
      // "route": kDigitalInfluencerScreen
    },
    //
  ];
  // List 4
  List dashas = [
    {
      "tile": "Antra Dasha",
      "image": "assets/images/antra_dash.png",
      // "count": "20",
      // "price": "200",
      // "buttonName": "price",
      // "route": kDigitalInfluencerScreen
    },
    {
      "tile": "Mahadasha Prediction",
      "image": "assets/images/maha--predic.png",
      // "count": "20",
      // "price": "200",
      // "buttonName": "price",
      // "route": kDigitalInfluencerScreen
    },
    {
      "tile": "Maha Dasha",
      "image": "assets/images/north_match.png",
      // "count": "20",
      // "price": "200",
      // "buttonName": "price",
      // "route": kDigitalInfluencerScreen
    },
    {
      "tile": "char Dasha Main",
      "image": "assets/images/char-dahs-main.png",
      // "count": "20",
      // "price": "200",
      // "buttonName": "price",
      // "route": kDigitalInfluencerScreen
    },
    {
      "tile": "Current Mahadasha Full",
      "image": "assets/images/current-mah-full.png",
      // "count": "20",
      // "price": "200",
      // "buttonName": "price",
      // "route": kDigitalInfluencerScreen
    },
    {
      "tile": "Char Dasha Current",
      "image": "assets/images/char-das-current.png",
      // "count": "20",
      // "price": "200",
      // "buttonName": "price",
      // "route": kDigitalInfluencerScreen
    },
    {
      "tile": "Paryantar Dasha",
      "image": "assets/images/paryantar_dasha.png",
      // "count": "20",
      // "price": "200",
      // "buttonName": "price",
      // "route": kDigitalInfluencerScreen
    },
    {
      "tile": "current Maha dasha",
      "image": "assets/images/curnt-maha-dasa.png",
      // "count": "20",
      // "price": "200",
      // "buttonName": "price",
      // "route": kDigitalInfluencerScreen
    },
    {
      "tile": "Yogini dasha Main",
      "image": "assets/images/yogini-dasha-main.png",
      // "count": "20",
      // "price": "200",
      // "buttonName": "price",
      // "route": kDigitalInfluencerScreen
    },
    {
      "tile": "Yogini Dahsa sub",
      "image": "assets/images/yog-dasa-sub.png",
      // "count": "20", //
      // "price": "200",
      // "buttonName": "price",
      // "route": kDigitalInfluencerScreen
    },
  ];
  //

  // List 3
  List matching = [
    {
      "tile": "North Match",
      "image": "assets/images/north_match.png",
      // "count": "20",
      // "price": "200",
      // "buttonName": "price",
      // "route": kDigitalInfluencerScreen
    },
    {
      "tile": "North Match with Astro Details",
      "image": "assets/images/north_match_with.png",
      // "count": "20",
      // "price": "200",
      // "buttonName": "price",
      // "route": kDigitalInfluencerScreen
    },
    {
      "tile": "South Match",
      "image": "assets/images/south_match.png",
      // "count": "20",
      // "price": "200",
      // "buttonName": "price",
      // "route": kDigitalInfluencerScreen
    },
    {
      "tile": "South  Match with Astro Details",
      "image": "assets/images/south_match_with.png",
      // "count": "20",
      // "price": "200",
      // "buttonName": "price",
      // "route": kDigitalInfluencerScreen
    },
    {
      "tile": "Dashakoot",
      "image": "assets/images/dashkoot.png",
      // "count": "20",
      // "price": "200",
      // "buttonName": "price",
      // "route": kDigitalInfluencerScreen
    },
    {
      "tile": "Dashakoot with astro",
      "image": "assets/images/dashkoot_with.png",
      // "count": "20",
      // "price": "200",
      // "buttonName": "price",
      // "route": kDigitalInfluencerScreen
    },
    {
      "tile": "aggregate Match",
      "image": "assets/images/aggregate_matching.png",
      // "count": "20",
      // "price": "200",
      // "buttonName": "price",
      // "route": kDigitalInfluencerScreen
    },
    {
      "tile": "Rajju Vedha Details",
      "image": "assets/images/raju_veda.png",
      // "count": "20",
      // "price": "200",
      // "buttonName": "price",
      // "route": kDigitalInfluencerScreen
    },
    // {
    //   "tile": "Rajju Vedha Details",
    //   "image": "assets/images/Planet_details.png",
    //   // "count": "20",
    //   // "price": "200",
    //   // "buttonName": "price",
    //   // "route": kDigitalInfluencerScreen
    // },
    {
      "tile": "Papasamaya Match",
      "image": "assets/images/papasamaya_match.png",
      // "count": "20",
      // "price": "200",
      // "buttonName": "price",
      // "route": kDigitalInfluencerScreen
    },
    {
      "tile": "Nakshatra Match",
      "image": "assets/images/nakashatra_match.png",
      // "count": "20",
      // "price": "200",
      // "buttonName": "price",
      // "route": kDigitalInfluencerScreen
    },
    {
      "tile": "Western Match",
      "image": "assets/images/western_match.png",
      // "count": "20",
      // "price": "200",
      // "buttonName": "price",
      // "route": kDigitalInfluencerScreen
    },
  ];
//
  //
  //
  // List2
  List horoscope = [
    {
      "tile": "Planet Details",
      "image": "assets/images/Planet_details.png",
      // "count": "20",
      // "price": "200",
      // "buttonName": "price",
      // "route": kDigitalInfluencerScreen
    },
    {
      "tile": "Ascendant Reports",
      "image": "assets/images/ascedent_reports.png",
      // "count": "20",
      // "price": "200",
      // "buttonName": "price",
      // "route": kLogoScreen
    },
    {
      "tile": "Planet-report",
      "image": "assets/images/planet_report.png",
      // "count": "20",
      // "price": "200",
      // "buttonName": "price",
      //
      //"route": kLogoScreen
    },
    {
      "tile": "Personal Characteristics",
      "image": "assets/images/personal.png",
      // "count": "20",
      // "price": "200",
      // "buttonName": "price",
      // "route": kLogoScreen
    },
    {
      "tile": "Divisional chart",
      "image": "assets/images/divisional.png",
      // "count": "20",
      // "price": "200",
      // "buttonName": "price",
      // "route": kLogoScreen
    },
    {
      "tile": "Chart Image",
      "image": "assets/images/charts.png",
      // "count": "20",
      // "price": "200",
      // "buttonName": "price",
      // "route": kLogoScreen
    },
    {
      "tile": "Binnashtakvarga",
      "image": "assets/images/binnash.png",
      // "count": "20",
      // "price": "200",
      // "buttonName": "price",
      // "route": kLogoScreen
    },
    {
      "tile": "Ashtakvarga",
      "image": "assets/images/ashtak.png",
      // "count": "20",
      // "price": "200",
      // "buttonName": "price",
      // "route": kLogoScreen
    },
    {
      "tile": "AI 12 months prediction",
      "image": "assets/images/ai_twelve.png",
      // "count": "20",
      // "price": "200",
      // "buttonName": "price",
      // "route": kLogoScreen
    },
    {
      "tile": "Planetary aspects",
      "image": "assets/images/planetary_aspects.png",
      // "count": "20",
      // "price": "200",
      // "buttonName": "price",
      // "route": kLogoScreen
    },
    {
      "tile": "Planets in House",
      "image": "assets/images/planets_in_house.png",
      // "count": "20",
      // "price": "200",
      // "buttonName": "price",
      // "route": kLogoScreen
    },
    {
      "tile": "Western Planets",
      "image": "assets/images/western_planets.png",
      // "count": "20",
      // "price": "200",
      // "buttonName": "price",
      // "route": kLogoScreen
    },

    //
  ];

  ///
  // Lists1

  // List prediction = [
  //   {
  //     "tile": "Weekly-sun",
  //     "image": "assets/images/weekly_sun.png",
  //     // "count": "20",
  //     // "price": "200",
  //     // "buttonName": "price",
  //     // "route": kDigitalInfluencerScreen
  //   },
  //   {
  //     "tile": "Weekly-moon",
  //     "image": "assets/images/weel;y_moon.png",
  //     // "count": "20",
  //     // "price": "200",
  //     // "buttonName": "price",
  //     // "route": kLogoScreen
  //   },
  //   {
  //     "tile": "Daily-Number",
  //     "image": "assets/images/daily_number.png",
  //     // "count": "20",
  //     // "price": "200",
  //     // "buttonName": "price",
  //     // "route": kMusicScreen
  //   },
  //   {
  //     "tile": "Daily-moon",
  //     "image": "assets/images/daily_moon.png",
  //     // "count": "20",
  //     // "price": "200",
  //     // "buttonName": "price",
  //     // "route": kAiBLogScreen
  //   },
  //   {
  //     "tile": "Daily-sun",
  //     "image": "assets/images/daily_sun.png",
  //     "count": "20",
  //     "price": "200",
  //     // "buttonName": "price",
  //     // "route": kHashtagScreen
  //   },
  //   {
  //     "tile": "Biorythm",
  //     "image": "assets/images/bio_rythm.png",
  //     // "count": "20",
  //     // "price": "200",
  //     // "buttonName": "price",
  //     // "route": kAutomationCRMScreen
  //   },
  //   {
  //     "tile": "Numerology",
  //     "image": "assets/images/daily_number.png",
  //     // "count": "20",
  //     // "price": "200",
  //     // "buttonName": "price",
  //     // "route": kInfluencerPosecreen
  //   },
  //   {
  //     "tile": "Daily Nakshatra",
  //     "image": "assets/images/daily_nakshatra.png",
  //     // "count": "20",
  //     // "price": "200",
  //     // "buttonName": "price",
  //     // "route": kInfluencerPosecreen
  //   },
  // ];
  final con = FlipCardController();
  final con1 = FlipCardController();
  final cong = GestureFlipCardController();
  final cong1 = GestureFlipCardController();
  Map userDetails = {};
  @override
  void initState() {
    // userDetails = UserSimplePreferences.getUserDetails()!;
    // dashController.userDetails.value = userDetails ?? {};

    // String? email = UserSimplePreferences.getUserEmail();
    // String? password = UserSimplePreferences.getUserPassword();
    // authcontroller.UserEmailSignInController.text = email!;
    // authcontroller.UserEmailPasswordController.text = password!;

    // print("object");
    // dashController.userfetchAllPlans();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      userDetails = UserSimplePreferences.getUserDetails() ?? {};
      dashController.userDetails.value = userDetails; //

      String? email = UserSimplePreferences.getUserEmail();
      String? password = UserSimplePreferences.getUserPassword();

      if (email != null) {
        authcontroller.UserEmailSignInController.text = email;
      }
      if (password != null) {
        authcontroller.UserEmailPasswordController.text = password;
      }

      print("Fetching plans...");
      dashController.userfetchAllPlans();
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(milliseconds: 500), () {
        con.flipcard();
        //con.toggleCard(); // Flip the card
      });
    });
  }

  //refresh
  Future<void> refreshData() async {
    await Future.delayed(Duration(seconds: 1));
    // setState(() {
    //   //items = List.generate(10, (index) => "New Item \${index + 1}");
    // });
    var payload = {
      "user_email": authcontroller.UserEmailSignInController.text,
      "user_password": authcontroller.UserEmailPasswordController.text
    };

    // if (_formKey.currentState!.validate()) {
    //   authcontroller.userSignIn(payload);
    // }

    authcontroller.userSignInSplash(payload);
  }
  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kblack,
        body: Stack(children: [
          Image.asset(
            "assets/images/test_night.png",
            height: double.infinity,
            width: double.infinity,
          ),
          /////////////////////////////////
          //          MahaDashaController mahadashaController = Get.put(MahaDashaController());
          // PredictionController prdictionController = Get.put(PredictionController());
          // HoroscopeController horosController = Get.put(HoroscopeController());
          // UtiltyController utilityController = Get.put(UtiltyController());
          // MatchingController matchingController = Get.put(MatchingController());
          ////////////////////////////
          RefreshIndicator(
            onRefresh: refreshData,
            displacement: 100.h,
            child: SingleChildScrollView(
              physics:
                  AlwaysScrollableScrollPhysics(), // Enables scrolling even when content is small
              child: Container(
                  margin: EdgeInsets.only(
                      top: 60.h, left: 16.w, right: 16.w, bottom: 16.h),
                  child: Obx(
                    () => dashController.fetchPlansLoading == true ||
                            prdictionController.postastroDataLoading == true ||
                            prdictionController.astroDataLoading == true ||
                            horosController.postastroDataLoading == true ||
                            horosController.astroDataLoading == true ||
                            mahadashaController.postastroDataLoading == true ||
                            mahadashaController.astroDataLoading == true ||
                            utilityController.postastroDataLoading == true ||
                            utilityController.astroDataLoading == true ||
                            matchingController.postastroDataLoading == true ||
                            matchingController.astroDataLoading == true
                        ? Center(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 250.h,
                                ),
                                CircularProgressIndicator(
                                  color: Kform_border_twg,
                                ),
                              ],
                            ),
                          )
                        : dashController.userDetails["planType"] != null
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 200.w,
                                    child: InkWell(
                                      onTap: () {
                                        // var payload = {
                                        //   "user_email": authcontroller
                                        //       .UserEmailSignInController.text,
                                        //   "user_password": authcontroller
                                        //       .UserEmailPasswordController.text
                                        // };

                                        // authcontroller.userSignInSplash(payload);
                                      },
                                      child: Text(
                                          "Hello, ${dashController.userDetails["userName"]}",
                                          //"Hello, Shema test",
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

                                  // GlassmorphicContainer(
                                  //   width: double.infinity,
                                  //   height:
                                  //       MediaQuery.of(context).size.height / 1.75,
                                  //   // height: MediaQuery.of(context).size.height / 1.95,
                                  //   // height: MediaQuery.of(context).size.height / 1.5,
                                  //   borderRadius: 10,
                                  //   blur: 20,
                                  //   alignment: Alignment.bottomCenter,
                                  //   border: 0.8,
                                  //   linearGradient: LinearGradient(
                                  //       begin: Alignment.topLeft,
                                  //       end: Alignment.bottomRight,
                                  //       colors: [
                                  //         Color(0xFFffffff).withOpacity(0.1),
                                  //         Color(0xFFFFFFFF).withOpacity(0.05),
                                  //       ],
                                  //       stops: [
                                  //         0.1,
                                  //         1,
                                  //       ]),
                                  //   borderGradient: LinearGradient(
                                  //     begin: Alignment.topLeft,
                                  //     end: Alignment.bottomRight,
                                  //     colors: [
                                  //       Color(0xFFffffff).withOpacity(0.5),
                                  //       Color((0xFFFFFFFF)).withOpacity(0.5),
                                  //     ],
                                  //   ),
                                  //   child: Container(
                                  //     //  color: Kwhite,
                                  //     margin: EdgeInsets.all(5),
                                  //     padding: EdgeInsets.only(
                                  //         top: 10.h, left: 10.w, right: 10.w),
                                  //     child: Column(
                                  //       mainAxisAlignment:
                                  //           MainAxisAlignment.start,
                                  //       crossAxisAlignment:
                                  //           CrossAxisAlignment.start,
                                  //       children: [
                                  //         Row(
                                  //           // crossAxisAlignment: CrossAxisAlignment.start,
                                  //           children: [
                                  //             Image.asset(
                                  //                 "assets/images/prediction_icon.png",
                                  //                 fit: BoxFit.contain,
                                  //                 height: 35.h,
                                  //                 width: 35.w),
                                  //             SizedBox(
                                  //               width: 10.w,
                                  //             ),
                                  //             SizedBox(
                                  //               height: 10.h,
                                  //             ),
                                  //             Text("PREDICTION",
                                  //                 maxLines: 1,
                                  //                 overflow: TextOverflow.ellipsis,
                                  //                 textAlign: TextAlign.start,
                                  //                 style:
                                  //                     GoogleFonts.dmSerifDisplay(
                                  //                         fontSize: kTwentyFont,
                                  //                         fontWeight: kFW400,
                                  //                         color: Kwhite)),
                                  //             ////
                                  //           ],
                                  //         ),
                                  //         SizedBox(
                                  //           height: 15.h,
                                  //         ),
                                  //         ListView.builder(
                                  //             padding: EdgeInsets.all(0),
                                  //             itemCount: prediction.length,
                                  //             shrinkWrap: true,
                                  //             physics:
                                  //                 const NeverScrollableScrollPhysics(),
                                  //             itemBuilder: (context, index) {
                                  //               return Text(
                                  //                   prediction[index]["tile"],
                                  //                   //"Weekly Sun",
                                  //                   maxLines: 1,
                                  //                   overflow:
                                  //                       TextOverflow.ellipsis,
                                  //                   textAlign: TextAlign.start,
                                  //                   style: GoogleFonts.poppins(
                                  //                       fontSize: kSixteenFont,
                                  //                       fontWeight: kFW500,
                                  //                       color: Kwhite));
                                  //             })
                                  //       ],
                                  //     ),
                                  //   ),
                                  // ),

                                  // Prediction
                                  GlassmorphicContainer(
                                    width: double.infinity,
                                    height: MediaQuery.of(context).size.height /
                                        1.58,
                                    // height: MediaQuery.of(context).size.height /
                                    //     1.75,
                                    // height: MediaQuery.of(context).size.height / 1.95,
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
                                      margin: EdgeInsets.all(5),
                                      padding: EdgeInsets.only(
                                          top: 10.h, left: 10.w, right: 10.w),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            // crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Image.asset(
                                                  "assets/images/prediction_icon.png",
                                                  fit: BoxFit.contain,
                                                  height: 35.h,
                                                  width: 35.w),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              Text("PREDICTION",
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.start,
                                                  style: GoogleFonts
                                                      .dmSerifDisplay(
                                                          fontSize: kTwentyFont,
                                                          fontWeight: kFW400,
                                                          color: Kwhite)),
                                              ////
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15.h,
                                          ),
                                          ListView.builder(
                                              padding: EdgeInsets.all(0),
                                              itemCount: prdictionController
                                                  .cardData.length,
                                              // itemCount: prediction.length,
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemBuilder: (context, index) {
                                                return InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      prdictionController
                                                              .selected_cardData
                                                              .value =
                                                          prdictionController
                                                              .cardData[index];
                                                    });
                                                    //
                                                    prdictionController
                                                        .getAstroData();
                                                    //
                                                    print(prdictionController
                                                        .selected_cardData
                                                        .value);
                                                    print("object");
                                                  },
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        bottom: 5.h),
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              // crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Image.asset(
                                                                    prdictionController
                                                                        .cardData[
                                                                            index]
                                                                            [
                                                                            "icon"]
                                                                        .toString(),
                                                                    // prediction[
                                                                    //         index]
                                                                    //     ["image"],
                                                                    //
                                                                    fit: BoxFit
                                                                        .contain,
                                                                    height:
                                                                        24.h,
                                                                    width:
                                                                        24.w),
                                                                SizedBox(
                                                                  width: 10.w,
                                                                ),
                                                                SizedBox(
                                                                  height: 10.h,
                                                                ),
                                                                Text(
                                                                    prdictionController
                                                                        .cardData[
                                                                            index][
                                                                            "title"]
                                                                        .toString(),
                                                                    //"Weekly Sun",
                                                                    maxLines: 1,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: GoogleFonts.poppins(
                                                                        fontSize:
                                                                            kSixteenFont,
                                                                        fontWeight:
                                                                            kFW500,
                                                                        color:
                                                                            Kwhite)),

                                                                ////
                                                              ],
                                                            ),
                                                            //  Icon(Icons.open_in_full)
                                                            Icon(
                                                              Icons
                                                                  .arrow_forward_ios,
                                                              color: Kwhite,
                                                              size:
                                                                  kEighteenFont,
                                                            ),
                                                          ],
                                                        ),
                                                        Divider(
                                                          color: Kwhite,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              })
                                        ],
                                      ),
                                    ),
                                  ),
                                  GlassmorphicContainer(
                                    width: double.infinity,
                                    margin: EdgeInsets.only(top: 20.h),
                                    height: MediaQuery.of(context).size.height /
                                        1.2,
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
                                      margin: EdgeInsets.all(5),
                                      padding: EdgeInsets.only(
                                          top: 10.h, left: 10.w, right: 10.w),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            // crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Image.asset(
                                                  "assets/images/horoscope.png",
                                                  fit: BoxFit.contain,
                                                  height: 35.h,
                                                  width: 35.w),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              Text("Horoscope",
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.start,
                                                  style: GoogleFonts
                                                      .dmSerifDisplay(
                                                          fontSize: kTwentyFont,
                                                          fontWeight: kFW400,
                                                          color: Kwhite)),
                                              ////
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15.h,
                                          ),
                                          ListView.builder(
                                              padding: EdgeInsets.all(0),
                                              itemCount: horosController
                                                  .cardData.length,
                                              // horoscope.length,
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemBuilder: (context, index) {
                                                return InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      horosController
                                                              .selected_cardData
                                                              .value =
                                                          horosController
                                                              .cardData[index];
                                                    });
                                                    //
                                                    horosController
                                                        .getAstroData();
                                                    //
                                                    print(prdictionController
                                                        .selected_cardData
                                                        .value);
                                                    print("object");
                                                  },
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        bottom: 5.h),
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              // crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Image.asset(
                                                                    horosController
                                                                        .cardData[
                                                                            index]
                                                                            [
                                                                            "icon"]
                                                                        .toString(),
                                                                    // horoscope[
                                                                    //         index]
                                                                    //     ["image"],
                                                                    // "assets/images/prediction_icon.png",
                                                                    fit: BoxFit
                                                                        .contain,
                                                                    height:
                                                                        24.h,
                                                                    width:
                                                                        24.w),
                                                                SizedBox(
                                                                  width: 10.w,
                                                                ),
                                                                SizedBox(
                                                                  height: 10.h,
                                                                ),
                                                                Text(
                                                                    horosController
                                                                        .cardData[
                                                                            index][
                                                                            "title"]
                                                                        .toString(),
                                                                    // horoscope[
                                                                    //         index][
                                                                    //     "tile"],
                                                                    //"Weekly Sun",
                                                                    maxLines: 1,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: GoogleFonts.poppins(
                                                                        fontSize:
                                                                            kSixteenFont,
                                                                        fontWeight:
                                                                            kFW500,
                                                                        color:
                                                                            Kwhite)),

                                                                ////
                                                              ],
                                                            ),
                                                            //  Icon(Icons.open_in_full)
                                                            Icon(
                                                              Icons
                                                                  .arrow_forward_ios,
                                                              color: Kwhite,
                                                              size:
                                                                  kEighteenFont,
                                                            ),
                                                          ],
                                                        ),
                                                        Divider(
                                                          color: Kwhite,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              })
                                        ],
                                      ),
                                    ),
                                  ),

                                  GlassmorphicContainer(
                                    width: double.infinity,
                                    margin: EdgeInsets.only(top: 20.h),
                                    height: MediaQuery.of(context).size.height /
                                        1.35,
                                    // MediaQuery.of(context).size.height / 1.2,
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
                                      margin: EdgeInsets.all(5),
                                      padding: EdgeInsets.only(
                                          top: 10.h, left: 10.w, right: 10.w),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            // crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Image.asset(
                                                  "assets/images/match.png",
                                                  fit: BoxFit.contain,
                                                  height: 35.h,
                                                  width: 35.w),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              Text("Matching",
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.start,
                                                  style: GoogleFonts
                                                      .dmSerifDisplay(
                                                          fontSize: kTwentyFont,
                                                          fontWeight: kFW400,
                                                          color: Kwhite)),
                                              ////
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15.h,
                                          ),
                                          ListView.builder(
                                              padding: EdgeInsets.all(0),
                                              itemCount: matchingController
                                                  .cardData.length,
                                              // matching.length,
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemBuilder: (context, index) {
                                                return InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      matchingController
                                                              .selected_cardData
                                                              .value =
                                                          matchingController
                                                              .cardData[index];
                                                    });
                                                    Get.toNamed(kPartnerForms);

                                                    //
                                                    // horosController
                                                    //     .getAstroData();
                                                    //
                                                    print(prdictionController
                                                        .selected_cardData
                                                        .value);
                                                    print("object");
                                                  },
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        bottom: 5.h),
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              // crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Image.asset(
                                                                    matchingController
                                                                        .cardData[
                                                                            index]
                                                                            [
                                                                            "icon"]
                                                                        .toString(),
                                                                    // matching[
                                                                    //         index]
                                                                    //     ["image"],
                                                                    // "assets/images/prediction_icon.png",
                                                                    fit: BoxFit
                                                                        .contain,
                                                                    height:
                                                                        24.h,
                                                                    width:
                                                                        24.w),
                                                                SizedBox(
                                                                  width: 10.w,
                                                                ),
                                                                SizedBox(
                                                                  height: 10.h,
                                                                ),
                                                                SizedBox(
                                                                  width: 200.w,
                                                                  child: Text(
                                                                      matchingController
                                                                          .cardData[
                                                                              index][
                                                                              "title"]
                                                                          .toString(),
                                                                      // matching[
                                                                      //         index][
                                                                      //     "tile"],
                                                                      //"Weekly Sun",
                                                                      maxLines:
                                                                          1,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: GoogleFonts.poppins(
                                                                          fontSize:
                                                                              kSixteenFont,
                                                                          fontWeight:
                                                                              kFW500,
                                                                          color:
                                                                              Kwhite)),
                                                                ),

                                                                ////
                                                              ],
                                                            ),
                                                            //  Icon(Icons.open_in_full)
                                                            Icon(
                                                              Icons
                                                                  .arrow_forward_ios,
                                                              color: Kwhite,
                                                              size:
                                                                  kEighteenFont,
                                                            ),
                                                          ],
                                                        ),
                                                        Divider(
                                                          color: Kwhite,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              })
                                        ],
                                      ),
                                    ),
                                  ),
                                  GlassmorphicContainer(
                                    width: double.infinity,
                                    margin: EdgeInsets.only(top: 20.h),
                                    height: MediaQuery.of(context).size.height /
                                        1.4,
                                    // MediaQuery.of(context).size.height / 1.2,
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
                                      margin: EdgeInsets.all(5),
                                      padding: EdgeInsets.only(
                                          top: 10.h, left: 10.w, right: 10.w),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            // crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Image.asset(
                                                  "assets/images/dashas.png",
                                                  fit: BoxFit.contain,
                                                  height: 35.h,
                                                  width: 35.w),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              Text("Dashas",
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.start,
                                                  style: GoogleFonts
                                                      .dmSerifDisplay(
                                                          fontSize: kTwentyFont,
                                                          fontWeight: kFW400,
                                                          color: Kwhite)),
                                              ////
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15.h,
                                          ),
                                          ListView.builder(
                                              padding: EdgeInsets.all(0),
                                              itemCount: mahadashaController
                                                  .cardData.length,
                                              //  itemCount: dashas.length,
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemBuilder: (context, index) {
                                                return InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      mahadashaController
                                                              .selected_cardData
                                                              .value =
                                                          mahadashaController
                                                              .cardData[index];
                                                      // prdictionController
                                                      //     .cardData[index];
                                                    });
                                                    //
                                                    mahadashaController
                                                        .getAstroData();
                                                    //
                                                    // mahadashaController
                                                    //                     .cardData[
                                                    //                         index]
                                                  },
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        bottom: 5.h),
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              // crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Image.asset(
                                                                    mahadashaController
                                                                        .cardData[
                                                                            index]
                                                                            [
                                                                            "icon"]
                                                                        .toString(),
                                                                    // dashas[index]
                                                                    //     ["image"],
                                                                    // "assets/images/prediction_icon.png",
                                                                    fit: BoxFit
                                                                        .contain,
                                                                    height:
                                                                        24.h,
                                                                    width:
                                                                        24.w),
                                                                SizedBox(
                                                                  width: 10.w,
                                                                ),
                                                                SizedBox(
                                                                  height: 10.h,
                                                                ),
                                                                SizedBox(
                                                                  width: 200.w,
                                                                  child: Text(
                                                                      mahadashaController
                                                                          .cardData[
                                                                              index][
                                                                              "title"]
                                                                          .toString(),
                                                                      // dashas[index][
                                                                      //     "tile"],
                                                                      //"Weekly Sun",
                                                                      maxLines:
                                                                          1,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: GoogleFonts.poppins(
                                                                          fontSize:
                                                                              kSixteenFont,
                                                                          fontWeight:
                                                                              kFW500,
                                                                          color:
                                                                              Kwhite)),
                                                                ),

                                                                ////
                                                              ],
                                                            ),
                                                            //  Icon(Icons.open_in_full)
                                                            Icon(
                                                              Icons
                                                                  .arrow_forward_ios,
                                                              color: Kwhite,
                                                              size:
                                                                  kEighteenFont,
                                                            ),
                                                          ],
                                                        ),
                                                        Divider(
                                                          color: Kwhite,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              })
                                        ],
                                      ),
                                    ),
                                  ),
                                  GlassmorphicContainer(
                                    width: double.infinity,
                                    margin: EdgeInsets.only(top: 20.h),
                                    height: MediaQuery.of(context).size.height /
                                        2.5,
                                    // MediaQuery.of(context).size.height / 1.2,
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
                                      margin: EdgeInsets.all(5),
                                      padding: EdgeInsets.only(
                                          top: 10.h, left: 10.w, right: 10.w),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            // crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Image.asset(
                                                  "assets/images/dosh.png",
                                                  fit: BoxFit.contain,
                                                  height: 35.h,
                                                  width: 35.w),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              Text("Dosh",
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.start,
                                                  style: GoogleFonts
                                                      .dmSerifDisplay(
                                                          fontSize: kTwentyFont,
                                                          fontWeight: kFW400,
                                                          color: Kwhite)),
                                              ////
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15.h,
                                          ),
                                          ListView.builder(
                                              padding: EdgeInsets.all(0),
                                              itemCount: doshController
                                                  .cardData.length,
                                              // dosh.length,
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemBuilder: (context, index) {
                                                return InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      doshController
                                                              .selected_cardData
                                                              .value =
                                                          doshController
                                                              .cardData[index];
                                                    });
                                                    //
                                                    doshController
                                                        .getAstroData();
                                                    //
                                                    // mahadashaController
                                                    //                     .cardData[
                                                    //                         index]
                                                  },
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        bottom: 5.h),
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              // crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Image.asset(
                                                                    doshController
                                                                        .cardData[
                                                                            index]
                                                                            [
                                                                            "icon"]
                                                                        .toString(),
                                                                    // dosh[index]
                                                                    //     ["image"],
                                                                    // "assets/images/prediction_icon.png",
                                                                    fit: BoxFit
                                                                        .contain,
                                                                    height:
                                                                        24.h,
                                                                    width:
                                                                        24.w),
                                                                SizedBox(
                                                                  width: 10.w,
                                                                ),
                                                                SizedBox(
                                                                  height: 10.h,
                                                                ),
                                                                SizedBox(
                                                                  width: 200.w,
                                                                  child: Text(
                                                                      doshController
                                                                          .cardData[
                                                                              index][
                                                                              "title"]
                                                                          .toString(),
                                                                      // dosh[index][
                                                                      //     "tile"],
                                                                      //"Weekly Sun",
                                                                      maxLines:
                                                                          1,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: GoogleFonts.poppins(
                                                                          fontSize:
                                                                              kSixteenFont,
                                                                          fontWeight:
                                                                              kFW500,
                                                                          color:
                                                                              Kwhite)),
                                                                ),

                                                                ////
                                                              ],
                                                            ),
                                                            //  Icon(Icons.open_in_full)
                                                            Icon(
                                                              Icons
                                                                  .arrow_forward_ios,
                                                              color: Kwhite,
                                                              size:
                                                                  kEighteenFont,
                                                            ),
                                                          ],
                                                        ),
                                                        Divider(
                                                          color: Kwhite,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              })
                                        ],
                                      ),
                                    ),
                                  ),
                                  GlassmorphicContainer(
                                    width: double.infinity,
                                    margin: EdgeInsets.only(top: 20.h),
                                    height:
                                        MediaQuery.of(context).size.height / 3,
                                    //  MediaQuery.of(context).size.height / 2.5,
                                    //
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
                                      margin: EdgeInsets.all(5),
                                      padding: EdgeInsets.only(
                                          top: 10.h, left: 10.w, right: 10.w),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            // crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Image.asset(
                                                  "assets/images/utility.png",
                                                  fit: BoxFit.contain,
                                                  height: 35.h,
                                                  width: 35.w),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              Text("Utility",
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.start,
                                                  style: GoogleFonts
                                                      .dmSerifDisplay(
                                                          fontSize: kTwentyFont,
                                                          fontWeight: kFW400,
                                                          color: Kwhite)),
                                              ////
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15.h,
                                          ),
                                          ListView.builder(
                                              padding: EdgeInsets.all(0),
                                              itemCount: utilityController
                                                  .cardData.length,
                                              // [
                                              //     index]
                                              //     [
                                              //     "icon"]
                                              // .toString(),
                                              //utility.length,
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemBuilder: (context, index) {
                                                return InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      utilityController
                                                              .selected_cardData
                                                              .value =
                                                          utilityController
                                                              .cardData[index];
                                                    });
                                                    Get.toNamed(kUtilityForms);

                                                    //
                                                    // utilityController
                                                    //     .getAstroData();
                                                    //
                                                    // mahadashaController
                                                    //                     .cardData[
                                                    //                         index]
                                                  },
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        bottom: 5.h),
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              // crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Image.asset(
                                                                    utilityController
                                                                        .cardData[
                                                                            index]
                                                                            [
                                                                            "icon"]
                                                                        .toString(),
                                                                    // utility[index]
                                                                    //     ["image"],
                                                                    // "assets/images/prediction_icon.png",
                                                                    fit: BoxFit
                                                                        .contain,
                                                                    height:
                                                                        24.h,
                                                                    width:
                                                                        24.w),
                                                                SizedBox(
                                                                  width: 10.w,
                                                                ),
                                                                SizedBox(
                                                                  height: 10.h,
                                                                ),
                                                                SizedBox(
                                                                  width: 200.w,
                                                                  child: Text(
                                                                      utilityController
                                                                          .cardData[
                                                                              index][
                                                                              "title"]
                                                                          .toString(),
                                                                      //"Weekly Sun",
                                                                      maxLines:
                                                                          1,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: GoogleFonts.poppins(
                                                                          fontSize:
                                                                              kSixteenFont,
                                                                          fontWeight:
                                                                              kFW500,
                                                                          color:
                                                                              Kwhite)),
                                                                ),

                                                                ////
                                                              ],
                                                            ),
                                                            //  Icon(Icons.open_in_full)
                                                            Icon(
                                                              Icons
                                                                  .arrow_forward_ios,
                                                              color: Kwhite,
                                                              size:
                                                                  kEighteenFont,
                                                            ),
                                                          ],
                                                        ),
                                                        Divider(
                                                          color: Kwhite,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              })
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Text("Download",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.dmSerifDisplay(
                                          fontSize: kTwentyFont,
                                          fontWeight: kFW400,
                                          height: 1.2,
                                          color: Kwhite)),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          // prdictionController
                                          // .downloadMatchingData();
                                          prdictionController
                                              .downloadHoroscopeData();
                                        },
                                        child: GlassmorphicContainer(
                                          width: 160.w,
                                          margin: EdgeInsets.only(top: 20.h),
                                          height: 40.h,
                                          borderRadius: 10,
                                          blur: 20,
                                          alignment: Alignment.center,
                                          border: 0.8,
                                          linearGradient: LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: [
                                                kAstroBgblue.withOpacity(0.1),
                                                kAstroBgblue.withOpacity(0.05),
                                              ],
                                              stops: [
                                                0.1,
                                                1,
                                              ]),
                                          borderGradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              kAstroBgblue,
                                              kAstroBgblue
                                            ],
                                          ),
                                          child: Container(
                                            //  color: Kwhite,
                                            // margin: EdgeInsets.all(5),
                                            padding: EdgeInsets.only(
                                                left: 10.w, right: 10.w),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("Horoscope",
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.start,
                                                    style: GoogleFonts
                                                        .dmSerifDisplay(
                                                            fontSize:
                                                                kSixteenFont,
                                                            fontWeight: kFW400,
                                                            color: Kwhite)),
                                                Icon(
                                                  Icons.download,
                                                  color: Kwhite,
                                                  size: 20.sp,
                                                )
                                                ////
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          prdictionController
                                              .downloadMatchingData();
                                          // prdictionController
                                          //     .downloadHoroscopeData();
                                        },
                                        child: GlassmorphicContainer(
                                          width: 160.w,
                                          margin: EdgeInsets.only(top: 20.h),
                                          height: 40.h,
                                          borderRadius: 10,
                                          blur: 20,
                                          alignment: Alignment.center,
                                          border: 0.8,
                                          linearGradient: LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: [
                                                kAstroBgblue.withOpacity(0.1),
                                                kAstroBgblue.withOpacity(0.05),
                                              ],
                                              stops: [
                                                0.1,
                                                1,
                                              ]),
                                          borderGradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              kAstroBgblue,
                                              kAstroBgblue
                                            ],
                                          ),
                                          child: Container(
                                            //  color: Kwhite,
                                            // margin: EdgeInsets.all(5),
                                            padding: EdgeInsets.only(
                                                left: 10.w, right: 10.w),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("Matching",
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.start,
                                                    style: GoogleFonts
                                                        .dmSerifDisplay(
                                                            fontSize:
                                                                kSixteenFont,
                                                            fontWeight: kFW400,
                                                            color: Kwhite)),
                                                Icon(
                                                  Icons.download,
                                                  color: Kwhite,
                                                  size: 20.sp,
                                                )
                                                ////
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  SizedBox(
                                    width: 300.w,
                                    child: InkWell(
                                      // onTap: () {
                                      //   prdictionController
                                      //       .downloadMatchingData();
                                      //   // prdictionController
                                      //   //     .downloadHoroscopeData();
                                      // },
                                      child: Text("Explore beyond the horizon.",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.dmSerifDisplay(
                                              fontSize: 34.sp,
                                              fontWeight: kFW400,
                                              height: 1.2,
                                              color: Kwhite)),
                                    ),
                                  ),

                                  SizedBox(
                                    height: 150.h,
                                  )
                                ],
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      // var payload = {
                                      //   "user_email": authcontroller
                                      //       .UserEmailSignInController.text,
                                      //   "user_password": authcontroller
                                      //       .UserEmailPasswordController.text
                                      // };

                                      // authcontroller.userSignInSplash(payload);

                                      //  dashController.userfetchAllPlans();
                                      // dashController.userfetchAllPlans();
                                    },
                                    child: SizedBox(
                                      width: 200.w,
                                      child: Text(
                                          "Hello, ${dashController.userDetails["userName"]}",
                                          //"Hello, Shema",
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
                                    height: MediaQuery.of(context).size.height /
                                        1.95,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                  color:
                                                      Kwhite.withOpacity(0.7))),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              CustomButton(
                                                  margin: EdgeInsets.only(
                                                      top: 20.h),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.r),
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
                                                  margin: EdgeInsets.only(
                                                      top: 20.h),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.r),
                                                  borderColor: Kwhite,
                                                  textColor: Kwhite,
                                                  height: 32,
                                                  width: 150.w,
                                                  label: "How to use?",
                                                  fontSize: kFourteenFont,
                                                  fontWeight: kFW500,
                                                  isLoading: false,
                                                  onTap: () async {
                                                    Get.toNamed(kHowtoUse);
                                                    // final Uri url = Uri.parse(
                                                    //     'https://bharatastrosage.com/howtouse');
                                                    // if (!await launchUrl(url)) {
                                                    //   throw 'Could not launch $url';
                                                    // }
                                                    // authcontroller
                                                    //     .shipmenyetverifyPaymnet(
                                                    //         authcontroller
                                                    //             .succesrespons
                                                    //             .value);

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
            ),
          )
        ]));
  }
}
