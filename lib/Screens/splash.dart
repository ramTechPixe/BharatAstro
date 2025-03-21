import 'package:bharatastro/untils/export_file.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AuthController authcontroller = Get.put(AuthController());
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
      if (isUserLoggedIn != null && isUserLoggedIn == true) {
        var payload = {
          "user_email": "${UserSimplePreferences.getUserEmail()}",
          "user_password": "${UserSimplePreferences.getUserPassword()}"
        };

        authcontroller.userSignIn(payload);
        // if (_formKey.currentState!.validate()) {
        //   authcontroller.userSignIn(payload);
        // }
        //  Get.toNamed(kNavigation);
      } else {
        Get.toNamed(kOnboarding);
      }
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
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Kbluetheme, Kbluetheme]),
        ),
        alignment: Alignment.center,
        child: Image.asset(
          "assets/images/astrologo.png",
          height: 240.h,
          width: 240.w,
        ),
      ),
    );
  }
}
