import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bharatastro/untils/export_file.dart';

class NavigationBarScreen extends StatefulWidget {
  @override
  _NavigationBarScreenState createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  late PageController _pageController;

  int _pageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              'Are you sure?',
              style: GoogleFonts.roboto(
                  fontSize: kEighteenFont,
                  fontWeight: kFW600,
                  color: KdarkText),
            ),
            content: Text(
              'Do you want to exit this App',
              style: GoogleFonts.roboto(
                  fontSize: 13.sp, fontWeight: kFW600, color: KdarkText),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(
                  'No',
                  style: GoogleFonts.roboto(
                      fontSize: kTwelveFont,
                      fontWeight: kFW600,
                      color: KdarkText),
                ),
              ),
              TextButton(
                onPressed: () => SystemNavigator.pop(),
                child: Text(
                  'Yes',
                  style: GoogleFonts.roboto(
                      fontSize: kTwelveFont,
                      fontWeight: kFW600,
                      color: kAstroBgblue),
                ),
              )
            ],
          ),
        )) ??
        false;
  }

  void onPageChanged(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
          extendBody: true,
          body: PageView(
            controller: _pageController,
            onPageChanged: onPageChanged,
            children: [
              Dashboard(),
              OrdersList(),
              ProfileScreen(),
            ],
          ),
          bottomNavigationBar: Container(
            margin: EdgeInsets.all(5.r),
            padding: EdgeInsets.all(10.r),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                // BottomNavigationBar(
                //     elevation: 0,
                //     backgroundColor: KbluethemeThick,
                //     selectedItemColor: kAstro_yellow,
                //     unselectedItemColor: Kwhite.withOpacity(0.8),
                //     selectedLabelStyle:
                //         GoogleFonts.poppins(fontWeight: FontWeight.w600),
                //     // GoogleFonts.poboto(fontWeight: FontWeight.w600),
                //     type: BottomNavigationBarType.fixed,
                //     items: _buildThreeItems(),
                //     onTap: (int index) {
                //       _pageController.animateToPage(
                //         index,
                //         duration: const Duration(milliseconds: 200),
                //         curve: Curves.easeInOut,
                //       );
                //     },
                //     currentIndex: _pageIndex,
                //   ),
                child: BottomNavigationBar(
                  elevation: 0,
                  backgroundColor: KbluethemeThick,
                  selectedItemColor: kAstro_yellow,
                  unselectedItemColor: Kwhite.withOpacity(0.8),
                  selectedLabelStyle:
                      GoogleFonts.poppins(fontWeight: FontWeight.w600),
                  // GoogleFonts.poboto(fontWeight: FontWeight.w600),
                  type: BottomNavigationBarType.fixed,
                  currentIndex: _pageIndex,
                  onTap: (index) {
                    _pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                    );
                  },
                  items: _buildThreeItems(),
                  // items: const [
                  //   BottomNavigationBarItem(
                  //       icon: Icon(Icons.home), label: "Home"),
                  //   BottomNavigationBarItem(
                  //       icon: Icon(Icons.list), label: "Orders"),
                  //   BottomNavigationBarItem(
                  //       icon: Icon(Icons.person), label: "Profile"),
                  // ],
                )),
          )),
    );
  }

  List<Widget> _buildThreePageViewChildren() {
    return <Widget>[Dashboard(), OrdersList(), ProfileScreen()];
  }

  List<BottomNavigationBarItem> _buildThreeItems() {
    return <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Container(
          margin: EdgeInsets.only(bottom: 5.h),
          child: Image.asset(
            _pageIndex == 0
                ? "assets/images/home_image.png"
                : "assets/images/un_home_image.dart.png",
            height: 20.h,
            width: 30.w,
            //olor: _pageIndex == 0 ? kAstro_yellow : KText,
            // width: 19.w,
          ),
        ),
        label: 'Home',
      ),
      BottomNavigationBarItem(
          icon: Container(
            margin: EdgeInsets.only(bottom: 5.h),
            child: Image.asset(
              _pageIndex == 1
                  ? "assets/images/order_image.png"
                  : "assets/images/unorder_image.png",
              //olor: _pageIndex == 1 ? kAstro_yellow : KText,
              height: 20.h,
              width: 30.w,
            ),
          ),
          label: 'Orders'),
      BottomNavigationBarItem(
          icon: Container(
            margin: EdgeInsets.only(bottom: 5.h),
            child: Image.asset(
              _pageIndex == 2
                  ? "assets/images/profile_image.png"
                  : "assets/images/unprofile_image.png",
              height: 20.h,
              // c:\Users\risha\Downloads\profile_image.png
              //olor: _pageIndex == 2 ? kAstro_yellow : KText,
              width: 30.w,
            ),
          ),
          label: 'Profile'),
    ];
  }
}


