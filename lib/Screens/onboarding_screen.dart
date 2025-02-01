import 'package:flutter/services.dart';

import 'package:bharatastro/untils/export_file.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _pageController = PageController();
  int pageIndex = 0;
  List<Map> splashPages = [
    {
      'title': "Discover Your Cosmic Path",
      'maintitle':
          "Dive into the universe’s wisdom to understand your true self and destiny.",
      'maintitle1': ' ',
      'maintitle2': '',
      'maintitle3': '',
      'image': "assets/images/astro_onboard_one.png",
    },
    {
      'title': 'Connect with the Cosmos',
      'maintitle':
          'Unveil hidden truths and align your journey with the stars’ guidance.',
      'maintitle1': '',
      'maintitle2': "",
      'maintitle3': '',
      'image': "assets/images/astro_onboard_two.png",
    },
    {
      'title': 'Your Zodiac Insights Await',
      'maintitle':
          'Discover personalized horoscopes and astrological readings just for you.',
      'maintitle1': '',
      'maintitle2': '',
      'maintitle3': '',
      'image': "assets/images/astro_onboard_three.png",
    },
  ];
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          if (currentPage == 0) {
            SystemNavigator.pop();
          } else {
            _pageController.animateToPage(_pageController.page!.toInt() - 1,
                duration: const Duration(milliseconds: 200),
                curve: Curves.bounceIn);
          }
          return Future.value(false);
        },
        child: Scaffold(
          backgroundColor: Kwhite,
          body: Stack(
            children: [
              Image.asset(
                "assets/images/test_night.png",
                height: double.infinity,
                width: double.infinity,
              ),
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 55.h),
                          child: InkWell(
                            onTap: () {
                              Get.toNamed(kSignIns);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "Skip",
                                  style: GoogleFonts.poppins(
                                      color: Kwhite,
                                      fontSize: kFourteenFont,
                                      fontWeight: kFW500),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 14.sp,
                                  color: Kwhite,
                                ),
                                SizedBox(
                                  width: 30.w,
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                height:
                                    MediaQuery.of(context).size.height / 1.5,
                                // MediaQuery.of(context).size.height / 1.7,
                                // MediaQuery.of(context).size.height / 1.8,
                                // height: 555.h,
                                //color: KlightBlue,
                                child: PageView.builder(
                                  // physics: NeverScrollableScrollPhysics(),
                                  controller: _pageController,
                                  onPageChanged: (value) {
                                    setState(() {
                                      currentPage = value;
                                    });
                                  },
                                  itemCount: splashPages.length,
                                  itemBuilder: (context, index) {
                                    return SplashPageContent(
                                      title: splashPages[index]['title'],
                                      maintitle: splashPages[index]
                                          ['maintitle'],
                                      maintitle1: splashPages[index]
                                          ['maintitle1'],
                                      maintitle2: splashPages[index]
                                          ['maintitle2'],
                                      maintitle3: splashPages[index]
                                          ['maintitle3'],
                                      image: splashPages[index]['image'],
                                      //subimage: splashPages[index]['subimage'],
                                    );
                                  },
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  top: 8.h,
                                ),
                                alignment: Alignment.center,
                                child: SmoothPageIndicator(
                                  controller: _pageController,
                                  count: splashPages.length,
                                  effect: ExpandingDotsEffect(
                                    dotHeight: 10.h,
                                    dotWidth: 10.w,
                                    dotColor: Kbluetheme.withOpacity(0.7),
                                    activeDotColor: Kwhite,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20.w, right: 20.w),
                          child: GestureDetector(
                              onTap: () {
                                if (currentPage == splashPages.length - 1) {
                                  Get.toNamed(kSignIns);
                                } else {
                                  _pageController.nextPage(
                                      duration:
                                          const Duration(milliseconds: 200),
                                      curve: Curves.linear);
                                }
                              },
                              child: currentPage == splashPages.length - 1
                                  ? Container(
                                      // margin: margin,
                                      //   padding: Padding,
                                      height: 39,
                                      width: double.infinity,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Kbluetheme,
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Get Started",
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.poppins(
                                                fontSize: kFourteenFont,
                                                color: Kwhite,
                                                fontWeight: kFW500),
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            size: 14.sp,
                                            color: Kwhite,
                                          ),
                                        ],
                                      ),
                                    )
                                  : Container(
                                      // margin: margin,
                                      //   padding: Padding,
                                      height: 39,
                                      width: double.infinity,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Kbluetheme,
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Next",
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.poppins(
                                                fontSize: kFourteenFont,
                                                color: Kwhite,
                                                fontWeight: kFW500),
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            size: 14.sp,
                                            color: Kwhite,
                                          ),
                                        ],
                                      ),
                                    )),
                        ),
                        // SizedBox(
                        //   height: 50.h,
                        // ),
                      ],
                    ),
                    // Image.asset(
                    //   "assets/images/night_cloud.png",
                    //   height: 220.h,
                    //   width: double.infinity,
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class SplashPageContent extends StatelessWidget {
  const SplashPageContent({
    Key? key,
    required this.title,
    required this.maintitle,
    required this.maintitle1,
    required this.maintitle3,
    required this.maintitle2,
    required this.image,
  }) : super(key: key);

  final String title;

  final String maintitle;
  final String maintitle1;
  final String maintitle2;
  final String maintitle3;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 350.h,
          width: double.infinity,
          child: FadeInImage(
            placeholder: AssetImage(
              "assets/images/white_image.png",
            ),
            placeholderColor: kblack,
            fit: BoxFit.cover,
            image: AssetImage(image),
            color: Kwhite,
            fadeInDuration: Duration(milliseconds: 200),
            width: 200.w,
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: GoogleFonts.dmSerifDisplay(
                    fontSize: 20.sp, fontWeight: kFW400, color: Kwhite)),
          ], //
        ),
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
          // h width: 350,
          width: double.infinity,
          child: Text(maintitle,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  fontSize: kTwelveFont, fontWeight: kFW400, color: Kwhite)),
        ),
      ],
    );
  }
}
