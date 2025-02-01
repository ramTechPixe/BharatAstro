import 'package:bharatastro/untils/export_file.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // ProfileController userprofilecontroller = Get.put(ProfileController());
  /////////////////////////////////////////////
  bool? isUserLoggedIn;
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () async {
      Get.toNamed(kOnboarding);
    });
    super.initState();
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