// class BottomNavigation extends StatefulWidget {
//   const BottomNavigation({super.key});

//   @override
//   State<BottomNavigation> createState() => _BottomNavigationState();
// }

// class _BottomNavigationState extends State<BottomNavigation> {
//   final PageController _pageController = PageController(initialPage: 0);
//   int _pageIndex = 0;

//   @override
//   void dispose() {
//     _pageController.dispose(); // Dispose PageController to prevent memory leaks
//     super.dispose();
//   }

//   Future<bool> _onWillPop() async {
//     return (await showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//             title: Text(
//               'Are you sure?',
//               style: GoogleFonts.roboto(
//                   fontSize: kEighteenFont,
//                   fontWeight: kFW600,
//                   color: Ktextcolor),
//             ),
//             content: Text(
//               'Do you want to exit this App',
//               style: GoogleFonts.roboto(
//                   fontSize: 13.sp, fontWeight: kFW600, color: KText),
//             ),
//             actions: <Widget>[
//               TextButton(
//                 onPressed: () => Navigator.of(context).pop(false),
//                 child: Text(
//                   'No',
//                   style: GoogleFonts.roboto(
//                       fontSize: kTwelveFont,
//                       fontWeight: kFW600,
//                       color: KdarkText),
//                 ),
//               ),
//               TextButton(
//                 onPressed: () => SystemNavigator.pop(),
//                 child: Text(
//                   'Yes',
//                   style: GoogleFonts.roboto(
//                       fontSize: kTwelveFont,
//                       fontWeight: kFW600,
//                       color: kAstroBgblue),
//                 ),
//               )
//             ],
//           ),
//         )) ??
//         false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//         onWillPop: _onWillPop,
//         child: Scaffold(
//             extendBody: true,
//             body: PageView(
//               controller: _pageController,
//               physics: const NeverScrollableScrollPhysics(),
//               onPageChanged: (int index) {
//                 setState(() {
//                   _pageIndex = index;
//                 });
//               },
//               children: _buildThreePageViewChildren(),
//             ),
//             bottomNavigationBar: Container(
//               margin: EdgeInsets.all(5.r),
//               padding: EdgeInsets.all(10.r),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(10.r),
//                 child: BottomNavigationBar(
//                   elevation: 0,
//                   backgroundColor: KbluethemeThick,
//                   selectedItemColor: kAstro_yellow,
//                   unselectedItemColor: Kwhite.withOpacity(0.8),
//                   selectedLabelStyle:
//                       GoogleFonts.poppins(fontWeight: FontWeight.w600),
//                   type: BottomNavigationBarType.fixed,
//                   items: _buildThreeItems(),
//                   onTap: (int index) {
//                     if (_pageController.hasClients) {
//                       _pageController.animateToPage(
//                         index,
//                         duration: const Duration(milliseconds: 200),
//                         curve: Curves.easeInOut,
//                       );
//                     }
//                   },
//                   currentIndex: _pageIndex,
//                 ),
//               ),
//             )));
//   }

//   List<Widget> _buildThreePageViewChildren() {
//     return <Widget>[
//       const Dashboard(),
//       const OrdersList(),
//       const ProfileScreen(),
//     ];
//   }

  // List<BottomNavigationBarItem> _buildThreeItems() {
  //   return <BottomNavigationBarItem>[
  //     BottomNavigationBarItem(
  //       icon: _buildNavIcon("home_image.png", "un_home_image.dart.png", 0),
  //       label: 'Home',
  //     ),
  //     BottomNavigationBarItem(
  //       icon: _buildNavIcon("order_image.png", "unorder_image.png", 1),
  //       label: 'Orders',
  //     ),
  //     BottomNavigationBarItem(
  //       icon: _buildNavIcon("profile_image.png", "unprofile_image.png", 2),
  //       label: 'Profile',
  //     ),
  //   ];
  // }

  // Widget _buildNavIcon(String active, String inactive, int index) {
  //   return Container(
  //     margin: EdgeInsets.only(bottom: 5.h),
  //     child: Image.asset(
  //       _pageIndex == index
  //           ? "assets/images/$active"
  //           : "assets/images/$inactive",
  //       height: 20.h,
  //       width: 30.w,
  //     ),
  //   );
  // }


// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:bharatastro/untils/export_file.dart';

// class Bottom_navigation extends StatefulWidget {
//   const Bottom_navigation({super.key});

//   @override
//   State<Bottom_navigation> createState() => _Bottom_navigationState();
// }

