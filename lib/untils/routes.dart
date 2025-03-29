// import 'package:get/get_navigation/src/routes/get_route.dart';

import 'package:bharatastro/untils/export_file.dart';

class Routes {
  static List<GetPage<dynamic>> routes = [
    GetPage(
        name: kSplash,
        transition: Transition.rightToLeft,
        page: () => SplashScreen()),
    GetPage(
        name: kSplashTwo,
        transition: Transition.noTransition,
        // transition: Transition.rightToLeft,
        page: () => SplashScreenTwo()),

    GetPage(
        name: kOnboarding,
        transition: Transition.rightToLeft,
        page: () => const OnboardingScreen()),
    GetPage(
        name: kSignIns,
        transition: Transition.rightToLeft,
        page: () => const SignIn()),
    GetPage(
        name: kSignUps,
        transition: Transition.rightToLeft,
        page: () => const SignUp()),
    GetPage(
        name: kForgotPassword,
        transition: Transition.rightToLeft,
        page: () => ForgotPassword()),
    GetPage(
        name: kForgotPasswordOTP,
        transition: Transition.rightToLeft,
        page: () => ForgotPasswordOTP()),
    GetPage(
        name: kDashboard,
        transition: Transition.rightToLeft,
        page: () => Dashboard()),
    GetPage(
        name: kPurchaseCard,
        transition: Transition.rightToLeft,
        page: () => PurchaseCard()),
    GetPage(
        name: kCardPricing,
        transition: Transition.rightToLeft,
        page: () => Pricing()),
    GetPage(
        name: kShippingAddress,
        transition: Transition.rightToLeft,
        page: () => ShippingAddress()),
    GetPage(
        name: kOrders,
        transition: Transition.rightToLeft,
        page: () => OrdersList()),
    GetPage(
        name: kOrderView,
        transition: Transition.rightToLeft,
        page: () => OrderView()),
    GetPage(
        name: kprofile,
        transition: Transition.rightToLeft,
        page: () => ProfileScreen()),
    GetPage(
        name: kEditprofile,
        transition: Transition.rightToLeft,
        page: () => EditProfile()),
    GetPage(
        name: kChangePassword,
        transition: Transition.rightToLeft,
        page: () => ChangePasword()),
    GetPage(
        name: kSupport,
        transition: Transition.rightToLeft,
        page: () => Support()),
    GetPage(
        name: kAppVersion,
        transition: Transition.rightToLeft,
        page: () => AppVersion()),
    GetPage(
        name: kNavigation,
        transition: Transition.rightToLeft,
        // page: () => Bottom_navigation()),
        // page: () => BottomNavigation()),
        page: () => NavigationBarScreen()),

    GetPage(
        name: kAddUser,
        transition: Transition.rightToLeft,
        page: () => AddUserDetails()),
    GetPage(
        name: kHowtoUse,
        transition: Transition.rightToLeft,
        page: () => HowToUse()),
    GetPage(
        name: kUtilityForms,
        transition: Transition.rightToLeft,
        page: () => Utility_form()),
    GetPage(
        name: kPartnerForms,
        transition: Transition.rightToLeft,
        page: () => Partner_form()),
    GetPage(
        name: kAstroOutput,
        transition: Transition.rightToLeft,
        page: () => AstroOutput()),
    //
  ];
}
//
