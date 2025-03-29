import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:bharatastro/untils/export_file.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  DashboardController dashController = Get.put(DashboardController());
  late Uint8List imageBytes;
  @override
  void initState() {
    setState(() {
      dashController.editImageController.text =
          dashController.userDetails["uplaodImage"] ?? "string";
    });
    if (dashController.editImageController.text != "string") {
      setState(() {
        imageBytes = base64Decode(dashController.editImageController.text);
      });
      // Uint8List imageBytes =
      //     base64Decode(dashController.editImageController.text);
    }

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Kbg_theme_two,
        appBar: AppBar(
            backgroundColor: KbluethemeThick,
            automaticallyImplyLeading: false,
            titleSpacing: 20,
            title: Text(
              "Profile",
              style: GoogleFonts.dmSerifDisplay(
                  color: Kwhite, fontSize: kTwentyFont, fontWeight: kFW400),
            )),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.all(16),
                  //  width: 300,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: kblack.withOpacity(0.1),
                        blurRadius: 2.r,
                        offset: Offset(0, 1),
                        spreadRadius: 2.r,
                      )
                    ],
                    color: Kwhite,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          dashController.editImageController.text == "string"
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(300),
                                  child: Image.asset(
                                    "assets/images/no_profile.jpg",
                                    // fit: BoxFit.contain,
                                    height: 100.h,
                                    width: 100.w,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(300),
                                  child: Image.memory(
                                    imageBytes,
                                    height: 100.h,
                                    width: 100.w,
                                    fit: BoxFit.cover,
                                    //  fit: BoxFit.cover,
                                  ),
                                ),
                          // Positioned(
                          //   bottom: 5,
                          //   right: 5,
                          //   child: CircleAvatar(
                          //     radius: 18,
                          //     backgroundColor: Kwhite,
                          //     child: CircleAvatar(
                          //       radius: 14,
                          //       backgroundColor: Kbluetheme,
                          //       child: Icon(
                          //         Icons.edit,
                          //         color: Kwhite,
                          //         size: 18.sp,
                          //       ),
                          //     ),
                          //   ),
                          // )

                          SizedBox(
                            width: 15.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${dashController.userDetails["userName"]}",
                                //  "Shema Raj",
                                style: GoogleFonts.dmSerifDisplay(
                                    color: kblack,
                                    fontSize: kEighteenFont,
                                    fontWeight: kFW500),
                              ),
                              // SizedBox(
                              //   height: 4.w,
                              // ),
                              // Text("DOB : January 24,2025",
                              //     style: GoogleFonts.poppins(
                              //         fontSize: 13.sp,
                              //         fontWeight: kFW500,
                              //         color: KText)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )),
              InkWell(
                onTap: () {
                  Get.toNamed(kEditprofile);
                },
                child: Container(

                    //  width: 300,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(left: 16.w, right: 16.w, top: 10.h),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: kblack.withOpacity(0.1),
                          blurRadius: 2.r,
                          offset: Offset(0, 1),
                          spreadRadius: 2.r,
                        )
                      ],
                      color: Kwhite,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/images/User Icon.png",
                              fit: BoxFit.cover,
                              height: 24.h,
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Text("User Details",
                                style: GoogleFonts.poppins(
                                    fontSize: kFourteenFont,
                                    fontWeight: kFW400,
                                    color: kblack)),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: kblack,
                          size: 22.sp,
                        ),
                      ],
                    )),
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(kChangePassword);
                },
                child: Container(

                    //  width: 300,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(left: 16.w, right: 16.w, top: 10.h),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: kblack.withOpacity(0.1),
                          blurRadius: 2.r,
                          offset: Offset(0, 1),
                          spreadRadius: 2.r,
                        )
                      ],
                      color: Kwhite,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/images/Lock.png",
                              fit: BoxFit.cover,
                              height: 24.h,
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Text("Change Password",
                                style: GoogleFonts.poppins(
                                    fontSize: kFourteenFont,
                                    fontWeight: kFW400,
                                    color: kblack)),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: kblack,
                          size: 22.sp,
                        ),
                      ],
                    )),
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(kSupport);
                },
                child: Container(

                    //  width: 300,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(left: 16.w, right: 16.w, top: 10.h),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: kblack.withOpacity(0.1),
                          blurRadius: 2.r,
                          offset: Offset(0, 1),
                          spreadRadius: 2.r,
                        )
                      ],
                      color: Kwhite,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/images/Support Icon.png",
                              fit: BoxFit.cover,
                              height: 24.h,
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Text("Support",
                                style: GoogleFonts.poppins(
                                    fontSize: kFourteenFont,
                                    fontWeight: kFW400,
                                    color: kblack)),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: kblack,
                          size: 22.sp,
                        ),
                      ],
                    )),
              ),
              Container(

                  //  width: 300,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(left: 16.w, right: 16.w, top: 10.h),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: kblack.withOpacity(0.1),
                        blurRadius: 2.r,
                        offset: Offset(0, 1),
                        spreadRadius: 2.r,
                      )
                    ],
                    color: Kwhite,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/images/About App Icon.png",
                            fit: BoxFit.cover,
                            height: 24.h,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text("About App",
                              style: GoogleFonts.poppins(
                                  fontSize: kFourteenFont,
                                  fontWeight: kFW400,
                                  color: kblack)),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: kblack,
                        size: 22.sp,
                      ),
                    ],
                  )),
              // InkWell(
              //   onTap: () {
              //     Get.toNamed(kPurchaseCard);
              //   },
              //   child: Container(

              //       //  width: 300,
              //       padding: EdgeInsets.all(10),
              //       margin: EdgeInsets.only(left: 16.w, right: 16.w, top: 10.h),
              //       decoration: BoxDecoration(
              //         boxShadow: [
              //           BoxShadow(
              //             color: kblack.withOpacity(0.1),
              //             blurRadius: 2.r,
              //             offset: Offset(0, 1),
              //             spreadRadius: 2.r,
              //           )
              //         ],
              //         color: Kwhite,
              //         borderRadius: BorderRadius.circular(8.r),
              //       ),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Row(
              //             mainAxisAlignment: MainAxisAlignment.start,
              //             children: [
              //               Icon(
              //                 Icons.subscriptions_outlined,
              //                 size: 22.sp,
              //               ),
              //               // Image.asset(
              //               //   "assets/images/About App Icon.png",
              //               //   fit: BoxFit.cover,
              //               //   height: 24.h,
              //               // ),
              //               SizedBox(
              //                 width: 8.w,
              //               ),
              //               Text("Update Plan",
              //                   style: GoogleFonts.poppins(
              //                       fontSize: kFourteenFont,
              //                       fontWeight: kFW400,
              //                       color: kblack)),
              //             ],
              //           ),
              //           Icon(
              //             Icons.arrow_forward_ios,
              //             color: kblack,
              //             size: 22.sp,
              //           ),
              //         ],
              //       )),
              // ),
              Container(

                  //  width: 300,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(left: 16.w, right: 16.w, top: 10.h),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: kblack.withOpacity(0.1),
                        blurRadius: 2.r,
                        offset: Offset(0, 1),
                        spreadRadius: 2.r,
                      )
                    ],
                    color: Kwhite,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/images/Icon Container (1).png",
                            fit: BoxFit.cover,
                            height: 24.h,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text("Terms and Conditions",
                              style: GoogleFonts.poppins(
                                  fontSize: kFourteenFont,
                                  fontWeight: kFW400,
                                  color: kblack)),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: kblack,
                        size: 22.sp,
                      ),
                    ],
                  )),
              Container(

                  //  width: 300,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(left: 16.w, right: 16.w, top: 10.h),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: kblack.withOpacity(0.1),
                        blurRadius: 2.r,
                        offset: Offset(0, 1),
                        spreadRadius: 2.r,
                      )
                    ],
                    color: Kwhite,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/images/Icon Container (2).png",
                            fit: BoxFit.cover,
                            height: 24.h,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text("Privacy Policies",
                              style: GoogleFonts.poppins(
                                  fontSize: kFourteenFont,
                                  fontWeight: kFW400,
                                  color: kblack)),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: kblack,
                        size: 22.sp,
                      ),
                    ],
                  )),
              InkWell(
                onTap: () {
                  Get.toNamed(kAppVersion);
                },
                child: Container(

                    //  width: 300,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(left: 16.w, right: 16.w, top: 10.h),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: kblack.withOpacity(0.1),
                          blurRadius: 2.r,
                          offset: Offset(0, 1),
                          spreadRadius: 2.r,
                        )
                      ],
                      color: Kwhite,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/images/Group.png",
                              //  "assets/images/Icon Container (3).png",
                              fit: BoxFit.cover,
                              height: 24.h,
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Text("App Version",
                                style: GoogleFonts.poppins(
                                    fontSize: kFourteenFont,
                                    fontWeight: kFW400,
                                    color: kblack)),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: kblack,
                          size: 22.sp,
                        ),
                      ],
                    )),
              ),
              InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Are You Sure',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.roboto(
                                  fontSize: 12.sp,
                                  fontWeight: kFW700,
                                  color: KdarkText)),
                          content: Text('You Want To LogOut ?',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.roboto(
                                  fontSize: 12.sp,
                                  fontWeight: kFW700,
                                  color: KdarkText.withOpacity(0.7))),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: Text('No',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.roboto(
                                      fontSize: 12.sp,
                                      fontWeight: kFW700,
                                      color: KdarkText)),
                            ),
                            TextButton(
                              onPressed: () async {
                                UserSimplePreferences.clearAllData();
                                Get.delete<AuthController>();
                                Get.delete<DashboardController>();
                                Get.delete<DummyController>();
                                //
                                // Get.put(AuthController());
                                AuthController authcontroller =
                                    Get.put(AuthController());
                                DashboardController dashController =
                                    Get.put(DashboardController());
                                DummyController dummycontroller =
                                    Get.put(DummyController());
                                // dashController.ordersList.value;
                                Get.toNamed(kSignIns);

                                //   AuthController authcontroller = Get.put(AuthController());
                                //   DashboardController dashController = Get.put(DashboardController());
                                //   DummyController dummycontroller = Get.put(DummyController());
                                //  UserSimplePreferences.clearAllData();
                                //   Get.toNamed(kSignIns);
                              },
                              /////////////////////////////////////////////////////////
//                               onPressed: () async {

//   // Delete the current instance of the controller
//   Get.delete<YourController>();

//   // Reinitialize the controller to ensure it starts fresh
//   Get.put(YourController());

//   // Navigate to the login screen
//   Get.toNamed(kSignIns);
// }
                              //////////////////////////////////////////////
                              child: Text('Yes',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.roboto(
                                      fontSize: 12.sp,
                                      fontWeight: kFW700,
                                      color: KdarkText)),
                            )
                          ],
                        );
                      });
                },
                child: Container(

                    //  width: 300,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(
                        left: 16.w, right: 16.w, top: 10.h, bottom: 100.h),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: kblack.withOpacity(0.1),
                          blurRadius: 2.r,
                          offset: Offset(0, 1),
                          spreadRadius: 2.r,
                        )
                      ],
                      color: Kwhite,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/images/Icon Container (3).png",
                              fit: BoxFit.cover,
                              height: 24.h,
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Text("Log Out",
                                style: GoogleFonts.poppins(
                                    fontSize: kFourteenFont,
                                    fontWeight: kFW400,
                                    color: KRed)),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: kblack,
                          size: 22.sp,
                        ),
                      ],
                    )),
              ),
              // SizedBox(
              //   height: 50.h,
              // )
            ],
          ),
        ));
  }
}
