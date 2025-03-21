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
        transition: Transition.rightToLeft,
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
        page: () => AddUserDetails())
    //
  ];
}
//
// import 'package:get/get_navigation/src/routes/get_route.dart';

// class Routes {
//   static List<GetPage<dynamic>> routes = [
//     GetPage(
//         name: kSplash,
//         transition: Transition.rightToLeft,
//         page: () => const SplashScreen()),
//     GetPage(
//         name: kOnboarding,
//         transition: Transition.rightToLeft,
//         page: () => const OnboardingScreen()),
//     GetPage(
//         name: kSignUps,
//         transition: Transition.rightToLeft,
//         page: () => const SignUPS()),
//     GetPage(
//         name: kSignIns,
//         transition: Transition.rightToLeft,
//         page: () => const SignIn()),
//     GetPage(
//         name: kForgotPassword,
//         transition: Transition.rightToLeft,
//         page: () => const Forgotpassword()),
//     GetPage(
//         name: kNavigation,
//         transition: Transition.rightToLeft,
//         page: () => const Bottom_navigation()),
//     GetPage(
//         name: kQuick_posting,
//         transition: Transition.rightToLeft,
//         page: () => const QuickPosting()),
//     GetPage(
//         name: kEdit_Profile,
//         transition: Transition.rightToLeft,
//         page: () => const EditProfile()),
//     GetPage(
//         name: kPublishedScreens,
//         transition: Transition.rightToLeft,
//         page: () => const PublishedScreens()),
//     GetPage(
//         name: kSettingsScreens,
//         transition: Transition.rightToLeft,
//         page: () => const SettingsScreen()),
//     GetPage(
//         name: kScheduledPostScreens,
//         transition: Transition.rightToLeft,
//         page: () => const Schedule_post_view()),
//     GetPage(
//         name: kCreateBannersScreens,
//         transition: Transition.rightToLeft,
//         page: () => const CustomizeBanners()),
//     GetPage(
//         name: kMultiPostScreens,
//         transition: Transition.rightToLeft,
//         page: () => const MultiPostScreen()),
//     GetPage(
//         name: kAddMultiPost,
//         transition: Transition.rightToLeft,
//         page: () => const AddMultiScreen()),
//     GetPage(
//         name: kEditMultiPost,
//         transition: Transition.rightToLeft,
//         page: () => const EditMultiScreen()),
//     GetPage(
//         name: kToolsScreen,
//         transition: Transition.rightToLeft,
//         page: () => const ToolsScreen()),
//     GetPage(
//         name: kDigitalInfluencerScreen,
//         transition: Transition.rightToLeft,
//         page: () => const DigitalInfluencer()),
//     GetPage(
//         name: kLogoScreen,
//         transition: Transition.rightToLeft,
//         page: () => const LogosScreen()),
//     GetPage(
//         name: kMusicScreen,
//         transition: Transition.rightToLeft,
//         page: () => const MusicScreen()),
//     GetPage(
//         name: kAiBLogScreen,
//         transition: Transition.rightToLeft,
//         page: () => const AiBLogScreen()),
//     GetPage(
//         name: kHashtagScreen,
//         transition: Transition.rightToLeft,
//         page: () => const HashtagScreen()),
//     GetPage(
//         name: kAutomationCRMScreen,
//         transition: Transition.rightToLeft,
//         page: () => const AutomationCRMScreen()),
//     GetPage(
//         name: kInfluencerPosecreen,
//         transition: Transition.rightToLeft,
//         page: () => const DigitalInfluencerPose()),
//     GetPage(
//         name: kNointernetScreen,
//         transition: Transition.rightToLeft,
//         page: () => const NoInternet()),
//     GetPage(
//         name: kFBAddDemoScreen,
//         transition: Transition.rightToLeft,
//         page: () => const AutomationCRMFBDemo()),
//     GetPage(
//         name: kFBAddApplyScreen,
//         transition: Transition.rightToLeft,
//         page: () => const FB_ad_apply()),
//     GetPage(
//         name: kWebAddDemoScreen,
//         transition: Transition.rightToLeft,
//         page: () => const WebsiteToolDemo()),
//     GetPage(
//         name: kPreviewScreen,
//         transition: Transition.rightToLeft,
//         page: () => const PreviewScreen()),
//     GetPage(
//         name: kEditScheduleScreen,
//         transition: Transition.rightToLeft,
//         page: () => EditSchedulePost()),
//     GetPage(
//         name: kPostingLogsScreen,
//         transition: Transition.rightToLeft,
//         page: () => PostingLogsList()),
//     GetPage(
//         name: kPostingLogView,
//         transition: Transition.rightToLeft,
//         page: () => PostingLogView()),
//     GetPage(
//         name: kWebSiteSeo,
//         transition: Transition.rightToLeft,
//         page: () => WebSiteSeo()),
//     GetPage(
//         name: kCallAgent,
//         transition: Transition.rightToLeft,
//         page: () => CallAgent()),
//     GetPage(
//         name: kAutoComments,
//         transition: Transition.rightToLeft,
//         page: () => AutoCommentsScreen()),
//     GetPage(
//         name: kTotal_list,
//         transition: Transition.rightToLeft,
//         page: () => TotalsList()),
//     GetPage(
//         name: kSuscribtion,
//         transition: Transition.rightToLeft,
//         page: () => Suscribtion()),
//     GetPage(
//         name: kInvoiceScreen,
//         transition: Transition.rightToLeft,
//         page: () => InvoiceScreen()),
//     GetPage(
//         name: kVideoTemplateScreen,
//         transition: Transition.rightToLeft,
//         page: () => VideoTemplate()),
//     GetPage(
//         name: kVideoTemplateView,
//         transition: Transition.rightToLeft,
//         page: () => VideoTemplateDescription()),
//     GetPage(
//         name: kAnalitics,
//         transition: Transition.rightToLeft,
//         page: () => AnalyticsScreen()),
//     GetPage(
//         name: kMultiPostView,
//         transition: Transition.rightToLeft,
//         page: () => MultiPostView()),

//     //
//   ];
// }