// class _Bottom_navigationState extends State<Bottom_navigation> {
// //  final PageController _pageController = PageController();
//   final PageController _pageController = PageController(initialPage: 0);

//   int _pageIndex = 0;
//   DateTime timeBackPressed = DateTime.now();
//   Future<bool> _onWillPop() async {
//     return (await showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//             title: Text(
//               'Are you sure?',
//               style: GoogleFonts.roboto(
//                   fontSize: kEighteenFont,
//                   fontWeight: kFW600,
//                   color: Ktextcolor),
//             ),
//             content: Text(
//               'Do you want to exit this App',
//               style: GoogleFonts.roboto(
//                   fontSize: 13.sp, fontWeight: kFW600, color: KText),
//             ),
//             actions: <Widget>[
//               TextButton(
//                 onPressed: () => Navigator.of(context).pop(false),
//                 child: Text(
//                   'No',
//                   style: GoogleFonts.roboto(
//                       fontSize: kTwelveFont,
//                       fontWeight: kFW600,
//                       color: KdarkText),
//                 ),
//               ),
//               TextButton(
//                 onPressed: () => SystemNavigator.pop(),
//                 // <-- SEE HERE
//                 child: Text(
//                   'Yes',
//                   style: GoogleFonts.roboto(
//                       fontSize: kTwelveFont,
//                       fontWeight: kFW600,
//                       color: kAstroBgblue),
//                 ),
//               )
//             ],
//           ),
//         )) ??
//         false;
//   }

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//         onWillPop: _onWillPop,
//         child: Scaffold(
//             extendBody: true,
//             body: PageView(
//               controller: _pageController,
//               physics: const NeverScrollableScrollPhysics(),
//               onPageChanged: (int index) {
//                 setState(
//                   () {
//                     _pageIndex = index;
//                   },
//                 );
//                 if (index == 2) {}
//               },
//               children: _buildThreePageViewChildren(),
//             ),
//             bottomNavigationBar: Container(
//               margin: EdgeInsets.all(5.r),
//               padding: EdgeInsets.all(10.r),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(10.r),
//                 child: BottomNavigationBar(
//                   elevation: 0,
//                   backgroundColor: KbluethemeThick,
//                   selectedItemColor: kAstro_yellow,
//                   unselectedItemColor: Kwhite.withOpacity(0.8),
//                   selectedLabelStyle:
//                       GoogleFonts.poppins(fontWeight: FontWeight.w600),
//                   // GoogleFonts.poboto(fontWeight: FontWeight.w600),
//                   type: BottomNavigationBarType.fixed,
//                   items: _buildThreeItems(),
//                   onTap: (int index) {
//                     _pageController.animateToPage(
//                       index,
//                       duration: const Duration(milliseconds: 200),
//                       curve: Curves.easeInOut,
//                     );
//                   },
//                   currentIndex: _pageIndex,
//                 ),
//               ),
//             )));
//   }

//   List<Widget> _buildThreePageViewChildren() {
//     return <Widget>[Dashboard(), OrdersList(), ProfileScreen()];
//   }

//   List<BottomNavigationBarItem> _buildThreeItems() {
//     return <BottomNavigationBarItem>[
//       BottomNavigationBarItem(
//         icon: Container(
//           margin: EdgeInsets.only(bottom: 5.h),
//           child: Image.asset(
//             _pageIndex == 0
//                 ? "assets/images/home_image.png"
//                 : "assets/images/un_home_image.dart.png",
//             height: 20.h,
//             width: 30.w,
//             //olor: _pageIndex == 0 ? kAstro_yellow : KText,
//             // width: 19.w,
//           ),
//         ),
//         label: 'Home',
//       ),
//       BottomNavigationBarItem(
//           icon: Container(
//             margin: EdgeInsets.only(bottom: 5.h),
//             child: Image.asset(
//               _pageIndex == 1
//                   ? "assets/images/order_image.png"
//                   : "assets/images/unorder_image.png",
//               //olor: _pageIndex == 1 ? kAstro_yellow : KText,
//               height: 20.h,
//               width: 30.w,
//             ),
//           ),
//           label: 'Orders'),
//       BottomNavigationBarItem(
//           icon: Container(
//             margin: EdgeInsets.only(bottom: 5.h),
//             child: Image.asset(
//               _pageIndex == 2
//                   ? "assets/images/profile_image.png"
//                   : "assets/images/unprofile_image.png",
//               height: 20.h,
//               // c:\Users\risha\Downloads\profile_image.png
//               //olor: _pageIndex == 2 ? kAstro_yellow : KText,
//               width: 30.w,
//             ),
//           ),
//           label: 'Profile'),
//     ];
//   }
// }
