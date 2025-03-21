import 'package:bharatastro/untils/export_file.dart';

class SplashScreenTwo extends StatefulWidget {
  const SplashScreenTwo({super.key});

  @override
  State<SplashScreenTwo> createState() => _SplashScreenTwoState();
}

class _SplashScreenTwoState extends State<SplashScreenTwo> {
  // ProfileController userprofilecontroller = Get.put(ProfileController());
  /////////////////////////////////////////////
  // bool? isUserLoggedIn;
  // @override
  // void initState() {
  //   Future.delayed(const Duration(seconds: 3), () async {
  //     Get.toNamed(kOnboarding);
  //   });
  //   super.initState();
  // }
  //
  bool? isUserLoggedIn;
  @override
  void initState() {
    super.initState();

    //////////////////////////////
    isUserLoggedIn = UserSimplePreferences.getLoginStatus();
    Future.delayed(const Duration(seconds: 2), () async {
      Get.toNamed(kNavigation);
      // if (isUserLoggedIn != null && isUserLoggedIn == true) {
      //   // Get.toNamed(kNavigation);
      //   // userprofilecontroller.userProfileNavigation();

      // } else {
      //   Get.toNamed(kOnboarding);
      // }
    });
    /////////////////////////////
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Kwhite,
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          // decoration: BoxDecoration(
          //   gradient: LinearGradient(colors: [Kbluetheme, Kbluetheme]),
          // ),
          alignment: Alignment.center,
          child: Center(
            child: CircularProgressIndicator(
              color: Kform_border_twg,
            ),
          )
          // Image.asset(
          //   "assets/images/astrologo.png",
          //   height: 240.h,
          //   width: 240.w,
          // ),
          ),
    );
  }
}
